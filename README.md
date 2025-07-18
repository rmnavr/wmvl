
<!-- WMVL Intro ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

> project is not yet ready

# WMVL — Wolfram Mathematica Vim Link

WMVL allows you to edit WM code (Wolfram Language code) in your favourite code editor instead of in WM Frontend.
It provides fully established workflow for Vim, but also gives base for building workflow in any other editor.

WMVL consists of 2 parts:
1. WM Notebook that observes changes in exchange plane-text file (this file is stored physically on disk).
   Notebook checks exchange file once every 3 seconds.
   > If you are using another editor (not Vim), you'll just need to automate how you
   > send code from your editor to this exchange file. That's it.
2. Minimalistic Vim plugin that will send user-selected code from Vim to exchange file

Overall it feels like REPL in Python and similar languages.

> By the way, `_WMVimLink.nb` uses [wmcells](https://github.com/rmnavr/wmcells) stylesheet.

<!-- __________________________________________________________________________/ }}}1 -->
<!-- How to run it ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# How to run it

Place these 2 files in some folder of your choice:
1. `_WMVimLink.nb` — WM Notebook (observer)
2. `_WMVimLink_tmp.txt` — exchange file (well, `_WMVimLink.nb` will create it anyway if it is not found)

Launch `_WMVimLink.nb` (you might be asked to enable Dynamic content — please do it).
All functionality is baked into pinned cell (example below also shows imported cell with code `Print @ 3`):

<p align="center">
<img src="https://github.com/rmnavr/wmvl/blob/main/docs/nb_header.png?raw=true" alt="Notebook header" />
</p>

Then write some WM code into `_WMVimLink_tmp.txt` and save it.

You'll see that at next check cycle (occuring once every 3 seconds) `_WMVimLink.nb` will:
1. Delete all previously imported cells (including their outputs). Notice that WMVL won't delete user-created cells.
   > Imported cells have have bluish coloring and symbol «↑» on the left.
2. Pull code from `_WMVimLink_tmp.txt`, place it in newly created import-cell, and run the code.

<!-- __________________________________________________________________________/ }}}1 -->
<!-- Vim plugin ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ {{{1 -->

# Vim plugin

WMVL Vim plugin works as follows:
* For file in current Vim buffer, WMVL checks if it's dir contains `_WMVimLink_tmp.txt` file.
  In such a case WMVL will write to it. Make sure `_WMVimLink.nb` is in this directory too (for it to be able to observe exchange file).
* Otherwise, WMVL will write to hard-coded `_WMVimLink_tmp.txt` file. `_WMVimLink.nb` should be there too.

Such behaviour entails:
* If you want to create quick scripts, just create `somefile.txt` anywhere, and write WL code to it. WMVL plugin will work via hard-coded exchange files.
* For project that needs to read data from it's directory via `NotebookDirectory[]` (like for accessing input data and such) 
  make sure to place `_WMVimLink_tmp.txt` and `_WMVimLink.nb` in it's dir

You need just 3 functions in Vim to automate writing code to exchange file:
* OpenWMObserver() — to open `_WMVimLink.nb` file
* WriteSelectedLinesToWMExchangeFile() — to send selected code to `_WMVimLink_tmp.txt` file
* WriteCurLineToWMExchangeFile() — to send current line to `_WMVimLink_tmp.txt` file 

Add this code somewhere to your VimRC. Be sure to set correct directories for `_WMVimLink.nb` and `_WMVimLink_tmp.txt` files.
Remap to other hotkeys if needed.
```vimscript
to be done ...
```

# Writing plugins for other editors

If you use some other editor (rather than Vim), you'll need to implement similar functionality
to one described in [Vim plugin](#Vim-plugin) section. 

<!-- __________________________________________________________________________/ }}}1 -->


