#!/usr/bin/env texlua

module = "breqn"

unpackfiles = {"*.dtx"}
installfiles = {"*.sty","*.sym"}

unpackopts  = "-interaction=batchmode"
typesetopts = "-interaction=batchmode"

binaryfiles = {"*.pdf","*.zip"}
excludefiles = {"*/breqn-thesis.pdf",
                "*/breqn-abbr-test.pdf",
                "*/eqbreaks.pdf"}

packtdszip   = true
recordstatus = true
