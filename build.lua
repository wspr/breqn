#!/usr/bin/env texlua

package_info = {
  name = "breqn" ,
  description = "Automatic line breaking of displayed equations" ,
  authors = {
    "Michael J. Downes", "Morten Høgholm", "Lars Madsen", "Joseph Wright", "Will Robertson",
  },
  homepage   = "http://wspr.io/breqn/" ,
  ctanpath   = "macros/latex/contrib/breqn" ,
  licence    = "lppl 1.3" ,
  repository = "https://github.com/wspr/breqn" ,
  bugtracker = "https://github.com/wspr/breqn/issues" ,
}

module = package_info.name

unpackfiles = {"*.dtx"}
installfiles = {"*.sty","*.sym"}

unpackopts  = "-interaction=batchmode"
typesetopts = "-interaction=batchmode"

binaryfiles  = {"*.pdf","*.zip"}
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

ctan_summary = package_info.description
ctan_pkg     = module
ctan_file    = module..".zip"
ctan_version = pkgversion

local ctan_author = ""
if package_info.author then
  ctan_author = package_info.author
else
  for i,j in ipairs(package_info.authors) do
    local sep = ", "
    if i == 1 then sep = "" end
    ctan_author = ctan_author .. sep .. j
  end
end

ctan_ctanPath   = package_info.ctanpath
ctan_license    = package_info.licence
ctan_home       = package_info.homepage
ctan_repository = package_info.repository
ctan_bugtracker = package_info.bugtracker

local handle = io.popen('git config user.name')
ctan_uploader = string.gsub(handle:read("*a"),'%s*$','')
handle:close()
local handle = io.popen('git config user.email')
ctan_email = string.gsub(handle:read("*a"),'%s*$','')
handle:close()

ctan_announcement = currentchanges
ctan_update = true

ctan_note=[[
Uploaded automatically with l3build -- experimental. Sorry if any trouble/inconsistency, please let me know if there are fields I need to update.
]]

