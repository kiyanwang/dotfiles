# linear.nu lives in the config dir (not autoload) so it isn't double-loaded:
# autoloading a file that another autoload file `use`s triggers a
# "Can't evaluate block in IR mode" error. Reference it by a parse-time const path.
const linear = ($nu.default-config-dir | path join "linear.nu")
use $linear

def --wrapped cc [...args] {
    claude --dangerously-skip-permissions ...$args
}

def --wrapped ccc [...args] {
    cc -c ...$args
}

def "cc deps" [project?] {
    mut p = $project

    if $p == null  {
        $p = (linear project pick)
    }
    cc $"Create an issue in ($p) to update dependencies from the current diff"
}

def "cc conflicts"  [] {
    cc "Fix the conflicts in the current commit with jj."
}

def "cc fix" [id :string, -m: string] {
    mut prompt = $"Implement issue ($id)"
    if $m != null {
        $prompt = $prompt + " " + $m
    }
    cc $prompt
}

def "cc issue" [-m: string] {
    let project = (linear project pick)
    mut prompt = $"Create an issue in ($project), it must contain requirements and acceptance criteria. "
    if $m != null {
        $prompt = $prompt + " " + $m
    }
    cc $prompt
}

def "cc linear todo" [-m: string, --team (-t)] {
    let issue = (linear issues todo --team=$team)
    mut prompt = $"Work on an issue ($issue)"
    if $m != null {
        $prompt = $prompt + " " + $m
    }
    cc $prompt
}
