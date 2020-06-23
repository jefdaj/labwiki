# Gitit

<!-- TODO explain notebook/ -->
<!-- TODO explain code/gitit -->
<!-- TODO explain code/scripts -->

Labwiki uses [my fork](https://github.com/jefdaj/gitit) of
[gitit](https://github.com/jgm/gitit) to edit and display pages. You can also
edit the files in the git repository directly, which is what I do most of the
time. One detail to remember is gitit only displays things that have been
commited in git. I've added a few new plugins and supporting code for them in
my version, but they don't affect how the basic wiki works.

Script
------

There's [a small launch script](/code/scripts/labwiki.sh) that I run on startup.
It should work in a crontab, `rc.local`, a `screen`/`tmux` session, whatever.

Config files
------------

The rest of the [gitit-related code](/code/gitit/) is a customized copy of [the
default data dir](https://github.com/jgm/gitit/tree/master/data) that comes
with the package. Any files you add will override the defaults.

The most important part is [the main config file](/code/gitit/gitit.conf), but
there are also [static web files](/code/gitit/static/) (images, css) and dynamic
[HTML templates](/code/gitit/templates/). They're written in a pretty simple
templating language: you surround variables with dollar signs, and it supports
`if` and `foreach` statements.
