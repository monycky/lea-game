local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local homeBg
local homeTitle
local homePlayButton
local homeCreditButton
local homeAboutButton
local homeIcon 
local girl
local rainbow
 
local function goToActivities()
	composer.gotoScene("activities", {effect = "slideLeft", time = 500})
end

local function goToCredits()
    composer.gotoScene("credit", {effect = "slideLeft", time = 500})
end

local function goToAbout()
    composer.gotoScene("about", {effect = "slideLeft", time = 500})
end

 
-- create()
function scene:create( event )
    local sceneGroup = self.view

--    homeIcon = display.newImage('ladybird.png', 80, 170) -- OK

    homeBg = display.newImageRect("bg5.png", 1050, 700)
    sceneGroup:insert(homeBg)

    rainbow = display.newImage("lea-logo-02.png", 240, 115)
    sceneGroup:insert(rainbow)
    rainbow.width = 700
    rainbow.height = 230


    girl = display.newImage("girl.png", 235, 230)
    sceneGroup:insert(girl)

    --homeCreditButton = display.newImage('credits.png', 280, 250) -- OK
    --sceneGroup:insert(homeCreditButton)
    --homeCreditButton:addEventListener("tap", goToCredits)

    homePlayButton = display.newImage('play.png', 450, 270) -- OK
    sceneGroup:insert(homePlayButton)
    homePlayButton:addEventListener("tap", goToActivities)

    homeAboutButton = display.newImage('heart.png', 30, 270) -- OK
    sceneGroup:insert(homeAboutButton)
    homeAboutButton:addEventListener("tap", goToAbout)

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
   -- homeCreditButton:removeEventListener("tap", goToActivities)
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    sceneGroup:remove(homePlayButton)
    sceneGroup:remove(homeCreditButton)
 
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
