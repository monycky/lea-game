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

local function goToDragGameLevelOne()
	composer.gotoScene("dragGameLevelOne", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelTwo()
    composer.gotoScene("dragGameLeveTwo", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelThree()
    composer.gotoScene("dragGameLevelThree", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelFour()
    composer.gotoScene("dragGameLevelFour", {effect = "slideLeft", time = 500})
end

local function goToActivities()
    composer.gotoScene("src.scenes.activities", {effect = "slideLeft", time = 500})
end
 
-- create()
function scene:create( event )

    local sceneGroup = self.view

    dragGameLevelBg = display.newImageRect("src/scenes/images/background.png", 1050, 700)
    sceneGroup:insert(dragGameLevelBg)


    dragGameLevelOneButton = display.newImage('src/scenes/images/yellowLevel1.png', 100, 170) -- OK
    sceneGroup:insert(dragGameLevelOneButton)
    dragGameLevelOneButton: addEventListener("tap", goToDragGameLevelOne)

    dragGameLevelTwoButton = display.newImage('src/scenes/images/yellowLevel2.png', 190, 170) -- OK
    sceneGroup:insert(dragGameLevelTwoButton)
    dragGameLevelTwoButton: addEventListener("tap", goToDragGameLevelTwo)

    dragGameLevelThreeButton = display.newImage('src/scenes/images/yellowLevel3.png', 290, 170) -- OK
    sceneGroup:insert(dragGameLevelThreeButton)
    dragGameLevelThreeButton: addEventListener("tap", goToDragGameLevelThree)

    dragGameLevelFourButton = display.newImage('src/scenes/images/yellowLevel4.png', 390, 170) -- OK
    sceneGroup:insert(dragGameLevelFourButton)
    dragGameLevelFourButton: addEventListener("tap", goToDragGameLevelFour)


    dragGameLevelTitle = display.newText("Memory Game Levels", 235, 90, "", 30)
    dragGameLevelTitle:setFillColor(255, 255, 255)
    sceneGroup:insert(dragGameLevelTitle)

    backToHomeButton = display.newImage('src/scenes/images/withe-arrow.png', 5, 50) -- OK
    sceneGroup:insert(backToHomeButton)
    backToHomeButton:addEventListener("tap", goToActivities)
 
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
--    backToActivities:removeEventListener("tap", goToActivities)

    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelOne)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelOne)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelOne)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelOne)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelOne)
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
