# Notebook

Most of the wiki content is in notebook entries. I have a tendency to write too
much in these, which would be fine except it sometimes prevents me from
finishing them. So I'm currently trying to force a terse style more similar to
traditional notebook entries than the blog posts they've sometimes resembled in
the past.

Layout
------

You can organize them however you want, but I've found a simple list of dated
folders to work best. That way I don't have to think about which project(s) the
entry fits under or look in multiple places for it.

Each folder has a `readme.md` with markdown text, although it could be written
in other formats. It might also have images, code, spreadsheets, and other
data.  They can be linked to by filename relative to the folder, which keeps
everything easy.

Sidebar
-------

After I started accumulating a lot of notebook entries, I wanted to be able to
jump to the most recent ones quickly. The proper way to put them in the menu is
probably using [HStringTemplate](https://wiki.haskell.org/HStringTemplate), but
instead I just wrote [a shell script](/code/scripts/sitenav.sh) that edits
[sitenav.st](/code/gitit/templates/sitenav.st) directly. Works fine so far!
Note that it's specific to my naming scheme, so adjust it if you want something
different. Also, changes don't take effect until you restart gitit.
<!-- TODO get gitit to display .conf and other random text files -->

I tried running it as a pre-commit hook in git, but that caused problems when
merging different instances of the wiki. So now I just run it manually. A
crontab would also work. <!-- TODO try again? -->
