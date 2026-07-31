# Path to the cached projects file in nushell's cache dir.
def projects-cache [] {
    [$nu.cache-dir "linear-projects.json"] | path join
}

# Path to the cached teams file in nushell's cache dir.
def teams-cache [] {
    [$nu.cache-dir "linear-teams.json"] | path join
}

# True if the given cache file exists and was refreshed within the last 24h.
def fetched-recently [f: string] {
    if not ($f | path exists) { return false }
    let updated = (open $f | get updatedAt | into datetime)
    ((date now) - $updated) < 24hr
}

def call [body] {
    http post --content-type application/json --headers {
        Authorization: $env.LINEAR_API_KEY
    } https://api.linear.app/graphql $body
}

# Fetch non-completed projects from Linear and cache them as
# { updatedAt: <timestamp>, projects: ["<name> [id=<id>]" ...] }.
export def "projects fetch" [] {
    let body = ({
        query: "query { projects(first: 250) { nodes { id name state } } }"
    } | to json)

    let resp = call $body

    let names = ($resp.data.projects.nodes
        | where state != "completed"
        | each {|p| $"($p.name) [id=($p.id)]" })

    let out = { updatedAt: (date now | format date "%+"), projects: $names }

    mkdir $nu.cache-dir
    $out | to json | save -f (projects-cache)
    print $"Cached ($names | length) projects"
}

# Pick a project from the cache, fetching first if stale (>24h) or missing.
export def "project pick" [] {
    if not (fetched-recently (projects-cache)) {
        projects fetch
    }
    open (projects-cache) | get projects | input list --fuzzy
}

# Fetch teams from Linear and cache them as
# { updatedAt: <timestamp>, teams: ["<name> [id=<id>]" ...] }.
export def "teams fetch" [] {
    let body = ({
        query: "query { teams(first: 250) { nodes { id name } } }"
    } | to json)

    let resp = call $body

    let names = ($resp.data.teams.nodes
        | each {|t| $"($t.name) [id=($t.id)]" })

    let out = { updatedAt: (date now | format date "%+"), teams: $names }

    mkdir $nu.cache-dir
    $out | to json | save -f (teams-cache)
    print $"Cached ($names | length) teams"
}

# Pick a team from the cache, fetching first if stale (>24h) or missing.
export def "team pick" [] {
    if not (fetched-recently (teams-cache)) {
        teams fetch
    }
    open (teams-cache) | get teams | input list --fuzzy
}

# Extract the "[id=<uuid>]" id from a picked "<name> [id=<id>]" string,
# falling back to the string itself if it's already a bare id.
def extract-id [s: string] {
    $s | parse --regex 'id=(?<id>[^\]]+)' | get id.0? | default $s
}

# Pick a Todo-state issue, scoped to a project or a team. With -t/--team,
# picks a team and scopes to it. Otherwise scopes by project, picking it
# when -p is omitted. Returns "<identifier> <title> [id=<id>]".
export def "issues todo" [--project (-p): string, --team (-t)] {
    let scope = if $team {
        { kind: "team", value: (team pick) }
    } else {
        { kind: "project", value: (if $project == null { project pick } else { $project }) }
    }

    let id = (extract-id $scope.value)

    let body = ({
        query: $"query\($id: String!\) { ($scope.kind)\(id: $id\) { issues\(first: 250\) { nodes { id identifier title state { type } } } } }"
        variables: { id: $id }
    } | to json)

    call $body
        | get (["data" $scope.kind "issues" "nodes"] | into cell-path)
        | where state.type == "unstarted"
        | each {|i| $"($i.identifier) ($i.title) [id=($i.id)]" }
        | input list --fuzzy
}
