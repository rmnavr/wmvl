# WMVL — Wolfram Mathematica Vim Link

WMVL allows you to edit WM code (Wolfram Language code) in your favourite code editor instead of in WM Frontend.
It provides fully established workflow for Vim, but also gives base for building workflow in any other editor.

WMVL consists of 2 parts:
1. WM Notebook that observes changes in exchange file (this file is stored physically on disk)
   > If you are using another editor (not Vim), you'll just need to automate how you send code from your editor to this exchange file. That's it.
2. Minimalistic Vim plugin that will write user-selected code to this exchange file

Overall it feels like normal REPL in Python and similar languages.

# How it works

