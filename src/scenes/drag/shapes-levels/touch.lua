-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--load image
local background = display.newImageRect("background.png", 450, 1050)
background.x = display.contentCenterX
background.y = display.contentCenterY

local rabbit = display.newImageRect("rabbit.png")
local ground = display.newImageRect("ground.png")
--element position
--rabbit.x = display.contentCenterX
--rabbit.y = display.contentCenterY

--ground.x = display.contentCenterX
--ground.y = display.contentHeight -1

--adding physics
local physics = require("physics")
physics.start( )

--physics.addBody(rabbit, "dynamic", {density = 0, friction = 1, bounce = 1})
--physics.addBody(ground, "static", {friction = 1})

local function onTouch(event)
    if(event.phase == "began") then
        --cow:applyLinearImpulse(0, -2, cow.x, cow.y)
        if(event.x < rabbit.x) then
            --jump left
            rabbit:applyLinearImpulse(-2,-2, rabbit.x, rabbit.y)
        else
            rabbit:applyLinearImpulse(2,-2, rabbit.x, rabbit.y)
        end
    end
end

Runtime:addEventListener("touch", onTouch)

