--██████╗░░█████╗░██╗░░░░░░█████╗░██████╗░██╗░░░██╗██╗
--██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██║░░░██║██║
--██████╔╝██║░░██║██║░░░░░███████║██████╔╝██║░░░██║██║
--██╔═══╝░██║░░██║██║░░░░░██╔══██║██╔══██╗██║░░░██║██║
--██║░░░░░╚█████╔╝███████╗██║░░██║██║░░██║╚██████╔╝██║
--╚═╝░░░░░░╚════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░╚═╝


--main file and loader for polarUI
local log = require(script.log)


--------------------------------------------------------------------------------
local polar = {}

log.print("loading polarUI")

local modules = {}
for i,v in pairs(script.modules:GetDescendants()) do
    if v.ClassName == "ModuleScript" then
        local mod = require(v)
        modules[mod.Name] = mod
        log.print("loaded module " .. mod.Name)
    end
end

local plugins = {}
for i,v in pairs(script.plugins:GetDescendants()) do
    if v.ClassName == "ModuleScript" then
        local plug = require(v)
        plugins[plug.Name] = plug
        log.print("loaded module " .. plug.Name)
    end
end

polar.Modules = modules
polar.Plugins = plugins
polar.Log = log

return polar