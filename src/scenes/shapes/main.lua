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

-- [Credits]

local creditsView

-- Game Background

local gameBg

-- Instructions

local ins

-- Shapes Placeholder

local sHolder
local pHolder

-- Shapes

local square
local pentagon

-- Alert

local alertView

-- Sounds

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

-- Main Function

function Main()
	--titleBg = display.newImage('titleBg.png', 150, 200) 
	titleBg = display.newText( "Title Game", 190, 250, 240, 300, native.systemFont, 30 )
	
	playBtn = display.newImage('play.png', 150, 200)
	
	--creditsBtn = display.newImage('creditsBtn.png', 152, 245)
	
	titleView = display.newGroup(titleBg, playBtn)
	
	startButtonListeners('add')
end

function startButtonListeners(action)
	if(action == 'add') then
		playBtn:addEventListener('tap', showGameView)
		--creditsBtn:addEventListener('tap', showCredits)
	else
		playBtn:removeEventListener('tap', showGameView)
		--creditsBtn:removeEventListener('tap', showCredits)
	end
end

function showCredits:tap(e)
	playBtn.isVisible = false
	creditsBtn.isVisible = false
	creditsView = display.newImage('credits.png', 0, display.contentHeight)
	
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
	gameBg = display.newImage('gameBg.png', 10, 170, 2000)
	
	-- Place holders
	--sombra dos shapes (lugar certo)
	--sHolder3 = display.newImage('sHolder3.png', 260, 100) -- OK
	sHolder = display.newImage('square-shape-color.png', 260, 100) -- OK
	
	pHolder = display.newImage('square-shape-color2.png', 260, 230) -- OK
		
	-- Instructions
	
	ins = display.newText( "some instruction", 170, 290, native.systemFont, 20 )
	transition.from(ins, {time = 200, alpha = 0.1, onComplete = function() timer.performWithDelay(2000, function() transition.to(ins, {time = 200, alpha = 0.1, onComplete = function() display.remove(ins) ins = nil end}) end) end}) --ok
	
	-- Shapes
	
	square = display.newImage('square-shape-color.png', 10, 100)
	pentagon = display.newImage('square-shape-color2.png', 10, 230)

	
	square.name = 'square'
	pentagon.name = 'pentagon'
	
	gameListeners()
end

function gameListeners()
	square:addEventListener('touch', dragShape)
	pentagon:addEventListener('touch', dragShape)

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
		e.target.y = 100
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
	
	if(e.phase == 'ended' and correct == 2) then
		audio.stop()
		audio.play(winSnd)
		alert()
	end
end


function alert()
	alertView = display.newText( "end level popup/maybe music", display.contentCenterX, display.contentCenterY, native.systemFont, 20 )
	transition.from(alertView, {time = 200, alpha = 0.1})
end

Main() 