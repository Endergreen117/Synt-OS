--Installer

shell.run("pastebin","get","0kJUXkYW","/system/gui.lua")
shell.run("pastebin","get","rfefx5uB","/system/shell")

function github(url, path)
local content = http.get(url)
local file = fs.open(path,"w")
file.write(content.readAll())
file.close()