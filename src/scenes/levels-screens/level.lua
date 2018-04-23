local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
local bg 
local title
local button
local button2

local function changeScenes()
    composer.gotoScene("levelselect", {effect = "slideRight", time = 500})
end



-- create()
function scene:create( event )
 
       local sceneGroup = self.view


    
    bg = display.newImageRect("background.png", 1050, 700)
    sceneGroup:insert(bg)

    title = display.newText("level screen", 235, 90, "", 30)
    title:setFillColor(1,1,1)
    sceneGroup:insert(title)

    button = display.newRect(display.contentCenterX, display.contentHeight*.7, display.contentWidth*.2, display.contentHeight*.15)
    button:setFillColor(255/255, 255/255, 0/255)
    sceneGroup:insert(button)


    button2 = display.newRect(display.contentCenterX, display.contentHeight*.7, display.contentWidth*.2, display.contentHeight*.15)
    button:setFillColor(255/255, 255/255, 0/255)
    sceneGroup:insert(button2)


    button: addEventListener( "tap", changeScenes )

    button2: addEventListener( "tap", changeScenes )



end


 local function handleCancelButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.gotoScene( "level", { effect="crossFade", time=333 } )
    end
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
