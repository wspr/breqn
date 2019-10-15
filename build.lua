#!/usr/bin/env texlua

module = "breqn"

installfiles = {"*.sty","*.sym"}
tagfiles = {"*.dtx","CHANGES.md"}

unpackopts  = "-interaction=batchmode"
typesetopts = "-interaction=batchmode"

binaryfiles  = {"*.pdf","*.zip"}
excludefiles = {"*/breqn-thesis.pdf",
                "*/breqn-abbr-test.pdf",
                "*/eqbreaks.pdf"}

packtdszip   = true
recordstatus = true


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
  author       = "Michael J. Downes, Morten Høgholm, Lars Madsen, Joseph Wright, Will Robertson",
  license      = "lppl1.3c",
  summary      = "Automatic line breaking of displayed equations" ,
  ctanpath     = "macros/latex/contrib/breqn" ,
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
  check_status()

  local date = string.gsub(tagdate, "%-", "/")

  if string.match(content, "{%d%d%d%d/%d%d/%d%d}%s*{[^}]+}%s*{[^}]+}") then
    print("Found expl3 version line in file: "..file)
    content = content:gsub("{%d%d%d%d/%d%d/%d%d}(%s*){[^}]+}(%s*){([^}]+)}",
    "{"..date.."}%1{"..pkgversion.."}%2{%3}")
  end

  if string.match(content, "## (%S+) %([^)]+%)") then
    print("Found changes line in file: "..file)
    content = content:gsub("## (%S+) %([^)]+%)","## %1 ("..date..")",1)
  end

  return content
end


status_bool = false

function check_status()
  if status_bool then
    return true
  end

  local handle = io.popen('git status --porcelain --untracked-files=no')
  local gitstatus = string.gsub(handle:read("*a"),'%s*$','')
  handle:close()
  if gitstatus=="" then
    print("Checking git status: clean")
    status_bool = true
    return status_bool
  else
    print("ABORTING, git status is not clean:")
    print(gitstatus)
    status_bool = false
    return status_bool
  end
end

