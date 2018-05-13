local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local bg
local titlel
local playButton
local creditButton
local ladybird 


local function changeScenes()
	composer.gotoScene("level", {effect = "slideLeft", time = 500})
end

local function credits()
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


    playButton = display.newRect(display.contentCenterX, display.contentHeight*.7, display.contentWidth*.2, display.contentHeight*.15)
    playButton:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(playButton)
    playButton: addEventListener( "tap", changeScenes )


    creditButton = display.newRect(display.contentCenterX, display.contentHeight*.9, display.contentWidth*.2, display.contentHeight*.10)
    creditButton:setFillColor(255/255, 255/255, 0/255)
    sceneGroup:insert(creditButton)
    creditButton: addEventListener( "tap", credits )

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
    creditButton:removeEventListener( "tap", changeScenes )
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    sceneGroup:remove(playButton)
    sceneGroup:remove(creditButton)
 
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
