#!/usr/bin/env texlua

module = "breqn"

installfiles = {"*.sty","*.sym"}
tagfiles = {"*.dtx","CHANGES.md"}

binaryfiles  = {"*.pdf","*.zip"}
excludefiles = {"*/breqn-thesis.pdf",
                "*/breqn-abbr-test.pdf",
                "*/eqbreaks.pdf"}

packtdszip   = true
recordstatus = true


--[==========[
      HELP
--]==========]

print([[
This is the L3BUILD config file for BREQN.
To perform a new release, run:
    l3build tag # don't type 'y' to tag with git
    l3build ctan
    l3build tag # if upload succeeded, do type 'y' to tag with git
]])

--[==================[
      VERSION DATA
--]==================]

changeslisting = nil
do
  local f = assert(io.open("CHANGES.md", "r"))
  changeslisting = f:read("*all")
  f:close()
end

currentchanges = string.match(changeslisting,"(## %S+ %(.-%).-)%s*## %S+ %(.-%)")
pkgversion = string.match(changeslisting,"## v(%S+) %(.-%)")


--[=================[
      CTAN UPLOAD
--]=================]

uploadconfig = {
  version      = pkgversion,
  announcement = currentchanges,
  author       = "Michael J. Downes; Morten Høgholm; Lars Madsen; Joseph Wright; Will Robertson",
  license      = "lppl1.3",
  summary      = "Automatic line breaking of displayed equations" ,
  ctanPath     = "macros/latex/contrib/breqn" ,
  repository   = "https://github.com/wspr/breqn" ,
  bugtracker   = "https://github.com/wspr/breqn/issues" ,
}

local function prequire(m) -- from: https://stackoverflow.com/a/17878208
  local ok, err = pcall(require, m)
  if not ok then return nil, err end
  return err
end

prequire("l3build-wspr.lua")


--[============[
     TAGGING
--]============]

function update_tag(file, content, tagname, tagdate)

  local date = string.gsub(tagdate, "%-", "/")

  if string.match(content, "{%d%d%d%d/%d%d/%d%d}%s*{[^}]+}%s*{[^}]+}") then
    print("Found expl3 version line in file: "..file)
    content = content:gsub("{%d%d%d%d/%d%d/%d%d}(%s*){[^}]+}(%s*){([^}]+)}",
    "{"..date.."}%1{"..pkgversion.."}%2{%3}")
  end

  if string.match(content, "\\def\\filedate{%d%d%d%d/%d%d/%d%d}") then
    print("Found filedate line in file: "..file)
    content = content:gsub("\\def\\filedate{[^}]+}", "\\def\\filedate{"..date.."}")
  end
  if string.match(content, "\\def\\fileversion{[^}]+}") then
    print("Found fileversion line in file: "..file)
    content = content:gsub("\\def\\fileversion{[^}]+}", "\\def\\fileversion{"..pkgversion.."}")
  end

  if string.match(content, "## (%S+) %([^)]+%)") then
    print("Found changes line in file: "..file)
    content = content:gsub("## (%S+) %([^)]+%)","## %1 ("..date..")",1)
  end

  return content
end


function tag_hook(tagname)
  os.execute('git commit -a -m "tag: update package version/data"')
  print("Are you ready to `git tag`? Type 'y' to proceed:")
  tag_check = io.read()
  if tag_check == "y" then
    os.execute('git tag -a "v'..pkgversion..'" -m "[see CHANGES for detailes]"')
  end
end



