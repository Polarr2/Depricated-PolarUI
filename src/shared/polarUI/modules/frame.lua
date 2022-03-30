local Frame = {}
local log = require(script.Parent.Parent.log)

Frame.Name = "Frame"

function Frame.new(theme,properties)
    if not properties["Parent"] then
		log.error("Parent is needed")
	end
    local fr = Instance.new("Frame")
    fr.Parent = properties["Parent"]
    if properties["Name"] then
        fr.Name = properties["Name"]
    end
    if properties["Size"] then
        fr.Size = properties["Size"]
    end
    if properties["Position"] then
        fr.Position = properties["Position"]
    end
    fr.BackgroundColor3 = theme.Colours["primary"]
end

return Frame