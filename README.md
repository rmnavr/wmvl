# WMVL — Wolfram Mathematica Vim Link

WMVL allows you to edit WM code (Wolfram Language code) in your favourite code editor instead of in WM Frontend.
It provides fully established workflow for Vim, but also gives base for building workflow in any other editor.

WMVL consists of 2 parts:
1. WM Notebook that observes changes in exchange plane-text file (this file is stored physically on disk).
   Notebook checks exchange file once every 3 seconds.
   > If you are using another editor (not Vim), you'll just need to automate how you send code from your editor to this exchange file. That's it.
2. Minimalistic Vim plugin that will write user-selected code to exchange file

Overall it feels like REPL in Python and similar languages.

# How it works

You place 2 files in some folder of your choice:
1. `_WMVimLink.nb` — WM Notebook (observer)
2. `_WMVimLink_tmp.txt` — exchange file (well, `_WMVimLink.nb` will create it anyway if it is not found)

Try launching `_WMVimLink.nb` (you might be asked to enable Dynamic content — please do it).
All functionality is baked into pinned cell:

<p align="center">
<img src="https://github.com/rmnavr/wmvl/blob/main/Docs/nb_header.png?raw=true" alt="Notebook header" />
</p>

Then write some WM code into `_WMVimLink_tmp.txt` and save it. You'll see that at next check cycle (occuring once every 3 seconds)
`_WMVimLink.nb` will pull code from `_WMVimLink_tmp.txt`, delete all previous cells and create new cell with code from exchange file.

Imported cells have bluish coloring and symbol «↑» on the left.

# Vim plugin

Add this code somewhere to your VimRC. Be sure to set correct directories for `_WMVimLink.nb` and `_WMVimLink_tmp.txt` files.
```vimscript
to be done ...
```

And then create hotkeys for 3 commands:
* OpenWMFile()
* WriteSelectedToWMExchangeFile()
* WriteCurLineToWMExchangeFile()
