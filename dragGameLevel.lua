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
	composer.gotoScene("dragGameLevelOne", {effect = "slideLeft", time = 500})
end

local function goTodragGameLevelTwo()
    composer.gotoScene("dragGameLeveTwo", {effect = "slideLeft", time = 500})
end

local function goTodragGameLevelThree()
    composer.gotoScene("dragGameLevelThree", {effect = "slideLeft", time = 500})
end

local function goTodragGameLevelFour()
    composer.gotoScene("dragGameLevelFour", {effect = "slideLeft", time = 500})
end

local function goToActivities()
    composer.gotoScene("activities", {effect = "slideLeft", time = 500})
end
 
-- create()
function scene:create( event )

    local sceneGroup = self.view

    dragGameLevelBg = display.newImageRect("background.png", 1050, 700)
    sceneGroup:insert(dragGameLevelBg)


    dragGameLevelOneButton = display.newImage('level1.png', 100, 170) -- OK
    sceneGroup:insert(dragGameLevelOneButton)
    dragGameLevelOneButton: addEventListener("tap", goTodragGameLevelFour)

    dragGameLevelTwoButton = display.newImage('level2.png', 190, 170) -- OK
    sceneGroup:insert(dragGameLevelOneButton)
    dragGameLevelOneButton: addEventListener("tap", goTodragGameLevelTwo)

    dragGameLevelThreeButton = display.newImage('level3.png', 290, 170) -- OK
    sceneGroup:insert(dragGameLevelOneButton)
    dragGameLevelOneButton: addEventListener("tap", goTodragGameLevelThree)

    dragGameLevelFourButton = display.newImage('level4.png', 390, 170) -- OK
    sceneGroup:insert(dragGameLevelOneButton)
    dragGameLevelOneButton: addEventListener("tap", goTodragGameLevelFour)


    dragGameLevelTitle = display.newText("Drag Game Levels", 235, 90, "", 30)
    dragGameLevelTitle:setFillColor(255, 255, 255)
    sceneGroup:insert(dragGameLevelTitle)

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
    sceneGroup:remove(dragGameLevelOneButton)
    sceneGroup:remove(goTodragGameLevelTwo)
    sceneGroup:remove(dragGameLevelThreeButton)
    sceneGroup:remove(dragGameLevelFourButton)

    sceneGroup:remove(backToActivities)

 
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
