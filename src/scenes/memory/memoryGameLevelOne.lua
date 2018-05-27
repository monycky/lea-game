local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local dragGameLevelBg
local dragGameLevelTitle
local backToActivities

local button = {}
local buttonCover = {}
local buttonImages = {1,1, 2,2, 3,3}

--Declare a totalButtons variable to track number of buttons on screen
local totalButtons = 0

--Declare variable to track button select
local secondSelect = 0
local checkForMatch = false

--Set starting point for button grid
x = -50


local function goToActivities()
    composer.gotoScene("src.scenes.memory.memoryGameLevel", {effect = "slideLeft", time = 500})
end
 
-- create()
function scene:create( event )

    local sceneGroup = self.view

    dragGameLevelBg = display.newImageRect("src/scenes/images/bgSalmon.jpg", 1050, 700)
    sceneGroup:insert(dragGameLevelBg)


    dragGameLevelTitle = display.newText("Memory Game Levels", 235, 90, "", 30)
    dragGameLevelTitle:setFillColor(255, 255, 255)
    sceneGroup:insert(dragGameLevelTitle)

    backToHomeButton = display.newImage('src/scenes/images/withe-arrow.png', 5, 50) -- OK
    sceneGroup:insert(backToHomeButton)
    backToHomeButton:addEventListener("tap", goToActivities)
         
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
function memoryGame(object, event)
    if(event.phase == "began") then             
        if(checkForMatch == false and secondSelect == 0) then
            --Flip over first button
            buttonCover[object.number].isVisible = false;
            lastButton = object
            checkForMatch = true            
        elseif(checkForMatch == true) then
            if(secondSelect == 0) then
                --Flip over second button
                buttonCover[object.number].isVisible = false;
                secondSelect = 1;
                --If buttons do not match, flip buttons over
                if(lastButton.myName ~= object.myName) then
                    timer.performWithDelay(1250, function()                     
                        checkForMatch = false;
                        secondSelect = 0;
                        buttonCover[lastButton.number].isVisible = true;
                        buttonCover[object.number].isVisible = true;
                    end, 1)                 
                --If buttons DO match, remove buttons
                elseif(lastButton.myName == object.myName) then
                    timer.performWithDelay(1250, function()                     
                      --  matchText.text = " ";
                        checkForMatch = false;
                        secondSelect = 0;
                        lastButton:removeSelf();
                        object:removeSelf();
                        buttonCover[lastButton.number]:removeSelf();
                        buttonCover[object.number]:removeSelf();
                    end, 1) 
                end             
            end         
        end
    end
end




    for count = 1,3 do
    x = x + 220
    y = -80
    
    for insideCount = 1,2 do
        y = y + 200
        
        --Assign each image a random location on grid
        temp = math.random(1, #buttonImages)
        button[count] = display.newImage(buttonImages[temp] .. ".png");    

        --Position the button
        button[count].x = x;
        button[count].y = y;        
        
        --Give each a button a name
        button[count].myName = buttonImages[temp]
        button[count].number = totalButtons
        
        --Remove button from buttonImages table
        table.remove(buttonImages, temp)
                
        --Set a cover to hide the button image
        buttonCover[totalButtons] = display.newImage("button.png");
        buttonCover[totalButtons].x = x; buttonCover[totalButtons].y = y;
        totalButtons = totalButtons + 1
        
        --Attach listener event to each button
        button[count].touch = memoryGame     
        button[count]:addEventListener( "touch", button[count] )
    end
end

    sceneGroup:insert(buttonImages)


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
    end
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
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
