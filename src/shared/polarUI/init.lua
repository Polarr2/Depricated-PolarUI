--██████╗░░█████╗░██╗░░░░░░█████╗░██████╗░ ██╗░░░██╗██╗
--██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗ ██║░░░██║██║
--██████╔╝██║░░██║██║░░░░░███████║██████╔╝ ██║░░░██║██║
--██╔═══╝░██║░░██║██║░░░░░██╔══██║██╔══██╗ ██║░░░██║██║
--██║░░░░░╚█████╔╝███████╗██║░░██║██║░░██║ ╚██████╔╝██║
--╚═╝░░░░░░╚════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝ ░╚═════╝░╚═╝





--Please note that this is a very early version of the PolarUI system.
--expect bugs and weird behavior.
--feel free to report any bugs you find.
--you can also report any suggestions you have for the system.
























--------------------------------------------------------------------------------

local log = require(script.log)

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
        log.print("loaded plugin " .. plug.Name)
    end
end

local themes = {}
for i,v in pairs(script.themes:GetDescendants()) do
    if v.ClassName == "ModuleScript" then
        local theme = require(v)
        themes[theme.Name] = theme
        log.print("loaded theme " .. theme.Name)
    end
end

function polar.New(name,theme,properties)
    if modules[name] and themes[theme] then
        local module = modules[name]
        module.new(themes[theme],properties)
        return module
    else
        log.error("module " .. name .. " does not exist or theme " .. theme .. " does not exist")
    end
end


polar.Modules = modules
polar.Plugins = plugins
polar.Themes = themes
polar.Log = log

return polar