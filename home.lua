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

    homeBg = display.newImageRect("background.png", 1050, 700)
    sceneGroup:insert(homeBg)

    homeTitle = display.newText("LEA - inicial screen", 235, 90, "", 30)
    homeTitle:setFillColor(255, 255, 255)
    sceneGroup:insert(homeTitle)


    homePlayButton = display.newRect(display.contentCenterX, display.contentHeight*.7, display.contentWidth*.2, display.contentHeight*.15)
    homePlayButton:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(homePlayButton)
    homePlayButton: addEventListener("tap", goToActivities)


    homeCreditButton = display.newRect(display.contentCenterX, display.contentHeight*.9, display.contentWidth*.2, display.contentHeight*.10)
    homeCreditButton:setFillColor(255/255, 255/255, 0/255)
    sceneGroup:insert(homeCreditButton)
    homeCreditButton: addEventListener("tap", goToCredits)

    homeAboutButton = display.newRect(display.contentCenterX, display.contentHeight*.5, display.contentWidth*.2, display.contentHeight*.10)
    homeAboutButton:setFillColor(255/255, 155/255, 0/255)
    sceneGroup:insert(homeAboutButton)
    homeAboutButton: addEventListener("tap", goToAbout) 
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
