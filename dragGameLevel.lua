local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local dragGameLevelBg
local dragGameLevelTitle

local dragGameLevelOneButton
local dragGameLevelTwoButton
local dragGameLevelThreeButton
local dragGameLevelFourButton

local backToActivities


local function goTodragGameLevelOne()
	composer.gotoScene("dragGameLevel", {effect = "slideLeft", time = 500})
end

local function goTodragGameLevelTwo()
    composer.gotoScene("dragGameLevel", {effect = "slideLeft", time = 500})
end

local function goTodragGameLevelThree()
    composer.gotoScene("dragGameLevel", {effect = "slideLeft", time = 500})
end

local function goTodragGameLevelFour()
    composer.gotoScene("dragGameLevel", {effect = "slideLeft", time = 500})
end

local function goToActivities()
    composer.gotoScene("activities", {effect = "slideLeft", time = 500})
end
 
-- create()
function scene:create( event )

    local sceneGroup = self.view

    dragGameLevelBg = display.newImageRect("background.png", 1050, 700)
    sceneGroup:insert(dragGameLevelBg)

    dragGameLevelTitle = display.newText("Drag Game Levels", 235, 90, "", 30)
    dragGameLevelTitle:setFillColor(255, 255, 255)
    sceneGroup:insert(dragGameLevelTitle)


    dragGameLevelOneButton = display.newRect(display.contentCenterX, display.contentHeight*.7, display.contentWidth*.2, display.contentHeight*.15)
    dragGameLevelOneButton:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(dragGameLevelOneButton)
    dragGameLevelOneButton: addEventListener("tap", goTodragGameLevelOne)


    dragGameLevelTwoButton = display.newRect(display.contentCenterX, display.contentHeight*.5, display.contentWidth*.2, display.contentHeight*.15)
    dragGameLevelTwoButton:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(dragGameLevelTwoButton)
    dragGameLevelTwoButton: addEventListener("tap", goTodragGameLevelTwo)


    dragGameLevelThreeButton = display.newRect(display.contentCenterX, display.contentHeight*.3, display.contentWidth*.2, display.contentHeight*.15)
    dragGameLevelThreeButton:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(dragGameLevelThreeButton)
    dragGameLevelThreeButton: addEventListener("tap", goTodragGameLevelThree)


    dragGameLevelFourButton = display.newRect(display.contentCenterX, display.contentHeight*.9, display.contentWidth*.2, display.contentHeight*.15)
    dragGameLevelFourButton:setFillColor(255/225, 100/255, 120/255)
    sceneGroup:insert(dragGameLevelFourButton)
    dragGameLevelFourButton: addEventListener("tap", goTodragGameLevelFour)
   

    backToHomeButton = display.newRect(display.contentCenterX, display.contentHeight*.11, display.contentWidth*.2, display.contentHeight*.10)
    backToHomeButton:setFillColor(255/255, 255/255, 0/255)
    sceneGroup:insert(backToHomeButton)
    backToHomeButton: addEventListener("tap", goToActivities)

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
    backToActivities:removeEventListener("tap", goToActivities)
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
