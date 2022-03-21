## ZI Annex `BIN-GEM-NODE` 
 
### 💡 [Wiki: z-a-bin-gem-node](https://z.digitalclouds.dev/docs/ecosystem/annexes/bin-gem-node)

## Introduction

This repository compatible with [ZI](https://github.com/z-shell-zi)

A Z-Shell ZI Annex (i.e. an extension) that provides functionality, which
allows to:

1. Run programs and scripts without adding anything to `$PATH`,
2. Install and run Ruby [gems](https://github.com/rubygems/rubygems),
   [Node](https://github.com/npm/cli) and [Python](https://python.org)
   modules from within a local directory with
   [$GEM_HOME](https://guides.rubygems.org/command-reference/#gem-environment)
   ,
   [$NODE_PATH](https://nodejs.org/api/modules.html#modules_loading_from_the_global_folders)
   and
   [$VIRTUALENV](https://docs.python.org/3/tutorial/venv.html)
   automatically set,
3. Run programs, scripts and functions with automatic `cd` into the plugin
   or snippet directory, plus also with automatic standard output
   & standard error redirecting.
4. Source scripts through an automatically created function with the above
   `$GEM_HOME`, `$NODE_PATH`, `$VIRTUALENV` and `cd` features available,
5. Create the so called `shims` known from
   [rbenv](https://github.com/rbenv/rbenv) – the same feature as the first
   item of this enumaration – of running a program without adding anything
   to `$PATH` with all of the above features, however through an automatic
   **script** created in `$ZPFX/bin`, not a **function** (the first item
   uses a function-based mechanism),
6. Automatic updates of Ruby gems and Node modules during regular plugin and
   snippet updates with `zi update …`.

# Installation

Simply load like a regular plugin, i.e.:

```zsh
zi light z-shell/z-a-bin-gem-node
```

After executing this command you can then use the new ice-mods provided by
the annex.
