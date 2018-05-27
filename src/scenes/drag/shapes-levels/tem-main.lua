local composer = require("composer")



-- Hide Status Bar
display.setStatusBar(display.HiddenStatusBar)

-- Graphics

-- [Background]

local bg = display.newImage('background.png') --ok

-- [Title View]

local titleBg
local playBtn
local creditsBtn
local titleView


--[Levels]
local levelOne
local levelTwo
local levelThree
local levelFour
local levelFive


local creditsView

-- Game Background

local gameBg

-- Instructions

local ins

-- Shapes Placeholder

local sHolder
local triangleHolder
local triangleHolder2
local triangleHolder3
local triangleHolder4
local triangleHolder5

-- Shapes
--default gray = CDC6C6

local square
local triangle
local squareHolder
local square3
local square4
local square5

-- Alert

local alertView

-- Sounds

local correctSnd = audio.loadSound('correct.caf') --ok
local winSnd = audio.loadSound('win.mp3') -- ok

-- Variables

local correct = 0

-- Functions

local Main = {}
local startButtonListeners = {} 
local showCredits = {}
local hideCredits = {}
local showGameView = {}
local gameListeners = {}
local hitTestObjects = {}
local dragShape = {}
local alert = {}

--Views--
local showOneView = {}
local showTwoView = {}
local showThreeView = {}
local showFourView = {}
local showFiveView = {}



-- Main Function

function Main()
	--titleBg = display.newImage('titleBg.png', 150, 200) 
	titleBg = display.newText( "Scenes games - shape", 170, 200, 250, 300, native.systemFont, 20 )
	
	--playBtn = display.newImage('play.png', 0, 170)
	--playSelectLevel = display.newImage('yes.png', 150, 270)
	
	levelOne = display.newImage('level-one.png', 0, 170)
	levelTwo = display.newImage('level-two.png', 80, 170)
	levelThree = display.newImage('level-three.png', 160, 170)
	levelFour = display.newImage('level-four.png', 240, 170)
	levelFive = display.newImage('level-five.png', 320, 170)

	
	--creditsBtn = display.newImage('creditsBtn.png', 152, 245)
	
	titleView = display.newGroup(titleBg, levelOne, levelTwo, levelThree, levelFour, levelFive)
	
	startButtonListeners('add')
end

function startButtonListeners(action)
	if(action == 'add') then
		levelOne:addEventListener('tap', showGameView)
		levelTwo:addEventListener('tap', showTwoView)
		levelThree:addEventListener('tap', showThreeView)
		levelFour:addEventListener('tap', showFourView)
		levelFive:addEventListener('tap', showFiveView)
		
		--playSelectLevel:addEventListener('tap', showSelectView)
		--creditsBtn:addEventListener('tap', showCredits)
	else
	--	playBtn:removeEventListener('tap', showGameView)
	--creditsBtn:removeEventListener('tap', showCredits)
	end
end

function showCredits:tap(e)
	--playBtn.isVisible = false
--	creditsBtn.isVisible = false
	--creditsView = display.newImage('credits.png', 0, display.contentHeight)
	
	transition.to(creditsView, {time = 300, y = display.contentHeight - 25, onComplete = function() creditsView:addEventListener('tap', hideCredits) end})
end

function hideCredits:tap(e)
	transition.to(creditsView, {time = 300, y = display.contentHeight + 25, onComplete = function() creditsBtn.isVisible = true playBtn.isVisible = true creditsView:removeEventListener('tap', hideCredits) display.remove(creditsView) creditsView = nil end})
end

function showGameView:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() startButtonListeners('rmv') display.remove(titleView) titleView = nil end})
	
	-- [Add GFX]
	
	-- Game Background
	--bgGame = sobra em baixo dos shapes
	gameBg = display.newImage('gameBg.png', 10, 170, 40, 50)
	
	-- Place holders
	--sombra dos shapes (lugar certo)
	sHolder = display.newImage('fishHolder.png', 260, 170) -- OK
	
	-- Instructions
	
	--ins = display.newImage('instructions.png', 170, 290)
	ins = display.newText( "some instruction", 170, 290, native.systemFont, 20 )

	transition.from(ins, {time = 50, alpha = 0.1, onComplete = function() timer.performWithDelay(2000, function() transition.to(ins, {time = 200, alpha = 0.1, onComplete = function() display.remove(ins) ins = nil end}) end) end}) --ok
	
	-- Shapes
	
	square = display.newImage('fish.png', 10, 170)
	
	square.name = 'square'
	
	gameListeners()
end


