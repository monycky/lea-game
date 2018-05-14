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

    girl = display.newImage("girl.png", 100, 190)
    sceneGroup:insert(girl)

    homeTitle = display.newText("LEA - name game", 345, 90, "", 30)
    homeTitle:setFillColor(255, 255, 255)
    sceneGroup:insert(homeTitle)

    homeCreditButton = display.newImage('credits.png', 280, 250) -- OK
    sceneGroup:insert(homeCreditButton)
    homeCreditButton:addEventListener("tap", goToCredits)

    homePlayButton = display.newImage('play.png', 375, 190) -- OK
    sceneGroup:insert(homePlayButton)
    homePlayButton:addEventListener("tap", goToActivities)

    homeAboutButton = display.newImage('about.png', 450, 250) -- OK
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
    homeCreditButton:removeEventListener("tap", goToActivities)
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
