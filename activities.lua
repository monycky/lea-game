local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local bg
local titlel
local button
local ladybird 


local function changeScenes()
	composer.gotoScene("level", {effect = "slideLeft", time = 500})
end

local function scene1()
    composer.gotoScene("credit", {effect = "slideLeft", time = 500})
end
 
-- create()
function scene:create( event )
 
--    ladybird = display.newImage('ladybird.png', 80, 170) -- OK

    local sceneGroup = self.view


    bg = display.newImageRect("background.png", 1050, 700)
    sceneGroup:insert(bg)

    title = display.newText("activities screen", 235, 90, "", 30)
    title:setFillColor(255, 255, 255)
    sceneGroup:insert(title)


    button = display.newRect(display.contentCenterX, display.contentHeight*.7, display.contentWidth*.2, display.contentHeight*.15)
    button:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(button)
    button: addEventListener( "tap", changeScenes )


    button2 = display.newRect(display.contentCenterX, display.contentHeight*.9, display.contentWidth*.2, display.contentHeight*.10)
    button2:setFillColor(255/255, 255/255, 0/255)
    sceneGroup:insert(button)
    button2: addEventListener( "tap", scene1 )

    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene
