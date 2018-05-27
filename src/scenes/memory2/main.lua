display.setStatusBar(display.HiddenStatusBar);

--Declare a background
local image = display.newImageRect( "bg.jpg", 900, 700) 
image.x = display.contentCenterX
image.y = display.contentCenterY

--Declare button, buttonCover, and buttonImages table
local button = {}
local buttonCover = {}
local buttonImages = {1,1, 2,2, 3,3}

--Declare a totalButtons variable to track number of buttons on screen
local totalButtons = 0

--Declare variable to track button select
local secondSelect = 0
local checkForMatch = false

--Declare and prime a last button selected variable
--local lastButton = display.newImage("1.png");   
--lastButton.myName = 1;

--Set starting point for button grid
x = -50

--Set up game function
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

--Place buttons on screen
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

