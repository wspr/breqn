#!/usr/bin/env texlua

-- Build script for breqn

module = "breqn"

unpackfiles = {"*.dtx"}
installfiles = {"*.sty","*.sym"}

unpackopts  = "-interaction=batchmode"
typesetopts = "-interaction=batchmode"
binaryfiles = {"*.pdf","*.zip"}
excludefiles = {"*/breqn-thesis.pdf",
                "*/breqn-abbr-test.pdf",
                "*/eqbreaks.pdf"}

kpse.set_program_name("kpsewhich")
buildscript = kpse.lookup("l3build.lua")
dofile(buildscript)
