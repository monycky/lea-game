local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local activitiesBg
local activitiesTitle
local dragGameLevelButton
local memoryGameLevelButton
local puzzleGameLevelButton

local backToHomeButton


local function goToDragGameLevel()
	composer.gotoScene("src.scenes.dragGameLevel", {effect = "slideLeft", time = 500})
end

local function goToMemoryGameLevel()
    composer.gotoScene("src.scenes.memoryGameLevel", {effect = "slideLeft", time = 500})
end

local function goToHome()
    composer.gotoScene("src.scenes.home", {effect = "slideLeft", time = 500})
end

 
-- create()
function scene:create( event )

    local sceneGroup = self.view

    activitiesBg = display.newImageRect("src/scenes/images/background.png", 1050, 700)
    sceneGroup:insert(activitiesBg)

    activitiesTitle = display.newText("activities", 235, 50, "", 30)
    activitiesTitle:setFillColor(255, 255, 255)
    sceneGroup:insert(activitiesTitle)

    memoryGameLevelButton = display.newImage('src/scenes/images/1.png', 100, 170)
    sceneGroup:insert(memoryGameLevelButton)
    memoryGameLevelButton:addEventListener("tap", goToMemoryGameLevel)

    dragGameLevelButton = display.newImage('src/scenes/images/shapes.png', 245, 170) -- OK
    sceneGroup:insert(dragGameLevelButton)
    dragGameLevelButton:addEventListener("tap", goToDragGameLevel)
  
    puzzleGameLevelButton = display.newImage('src/scenes/images/puzzle.png', 390, 170)
    sceneGroup:insert(puzzleGameLevelButton)
    puzzleGameLevelButton:addEventListener("tap", goToMemoryGameLevel)

    backToHomeButton = display.newImage('src/scenes/images/withe-arrow.png', 5, 50) -- OK
    sceneGroup:insert(backToHomeButton)
    backToHomeButton:addEventListener("tap", goToHome)
 
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
--    backToHomeButton:removeEventListener("tap", goToHome)
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
