#!/usr/bin/env texlua

-- Build script for breqn

module = "breqn"

unpackfiles = {"*.dtx"}
unpackopts  = "-interaction=batchmode"

kpse.set_program_name("kpsewhich")
buildscript = kpse.lookup("l3build.lua","mustexist")
dofile(buildscript)