function showTwoView:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() startButtonListeners('rmv') display.remove(titleView) titleView = nil end})
	
	sHolder = display.newImage('sFox.png', 260, 170) -- OK
	pHolder = display.newImage('sFox.png', 260, 170) -- OK
	
	ins = display.newText( "some instruction", 170, 290, native.systemFont, 20 )

	transition.from(ins, {time = 50, alpha = 0.1, onComplete = function() timer.performWithDelay(2000, function() transition.to(ins, {time = 200, alpha = 0.1, onComplete = function() display.remove(ins) ins = nil end}) end) end}) --ok
	
	square = display.newImage('fox.png', 10, 170)
	pentagon = display.newImage('fox.png', 10, 170)

	
	square.name = 'square'
	pentagon.name = 'pentagon'

	
	gameListeners()
end

function showThreeView:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() startButtonListeners('rmv') display.remove(titleView) titleView = nil end})
	
	squareHolder = display.newImage('squareHolder.png', 260, 170) -- OK
	
	ins = display.newText( "some instruction", 170, 290, native.systemFont, 20 )

	transition.from(ins, {time = 50, alpha = 0.1, onComplete = function() timer.performWithDelay(2000, function() transition.to(ins, {time = 200, alpha = 0.1, onComplete = function() display.remove(ins) ins = nil end}) end) end}) --ok
	
	square = display.newImage('square.png', 10, 170)
	
	square.name = 'square'
	
	gameListeners()
end

function showFourView:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() startButtonListeners('rmv') display.remove(titleView) titleView = nil end})
	sHolder = display.newImage('sFox.png', 260, 170) -- OK
	
	ins = display.newText( "some instruction", 170, 290, native.systemFont, 20 )

	transition.from(ins, {time = 50, alpha = 0.1, onComplete = function() timer.performWithDelay(2000, function() transition.to(ins, {time = 200, alpha = 0.1, onComplete = function() display.remove(ins) ins = nil end}) end) end}) --ok
	
	square = display.newImage('fox.png', 10, 170)
	
	square.name = 'square'
	
	gameListeners()
end

function showFiveView:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() startButtonListeners('rmv') display.remove(titleView) titleView = nil end})
	sHolder = display.newImage('sFox.png', 260, 170) -- OK
	
	ins = display.newText( "some instruction", 170, 290, native.systemFont, 20 )

	transition.from(ins, {time = 50, alpha = 0.1, onComplete = function() timer.performWithDelay(2000, function() transition.to(ins, {time = 200, alpha = 0.1, onComplete = function() display.remove(ins) ins = nil end}) end) end}) --ok
	
	square = display.newImage('fox.png', 10, 170)
	
	square.name = 'square'
	
	gameListeners()
end



function gameListeners()
	square:addEventListener('touch', dragShape)
end

function hitTestObjects(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)
end

function dragShape(e)
	if(e.phase == 'began') then
		lastX = e.x - e.target.x
		lastY = e.y - e.target.y
	elseif(e.phase == 'moved') then
		e.target.x = e.x - lastX
		e.target.y = e.y - lastY
	elseif(e.target.name == 'square' and e.phase == 'ended' and hitTestObjects(e.target, sHolder)) then
		e.target.x = 260
		e.target.y = 170
		e.target:removeEventListener('touch', dragShape)
		correct = correct + 1
		audio.play(correctSnd)
	elseif(e.target.name == 'pentagon' and e.phase == 'ended' and hitTestObjects(e.target, pHolder)) then
		e.target.x = 260
		e.target.y = 230
		e.target:removeEventListener('touch', dragShape)
		correct = correct + 1
		audio.play(correctSnd)
	end
	validTwo(e)
	


--	if(e.phase == 'ended' and correct == 2) then
--		audio.stop()
--		audio.play(winSnd)
--		alert()
--	end
end

function validOne(e)
	if(e.phase == 'ended' and correct == 1) then
		audio.stop()
		audio.play(winSnd)
		alert()
	end
end
function validTwo(e)
	if(e.phase == 'ended' and correct == 2) then
		audio.stop()
		audio.play(winSnd)
		alert()
	end
end
function validThree(e)
	if(e.phase == 'ended' and correct == 3) then
		audio.stop()
		audio.play(winSnd)
		alert()
	end
end
function validFour(e)
	if(e.phase == 'ended' and correct == 4) then
		audio.stop()
		audio.play(winSnd)
		alert()
	end
end
function validFive(e)
	if(e.phase == 'ended' and correct == 5) then
		audio.stop()
		audio.play(winSnd)
		alert()
	end
end



function alert()
	--alertView = display.newImage('win.png', 95, 270)
	alertView = display.newText( "end level popup/maybe music", display.contentCenterX, display.contentCenterY, native.systemFont, 20 )
	transition.from(alertView, {time = 200, alpha = 0.1})
end

Main() 