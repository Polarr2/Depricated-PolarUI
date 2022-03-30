--wrapper for print, warn and error

local log = {}

function log.print(msg)
    print("[PolarUI] " .. msg)
end

function log.warn(msg)
    warn("[PolarUI] " .. msg)
end

function log.error(msg)
    error("[PolarUI] " .. msg)
end


return log