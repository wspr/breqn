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
ctanupload   = "ask"


-- version data


changeslisting = nil
do
  local f = assert(io.open("CHANGES.md", "r"))
  changeslisting = f:read("*all")
  f:close()
end

currentchanges = string.match(changeslisting,"(## %S+ %(.-%).-)%s*## %S+ %(.-%)")
pkgversion = string.match(changeslisting,"## v(%S+) %(.-%)")



-- ctan upload settings

ctan_summary = 'Automatic line breaking of displayed equations'
ctan_pkg     = module
ctan_version = pkgversion
ctan_author  = "Michael J. Downes, Morten Høgholm, Lars Madsen, Joseph Wright, Will Robertson"

ctan_ctanPath = "macros/latex/contrib/breqn"
ctan_license  = "lppl"

ctan_home       = "http://wspr.io/breqn/"
ctan_repository = "https://github.com/wspr/breqn"
ctan_bugtracker = "https://github.com/wspr/breqn/issues"


local handle = io.popen('git config user.name')
ctan_uploader = string.gsub(handle:read("*a"),'%s*$','')
handle:close()
local handle = io.popen('git config user.email')
ctan_email = string.gsub(handle:read("*a"),'%s*$','')
handle:close()


ctan_announcement = currentchanges
ctan_update = true

ctan_file = module..".zip"

ctan_note=[[
Uploaded automatically with l3build -- experimental. Sorry if any trouble/inconsistency, please let me know if there are fields I need to update.
]]

