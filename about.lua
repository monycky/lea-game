local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local aboutBg
local aboutTitle
local aboutText
local aboutIcon
local backHomeButton


local function goToHome()
	composer.gotoScene("home", {effect = "slideLeft", time = 500})
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view

    aboutBg = display.newImageRect("background.png", 1050, 700)
    sceneGroup:insert(aboutBg)

    aboutTitle = display.newText("About game teach", 235, 90, "", 30)
    aboutTitle:setFillColor(1,1,1)
    sceneGroup:insert(aboutTitle)

    aboutText = display.newText("texto sobre a tecnica usada para desenvolver o jogo", 235, 150, "", 20)
    aboutText:setFillColor(1,1,1)
    sceneGroup:insert(aboutText)


    backHomeButton = display.newRect(display.contentCenterX, display.contentHeight*.7, display.contentWidth*.2, display.contentHeight*.15)
    backHomeButton:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(backHomeButton)
    backHomeButton: addEventListener( "tap", goToHome )

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
        --backHomeButton:removeEventListener( "tap", goToHome )
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view

    local sceneGroup = self.view
    sceneGroup:remove(aboutBg)
    sceneGroup:remove(aboutTitle)
    sceneGroup:remove(aboutText)
    sceneGroup:remove(aboutIcon)
 
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
