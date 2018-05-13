local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local creditBg
local creditTitle
local creditText
local creditIcon
local backHomeButton

local function goToHome()
	composer.gotoScene("home", {effect = "slideRight", time = 500})
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    
    creditBg = display.newImageRect("background.png", 1050, 700)
    sceneGroup:insert(creditBg)

    creditTitle = display.newText("credits", 235, 90, "", 30)
    creditTitle:setFillColor(1,1,1)
    sceneGroup:insert(creditTitle)

    creditText = display.newText("aqui os creditos do jogo", 235, 150, "", 30)
    creditText:setFillColor(1,1,1)
    sceneGroup:insert(creditText)


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
     --   backHomeButton:removeEventListener( "tap", goToHome )
       


        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    sceneGroup:remove(creditBg)
    sceneGroup:remove(creditTitle)
    sceneGroup:remove(creditText)
    sceneGroup:remove(creditIcon)
 

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
