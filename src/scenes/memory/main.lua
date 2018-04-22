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
        
     end
end