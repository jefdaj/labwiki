---
title: Git-anex and syncing
...

Gitit works with the git, darcs, or mercurial version control systems. Most
people use git though, and if you do you can take advantage of a another great
tool: git-annex. It lets you version control files that are too large to check
into git. Perfect for reproducable science! I keep genomes and sequencing data
in my wiki. Also a lot of photos, and even a few microscope videos.

How it works
------------

The trick is that git-annex moves your files into `.git/annex/objects` and
replaces them with symlinks. Files are named by their SHA256 hashes. Whenever
you edit one git-annex re-scans it and updates the links. That way you get a
complete history of the changes without ever checking the content into git.

It also includes the `git annex sync` command, which syncs the git history +
object files between repositories. There are some other more advanced features
too:

* Can use "dumb" non-git drives or web services as storage, and optionally
  encrypt them

* Customizable rules for which files should go to which repositories and how
  many redundant copies you want of each across all your devices

* A web-app that automates as much as possible to turn it into a kind of
  decentralized DropBox.

I'm not aware of anything similar using other version control systems, but also
haven't looked. It shouldn't be hard to add darcs/mercurial support for them
too if you want. You just have to tell Filestore (the version control library
used by gitit) to follow symlinks. See my commit
[here](https://github.com/jgm/filestore/commit/94e2cdbe3fab89aa3ae06961b5b6c341cb8db8a3).

Basic usage
-----------

Nothing about gitit interacts with git-annex directly; you just use them both
with the same repository. To "annex" files you run `git annex add`, and to edit
them again you `git annex unlock`. Annexing stages the symlinks in git, then
you commit it normally. You can mix normal files and annexed symlinks in a
commit. My rule of thumb is any text file under a couple hundred KB gets added
normally, and the rest get annexed.

There's no web interface support for this yet, although it would be possible to
add logic so that the gitit "upload file" function switches to git annex above
a certain file size, or based on a checkbox or something. I could set that up
if anyone is interested, but personally haven't found a need for it.

Syncing wikis
-------------

I keep an instance of the wiki running on my laptop, one on my lab computer,
and one at home. Each is added as a an ssh remote of the others. Running `git
annex sync --content` would keep everything in sync over the internet.

Because of the large files, though, what I actually do is keep a fourth
repository on a USB drive and sync it with each computer. Git annex uses it as
a "transfer" repo, which means it will keep copies of any files not yet
propogated to the other repositories.

My laptop has limited space, so I also set it to drop large files (leaving
broken symlinks behind). Git annex checks that the other repositories have
copies first. When I need to work on a specific large file I `git annex get`
it, which downloads the file with the correct hash from wherever it's actually
stored. I do that over the internet.
