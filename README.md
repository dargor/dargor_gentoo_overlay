# My custom Gentoo overlay

Personal overlay for some packages I care of.

## Installation

Install `app-eselect/eselect-repository` (new way) or `app-portage/layman` (old way), then:

```sh
# for app-eselect/eselect-repository
eselect repository enable dargor

# for app-portage/layman
layman -a dargor

# for both
emaint sync -r dargor

# finally, if you use app-portage/eix (you really should)
eix-postsync
eix-diff
```

Now you can use `emerge` like usual.

## License

GNU General Public License, version 2.
