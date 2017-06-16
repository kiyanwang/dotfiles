Dotfiles
============

My shell and other tool configs, currently includes:

* (neo)vim
* tmux
* git
* .zshrc
* peco



## Vim

I'm currently still using pathogen to install my vim plugins, to make it easier i've added a `bootstrap.sh` script that will install them all. Also I've recently tidied up my `.vimrc` file to make it easier to follow. Here's what my current setup looks like :)

![My Vim Setup](https://raw.githubusercontent.com/kiyanwang/dotfiles/master/vim_setup.png)


## Aliases

I have a number of useful aliases that I've been using over the years, some of them I found online, other's I've written myself, they're all documented. I'll mention one or two in more detail here.

### awslookup

I needed a quick tool to lookup instances in several aws accounts. The `aws cli` is very good for this but querying it can be quite difficult. I created a small wrapper script around a query I created that lets me list information about instances based on the `tag:Name`.

To use it make sure you have configured your `aws cli` correctly, you should
have a `~/.aws/config` file that contains you're preferred regions:

```bash
[default]
region = eu-west-1

[profile staging]
region = eu-west-1

[profile production]
region = eu-west-1
```

and your `~/.aws/credentials` file should name each profile and specify the keys to use e.g:

```bash
[default]
aws_access_key_id = <XXX>
aws_secret_access_key = <XXX>

[production]
aws_access_key_id = <XXX>
aws_secret_access_key = <XXX>

[staging]
aws_access_key_id = <XXX>
aws_secret_access_key = <XXX
```

Then to use the tool the command is:

```bash
awslookup <profile> <string to match>

e.g

awslookup staging persona*
```

It outputs a table with the matching instance details:


![awslookup](https://raw.githubusercontent.com/kiyanwang/dotfiles/master/awslookup.png)
