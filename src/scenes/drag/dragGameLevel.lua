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
local dragGameLevelFiveButton
local dragGameLevelSixButton
local dragGameLevelSevenButton
local dragGameLevelEightButton



local backToActivities

local function goToDragGameLevelOne()
	composer.gotoScene("src.scenes.drag.dragGameLevelOne", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelTwo()
    composer.gotoScene("src.scenes.drag.dragGameLevelTwo", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelThree()
    composer.gotoScene("src.scenes.drag.dragGameLevelThree", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelFour()
    composer.gotoScene("src.scenes.drag.dragGameLevelFour", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelFive()
    composer.gotoScene("src.scenes.drag.dragGameLevelFive", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelSix()
    composer.gotoScene("src.scenes.drag.dragGameLevelSix", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelSeven()
    composer.gotoScene("src.scenes.drag.dragGameLevelSeven", {effect = "slideLeft", time = 500})
end

local function goToDragGameLevelEight()
    composer.gotoScene("src.scenes.drag.dragGameLevelEight", {effect = "slideLeft", time = 500})
end




local function goToActivities()
    composer.gotoScene("src.scenes.activities", {effect = "slideLeft", time = 500})
end
 
-- create()
function scene:create( event )

    local sceneGroup = self.view

    dragGameLevelBg = display.newImageRect("src/scenes/images/background.png", 1050, 700)
    sceneGroup:insert(dragGameLevelBg)


    dragGameLevelOneButton = display.newImage('src/scenes/images/level1.png', 100, 130) -- OK
    sceneGroup:insert(dragGameLevelOneButton)
    dragGameLevelOneButton: addEventListener("tap", goToDragGameLevelOne)

    dragGameLevelTwoButton = display.newImage('src/scenes/images/level2.png', 190, 130) -- OK
    sceneGroup:insert(dragGameLevelTwoButton)
    dragGameLevelTwoButton: addEventListener("tap", goToDragGameLevelTwo)

    dragGameLevelThreeButton = display.newImage('src/scenes/images/level3.png', 290, 130) -- OK
    sceneGroup:insert(dragGameLevelThreeButton)
    dragGameLevelThreeButton: addEventListener("tap", goToDragGameLevelThree)

    dragGameLevelFourButton = display.newImage('src/scenes/images/level4.png', 390, 130) -- OK
    sceneGroup:insert(dragGameLevelFourButton)
    dragGameLevelFourButton: addEventListener("tap", goToDragGameLevelFour)

    dragGameLevelFiveButton = display.newImage('src/scenes/images/level5.png', 100, 230) -- OK
    sceneGroup:insert(dragGameLevelFiveButton)
    dragGameLevelFiveButton: addEventListener("tap", goToDragGameLevelFive)

    dragGameLevelSixButton = display.newImage('src/scenes/images/level6.png', 190, 230) -- OK
    sceneGroup:insert(dragGameLevelSixButton)
    dragGameLevelSixButton: addEventListener("tap", goToDragGameLevelSix)

    dragGameLevelSevenButton = display.newImage('src/scenes/images/level7.png', 290, 230) -- OK
    sceneGroup:insert(dragGameLevelSevenButton)
    dragGameLevelSevenButton: addEventListener("tap", goToDragGameLevelSeven)

    dragGameLevelEightButton = display.newImage('src/scenes/images/level8.png', 390, 230) -- OK
    sceneGroup:insert(dragGameLevelEightButton)
    dragGameLevelEightButton: addEventListener("tap", goToDragGameLevelEight)




    dragGameLevelTitle = display.newText("", 235, 75, "", 30)
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
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelTwo)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelThree)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelFour)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelFive)
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelSix)    
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelSeven)    
    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelEight)    

    
--    dragGameLevelOneButton:removeEventListener("tap", goToDragGameLevelOne)
    end
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    sceneGroup:remove(dragGameLevelOneButton)
    sceneGroup:remove(goTodragGameLevelTwo)
    sceneGroup:remove(dragGameLevelThreeButton)
    sceneGroup:remove(dragGameLevelFourButton)
    sceneGroup:remove(dragGameLevelFiveButton)
    sceneGroup:remove(dragGameLevelSixButton)
    sceneGroup:remove(dragGameLevelSevenButton)
    sceneGroup:remove(dragGameLevelEightButton)

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
