#Incase of unsolvable level created, reload page
window.onerror = -> 
	location.reload()

# ICON CREDIT
# reload by useiconic.com from the Noun Project

debugMode = true

#Next Steps
#------------------
#To ensure the levels are difficult, have the puck fall off the edge and not have the solution generate a solution so it hits the edge.

# Bugs
#-------------------
#Bug 1 #Purple blocks are overwriting already placed grey blocks
	#Current solution was to add a 'break', not sure if that worked

# Undefined bug
	# » "updated temp puck X: 6"
	# » "updated temp puck Y: 7"
	# » "checking position"
	# » "last move was down"
	# » ["right", "left", 0, 0]
	# » ["right", "left"]
	# » "left"
	# » []
	# » undefined


# New
#-------------------
# reload on error

#ToDos
#-------------------
# add next level button to the 'you win' screen
# Make sure the goal stops you when you slide over it
# Install SVG animator and handler module
# Make it scale bigger
# Create shake refresh anaimation
#Do everything in SVGs, like arrows
#animate intro: 
#	start blocks opacity 0, scale 1.2
#	animate blocks, for [i] in cells scale 1 opacity 1 i++

#IDEAS!
#-------------------
# Require every block to be hit in order to unlock the goal



#new level idea, you can have triangle that push the puck diagonally when they hit

#new idea, blocks shift color when you an action happens

#This is the ice game :-) 

# 0 = blank space	//
# 0.5 = goal placeholder // stops on space
# 1 = boulder		// stops before space
# 2 = brakes		// stops on space
# 3 = up arrow		// shoot the puck in that direction
# 4 = right arrow	// ""
# 5 = down arrow	// ""
# 6 = left arrow	// ""
# 100s = telport	// lands on tile, teleports to next 100s number
#		e.g. 100 transports to 101, 102 transports to 103
# 200s = buttons and doors	// slide over button to open door
#		e.g. 200 button opens 201 door, 202 button opens 203 door

#***************************************************
#Animation Defaults

puckCurve = 'cubic-bezier(0.175, 0.885, 0.32, 1.05)'
puckCurveTime = 0.5

# puckCurve = 'cubic-bezier(0.175, 0.885, 0.32, 1.275)'
#Framer.Defaults.Animation = curve: "spring(400,30,10)"
# Framer.Defaults.Layer.shadowColor = 'rgba(0,0,0,0.12)'
# Framer.Defaults.Layer.shadowY = 24
# Framer.Defaults.Layer.shadowBlur = 32




#***************************************************
#Levels

mainMenu = {
	name: 'MAIN MENU'
}

levels = []

level_1 = {
	name: 'LEVEL 1'
	lowestScore: null
	puckStartX: 2
	puckStartY: 2
	puck: {x: 2, y: 2}
	goal: {x: 5, y: 6}
	board: [
		[0,  0,  0,  1,  0,  0],
		[0,  0,  0,  0,  0,  0],
		[1,  (-1),  0,  -1,  -1,  (-1)],
		[0,  (-1),  1,  0,  0,  0],
		[0,  (-1),  0,  0,  0,  0],
		[0,  (-1),  0,  1,  1,  1],
		[1,  (-1),  1,  0,  0,  0],
		[(-1),  (-1),  0,  0,  0,  0],
		[(-1),  (-1),  0,  0,  0,  0],
	]
}

#level_1.board[9] = 	[1,  1,  1,  1,  1,  1]
# print level_1.board

levels.push(level_1)

level_2 = {
	name: 'LEVEL 2'
	lowestScore: null
	puckStartX: 1
	puckStartY: 2
	puck: {x: 1, y: 2}
	goal: {x: 0, y: 3}
	board: [
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
		[0,  0,  0,],
	]
}
levels.push(level_2)

level_3 = {
	name: 'LEVEL 3'
	lowestScore: null
	puckStartX: 1
	puckStartY: 2
	puck: {x: 1, y: 2}
	goal: {x: 0, y: 3}
	board: [
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  0],
	]
}
levels.push(level_3)

level_4 = {
	name: 'LEVEL 4'
	lowestScore: null
	puckStartX: 1
	puckStartY: 2
	puck: {x: 1, y: 2}
	goal: {x: 0, y: 3}
	board: [
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  2,  0,  0],
		[0,  0,  0,  0,  0,  0],
	]
}
levels.push(level_4)

level_5 = {
	name: 'LEVEL 5'
	lowestScore: null
	puckStartX: 1
	puckStartY: 2
	puck: {x: 1, y: 2}
	goal: {x: 0, y: 3}
	board: [
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  0],
	]
}
levels.push(level_5)

#-------------------------------

generateLevelFunction = (numberOfMovesToComplete, tileNumWide, tileNumHigh, rockPercentage) ->
	#Variable setup
	lastTileWide = tileNumWide-1
	lastTileHigh = tileNumHigh-1
	
	#Randomly place the puck
	randomPuckStartX = Utils.round(Utils.randomNumber(1, lastTileWide-1))
	randomPuckStartY = Utils.round(Utils.randomNumber(1, lastTileHigh-1))
	#Generate blank board
	generatedLevel = {
		name: difficulty + ' LEVEL'
		uniqueID: 'generateLevel' + numberOfMovesToComplete + tileNumWide + tileNumHigh + '%' + 'hex code goes here'
		lowestScore: null
		puckStartX: randomPuckStartX
		puckStartY: randomPuckStartY
		puck: {x: randomPuckStartX, y: randomPuckStartY}
		goal: {x: 0, y: 0}
		board: []
	}
	for rowIndex in [0...tileNumHigh]
		generatedLevel.board[rowIndex] = []
		for ColIndex in [0...tileNumWide]
			generatedLevel.board[rowIndex].push(0)
	puckTempPosition = {x: null, y: null}
	puckTempPosition.x = generatedLevel.puckStartX
	puckTempPosition.y = generatedLevel.puckStartY
# 	print 'temp puck X: ' + puckTempPosition.x
# 	print 'temp puck Y: ' + puckTempPosition.y

	# create moves to solution
	directionsToSolution = []
	movesToSolution = []
	#figure out a random direction to move in 
	for directions in [0..(numberOfMovesToComplete-1)]
# 		print 'updated temp puck X: ' + puckTempPosition.x
# 		print 'updated temp puck Y: ' + puckTempPosition.y
		
		availableMoves = ['right', 'left', 'down', 'up']
# 		print 'checking position'
		if puckTempPosition.x is 0
			availableMoves[1] = 0
		if puckTempPosition.y is 0
			availableMoves[3] = 0 
		if puckTempPosition.x is lastTileWide
			availableMoves[0] = 0
		if puckTempPosition.y is lastTileHigh
			availableMoves[2] = 0
		
# 		if directions > 0
# 			print directionsToSolution[(directions-1)]
		if "right" is directionsToSolution[(directions-1)]
			#print 'last move was right'
			availableMoves[0] = 0
			availableMoves[1] = 0
		if "left" is directionsToSolution[(directions-1)]
			#print 'last move was left'
			availableMoves[0] = 0
			availableMoves[1] = 0
		if "down" is directionsToSolution[(directions-1)]
			#print 'last move was down'
			availableMoves[2] = 0
			availableMoves[3] = 0
		if "up" is directionsToSolution[(directions-1)]
			#print 'last move was up'
			availableMoves[2] = 0
			availableMoves[3] = 0
# 		print availableMoves
		filteredMoves = availableMoves.filter (number0) -> number0 isnt 0
# 		print filteredMoves
		currentMove = Utils.randomChoice(filteredMoves)
# 		print currentMove
		directionsToSolution.push(currentMove)
		
		#Determine a random amount of moves to move in
		#	create an array with every whole number from where the puck is to the edge, remove numbers where purple pucks are
		countingArray = []
		doNotCountArray = []
		
		if currentMove is "right"
			#print 'moving right...'
			if puckTempPosition.x is (lastTileWide-1)
				randomXRight = (tileNumWide-1)
			else
				for i in [(puckTempPosition.x+2)..lastTileWide]
					if generatedLevel.board[puckTempPosition.y][i] is -1
						break
						#print 'ahhh theres already a purple there!'
					else
						countingArray.push(i)
				#print countingArray
				randomXRight = Utils.randomChoice(countingArray)
			#print randomXRight
			if randomXRight is tileNumWide-1
				for tilesRightAll in [(puckTempPosition.x+1)..(tileNumWide-1)]
					generatedLevel.board[puckTempPosition.y][tilesRightAll] = -1
					
				puckTempPosition.x = tileNumWide-1
			else
				for tilesRight in [(puckTempPosition.x+1)..(randomXRight-1)]
					generatedLevel.board[puckTempPosition.y][tilesRight] = -1
					
				generatedLevel.board[puckTempPosition.y][randomXRight] = 1
				puckTempPosition.x = randomXRight-1
		
		if currentMove is "left"
			if puckTempPosition.x is 1
				randomXLeft = 0
			else
				for i in [(puckTempPosition.x-2)..0]
					if generatedLevel.board[puckTempPosition.y][i] is -1
						break
						#print 'ahhh theres already a purple there!'
					else
						countingArray.push(i)
				#print countingArray
				randomXLeft = Utils.randomChoice(countingArray)
			#print randomXLeft
			if randomXLeft is 0
				for tilesLeftAll in [(puckTempPosition.x-1)..0]
					generatedLevel.board[puckTempPosition.y][tilesLeftAll] = -1
				
				puckTempPosition.x = 0
			else
				for tilesLeft in [(randomXLeft+1)..(puckTempPosition.x-1)]
					generatedLevel.board[puckTempPosition.y][tilesLeft] = -1
				
				generatedLevel.board[puckTempPosition.y][randomXLeft] = 1
				puckTempPosition.x = randomXLeft+1
		
		if currentMove is "down"
			if puckTempPosition.y is (lastTileHigh-1)
				randomYDown = (tileNumHigh-1)
			else
				for i in [(puckTempPosition.y+2)..lastTileHigh]
					if generatedLevel.board[i][puckTempPosition.x] is -1
						break
						#print 'ahhh theres already a purple there!'
					else
						countingArray.push(i)
				#print countingArray
				randomYDown = Utils.randomChoice(countingArray)
			#print randomYDown
			if randomYDown is tileNumHigh-1
				for tilesDownAll in [(puckTempPosition.y+1)..(tileNumHigh-1)]
					generatedLevel.board[tilesDownAll][puckTempPosition.x] = -1
					
				puckTempPosition.y = tileNumHigh-1
			else
				for tilesDown in [(puckTempPosition.y+1)..(randomYDown-1)]
					generatedLevel.board[tilesDown][puckTempPosition.x] = -1
					
				generatedLevel.board[randomYDown][puckTempPosition.x] = 1
				puckTempPosition.y = randomYDown-1
		
		if currentMove is "up"
			if puckTempPosition.y is 1
				randomYUp = 0
			else 
				for i in [(puckTempPosition.y-2)..0]
					if generatedLevel.board[i][puckTempPosition.x] is -1
						break
						#print 'ahhh theres already a purple there!'
					else
						countingArray.push(i)
				#print countingArray
				randomYUp = Utils.randomChoice(countingArray)
			#print randomYUp
			if randomYUp is 0
				for tilesUpAll in [(puckTempPosition.y-1)..0]
					generatedLevel.board[tilesUpAll][puckTempPosition.x] = -1
					
				puckTempPosition.y = 0
			else
				for tilesUp in [(puckTempPosition.y-1)..(randomYUp+1)]
					generatedLevel.board[tilesUp][puckTempPosition.x] = -1
					
				generatedLevel.board[randomYUp][puckTempPosition.x] = 1
				puckTempPosition.y = randomYUp+1
		
		
		
# 		print '--------------------------'
# 	print 'directionsToSolution: (below)'
# 	print directionsToSolution
	
	generatedLevel.board[generatedLevel.puckStartY][generatedLevel.puckStartX] = -0.5
	
	#Generate Rocks at random
	if rockPercentage is 0
		randomRockArray = [0]
	else
		randomRockArray = [1]
	for i in [1... Utils.round((1/rockPercentage))]
		randomRockArray.push(0)
	#print randomRockArray
	for rowIndex in [0...tileNumHigh]
		for ColIndex in [0...tileNumWide]
			if generatedLevel.board[rowIndex][ColIndex] is 0
				randomRock = Utils.randomChoice(randomRockArray)
				generatedLevel.board[rowIndex][ColIndex] = randomRock
	
	generatedLevel.goal.x = puckTempPosition.x + 0
	generatedLevel.goal.y = puckTempPosition.y + 0
# 	print 'updated temp puck X: ' + puckTempPosition.x
# 	print 'updated temp puck Y: ' + puckTempPosition.y
	generatedLevel.puck.x = generatedLevel.puckStartX + 1 - 1
	generatedLevel.puck.y = generatedLevel.puckStartY + 1 - 1
	levels.push(generatedLevel)
# 	if levelBuildingError is true
# 		print 'error!'
# 		window.location.reload()
# 		print 'error!'
# print levelBuildingErrorCode

#Generate Level Code
difficulty = 'hard'
if difficulty is 'easy'
	numberOfMovesToComplete = 3
	rockPercentage = 4

if difficulty is 'medium'
	numberOfMovesToComplete = 5
	rockPercentage = 4
	
if difficulty is 'hard'
	numberOfMovesToComplete = 10
	rockPercentage = .20

generateLevelFunction(numberOfMovesToComplete, 12, 18, rockPercentage)



#------------------------------
#------------------------------
#------------------------------
#------------------------------
#------------------------------
#------------------------------
#------------------------------
#------------------------------
# LEVEL GENERATOR OVER
#------------------------------
#------------------------------
#------------------------------
#------------------------------
#------------------------------


currentLevel = levels[5]
rows = 0
cols = 0


gridSize = 70
gutter = 2
gridRadius = 10
gridWidth  = gridSize
gridHeight = gridSize
boardWrapperColor = 'white'

#number of levels
# print Object.keys(levels).length
# print Object.keys(levels)

numberOfMoves = 0

#level_1.board[0][0]
#***************************************************
#Colors

# Create a new Color, store within a variable 
lightGrey = new Color("grey").lighten(45)


# Set background
bg = new BackgroundLayer backgroundColor: "#28affa"
bg.bringToFront()

titlebar = new Layer
	height: 100
	width: Screen.width
	backgroundColor: lightGrey
CurrentlevelName = new Layer
	backgroundColor: 'transparent'
	superLayer: titlebar
CurrentlevelName.html = currentLevel.name

titleText = {
	font: "100 50px/1.1 Helvetica Neue"
	textAlign: "center"
	color: "black"
	letterSpacing: '10px'
}

CurrentlevelName.style = titleText
CurrentlevelName.size = Utils.textSize(CurrentlevelName.html, titleText)
CurrentlevelName.bringToFront()
CurrentlevelName.center()

# numberOfMoves = new Layer
# 	backgroundColor: 'transparent'
# 	superLayer: titlebar
# 	visible: false
# numberOfMoves.html = 
# 
# titleText = {
# 	font: "100 50px/1.1 Helvetica Neue"
# 	textAlign: "center"
# 	color: "black"
# 	letterSpacing: '10px'
# }
# 
# numberOfMoves.style = titleText
# numberOfMoves.size = Utils.textSize(numberOfMoves.html, titleText)
# numberOfMoves.bringToFront()

levelSelector = new Layer
	width: Screen.width-100
	height: Screen.height-titlebar.height
	backgroundColor: lightGrey
	y: Screen.height
levelSelector.centerX()
# levelSelector.centerY(titlebar.height)

#Level Selector
createLevelButtons = (buttonNumber) ->
	levelSelectButton[buttonNumber].on Events.Click,()->
		currentLevel = levels[buttonNumber]
		createLevel()
		levelSelector.bringToFront()
		levelSelector.animate
			properties:
				y: Screen.height
			curve: 'spring(300,50,0)'
			time: 0.2

levelNameRowIndex = 0
levelNameGutter = 50
levelSelectButton = []
for level in levels
	levelNameButton = new Layer
		backgroundColor: 'transparent'
		superLayer: levelSelector
		x: 50
		name: level.name + ' button'
	levelSelectButton.push(levelNameButton)
	levelNameButton.html = level.name
	levelText = {
		font: "100 50px/1.1 Helvetica Neue"
		textAlign: "center"
		color: "black"
		letterSpacing: '10px'
	}
	levelNameButton.style = levelText
	levelNameButton.size = Utils.textSize(levelNameButton.html, levelText)
	levelNameButton.y = levelNameRowIndex * (levelNameButton.height + levelNameGutter)+ 50
	createLevelButtons(levelNameRowIndex)
	levelNameRowIndex++


# Wrapper that will center the grid
boardWrapper = new Layer 
	backgroundColor: boardWrapperColor, clip: false
	width: gridSize*cols+gutter*cols+gutter
	height: gridSize*rows+gutter*rows+gutter
boardWrapper.centerX()
boardWrapper.centerY(titlebar.height)

createLevel = () ->
	CurrentlevelName.html = currentLevel.name
	gridNumber = 0
	rows = currentLevel.board.length
	cols = currentLevel.board[0].length
	
	puckCol = []
	
	goalPosition = currentLevel.goal
	
# 	currentLevel.board[currentLevel.goal.y][currentLevel.goal.x] = 0.5
	
	puckCoordinates = currentLevel.puck
	#print puckCoordinates
	
	boardWrapper.width = gridSize*cols+gutter*cols
	boardWrapper.height = gridSize*rows+gutter*rows
	
	
	cells = []
	
	# Create the grid layers
	for rowIndex in [0...rows]
		cells[rowIndex] = []
		for colIndex in [0...cols]
			#for correct naming
			#print gridNumber
			cell = new Layer
				name: "grid_" + gridNumber
				width:  gridWidth
				height: gridHeight
				x: colIndex * (gridWidth + gutter) + gutter/2
				y: rowIndex * (gridHeight + gutter) + gutter/2
				borderRadius: gridRadius
				superLayer: boardWrapper
			cells[rowIndex].push(cell)
			#Block identification
			if currentLevel.board[rowIndex][colIndex] is -0.5
				cell.backgroundColor = 'white'
			if currentLevel.board[rowIndex][colIndex] is -1
				cell.backgroundColor = 'white'
			if currentLevel.board[rowIndex][colIndex] is 0
				cell.backgroundColor = 'white'
			if currentLevel.board[rowIndex][colIndex] is 0.5
				cell.backgroundColor = 'transparent'
			if currentLevel.board[rowIndex][colIndex] is 1
				cell.backgroundColor = 'grey'
			if currentLevel.board[rowIndex][colIndex] is 2
				cell.backgroundColor = 'red'
			if currentLevel.board[rowIndex][colIndex] is 3
				cell.backgroundColor = 'yellow'
			gridNumber++
	boardWrapper.centerX()
	boardWrapper.centerY(titlebar.height/2)
	
	cellMidX = (xCoordinate, yCoordinate) -> 
# 		#When puck is not in the boardWrapper
# 		#boardWrapper.x + cells[yCoordinate][xCoordinate].midX
		cells[yCoordinate][xCoordinate].midX
	
	cellMidY = (xCoordinate, yCoordinate) -> 
# 		#When puck is not in the boardWrapper
# 		#boardWrapper.y + cells[yCoordinate][xCoordinate].midY
		cells[yCoordinate][xCoordinate].midY
	
	
	goal = new Layer
		width: gridSize
		height: gridSize
		borderRadius: 20
		backgroundColor: 'green'
		opacity: 0.8
		midX: cellMidX(currentLevel.goal.x, currentLevel.goal.y)
		midY: cellMidY(currentLevel.goal.x, currentLevel.goal.y)
		superLayer: boardWrapper
	
	
	puck = new Layer
		width: gridSize
		height: gridSize
		borderRadius: 60
		backgroundColor: 'black'
		opacity: 0.8
		midX: cellMidX(currentLevel.puckStartX, currentLevel.puckStartY)
		midY: cellMidY(currentLevel.puckStartX, currentLevel.puckStartY)
		superLayer: boardWrapper
	
	
		# Win Condition
	puck.on Events.AnimationEnd,()->
		if puckCoordinates.x == goalPosition.x and puckCoordinates.y == goalPosition.y
			winner.bringToFront()
			winner.animate
				properties: 
					scale: 1
				curve: 'spring(300,40,0)'
	
	controler = new Layer
		width: Screen.width
		height: Screen.height-titlebar.height
		midX: boardWrapper.midX
		midY: boardWrapper.midY
		backgroundColor: 'transparent'
# 		backgroundColor: 'yellow'
# 		opacity: 0.7
	controler.draggable.enabled = true
	controler.draggable.momentum = false
	controlerOrigin = [controler.midX, controler.midY]
	
	controlerResponsiveness = 100
	controlerRespsNumUp = controler.midY-controlerResponsiveness
	controlerRespsNumDown = controler.midY+controlerResponsiveness
	controlerRespsNumLeft = controler.midX-controlerResponsiveness
	controlerRespsNumRight = controler.midX+controlerResponsiveness
	
	# print puckCoordinates
	nextMoveQueue = []
	
	controler.on Events.DragEnd,()->
		if puck.isAnimating isnt true 
			if controler.midY < controlerRespsNumUp and controler.draggable.direction == 'up'
				#print 'controler up'
				puckMoveUp()
				#print 'puck up fixed'
				#print puck.isAnimating
			if controler.midY > controlerRespsNumDown and controler.draggable.direction == 'down'
				#print 'controler down'
				puckMoveDown()
				#print 'puck down fixed'
			if controler.midX < controlerRespsNumLeft and controler.draggable.direction == 'left'
				#print 'controler left'
				puckMoveLeft()
				#print "move puck left \\ dynamic"
			if controler.midX > controlerRespsNumRight and controler.draggable.direction == 'right'
				#print 'controler right'
				puckMoveRight()
				#print 'move puck right \\ dynamic'
				#print puckCoordinates
		else
			if controler.midY < controlerRespsNumUp and controler.draggable.direction == 'up'
				nextMoveQueue.push('up')
# 				print nextMoveQueue
			if controler.midY > controlerRespsNumDown and controler.draggable.direction == 'down'
				nextMoveQueue.push('down')
# 				print nextMoveQueue
			if controler.midX < controlerRespsNumLeft and controler.draggable.direction == 'left'
				nextMoveQueue.push('left')
# 				print nextMoveQueue
			if controler.midX > controlerRespsNumRight and controler.draggable.direction == 'right'
				nextMoveQueue.push('right')
# 				print nextMoveQueue
	
	puck.on Events.AnimationEnd,()->
		if nextMoveQueue.length > 0
			for i in nextMoveQueue
				if i is 'right'
					puckMoveRight()
					nextMoveQueue.shift()
				if i is 'down'
					puckMoveDown()
					nextMoveQueue.shift()
				if i is 'left'
					puckMoveLeft()
					nextMoveQueue.shift()
				if i is 'up'
					puckMoveUp()
					nextMoveQueue.shift()
# 			print nextMoveQueue
	
	controler.on Events.DragEnd, ()->
		controler.midX = controlerOrigin[0]
		controler.midY = controlerOrigin[1]

	#Device Scaling 2.0
	boardPadding = 50*2
	boardScaleFactor = 1
	if boardWrapper.width > Screen.width-boardPadding or boardWrapper.height > Screen.height-boardPadding
		#print 'its big!'
		if boardWrapper.width > Screen.width-boardPadding
			boardScaleFactor = Screen.width/(boardWrapper.width+boardPadding)
		if boardWrapper.height > Screen.height-boardPadding
			boardScaleFactor = Screen.height/(boardWrapper.height+boardPadding+titlebar.height*4)
	#Scaling Up
# 	if boardWrapper.width < Screen.width-boardPadding or boardWrapper.height < Screen.height-boardPadding
# 		print 'its small!'
# 		if Screen.height/(boardWrapper.height+boardPadding+titlebar.height*4) < Screen.width/(boardWrapper.width+boardPadding)
# 			boardScaleFactor = Screen.width/(boardWrapper.width+boardPadding)
# 		if Screen.height/(boardWrapper.height+boardPadding+titlebar.height*4) > Screen.width/(boardWrapper.width+boardPadding)
# 			boardScaleFactor = Screen.height/(boardWrapper.height+boardPadding+titlebar.height*4)
	boardWrapper.scale = boardScaleFactor
	#print boardScaleFactor
	#controler.scale = boardScaleFactor
	

	#	TITLE TYPE ACTIONS	#
	#	TITLE TYPE ACTIONS	#
	#	TITLE TYPE ACTIONS	#
	
	tile2break = (moveDirection, nearestObstacle) ->
		if moveDirection is 'right'
			puck.animate
				properties: 
					midX: cellMidX(puckCoordinates.x+nearestObstacle+1 ,puckCoordinates.y)
				curve: puckCurve
				time: puckCurveTime
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x+nearestObstacle+1
			puckCoordinates.y = puckCoordinates.y
		if moveDirection is 'left'
			puck.animate
				properties: 
					midX: cellMidX(puckCoordinates.x-nearestObstacle-1,puckCoordinates.y)
				curve: puckCurve
				time: puckCurveTime
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x-nearestObstacle-1
			puckCoordinates.y = puckCoordinates.y 
		if moveDirection is 'down'
			puck.animate
				properties: 
					midY: cellMidY(puckCoordinates.x,puckCoordinates.y+nearestObstacle+1)
				curve: puckCurve
				time: puckCurveTime
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x
			puckCoordinates.y = puckCoordinates.y+nearestObstacle+1
		if moveDirection is 'up'
			puck.animate
				properties: 
					midY: cellMidY(puckCoordinates.x,puckCoordinates.y-nearestObstacle-1)
				curve: puckCurve
				time: puckCurveTime
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x
			puckCoordinates.y = puckCoordinates.y-nearestObstacle-1
	
	#	END TITLE TYPE ACTIONS	#
	#	END TITLE TYPE ACTIONS	#
	#	END TITLE TYPE ACTIONS	#
	
	puckMoveRight = ->
		puckRow = currentLevel.board[puckCoordinates.y]
		puckFromEdgeArray = puckRow[puckCoordinates.x..]
		puckFromEdgeArray.shift()
		#print puckFromEdgeArray
		#print puckFromEdgeArray
		for i in puckFromEdgeArray
			if i > 0
				tileType = i
				break #stop going through the row
		if i <= 0
			puck.animate
				properties: 
					midX: cellMidX(cols-1,puckCoordinates.y)
				curve: puckCurve
				time: puckCurveTime
			puckCoordinates.x = cols-1
			puckCoordinates.y = puckCoordinates.y 
		nearestObstacle = puckFromEdgeArray.indexOf(tileType)
		#^ returns the coordinate of the block
		if tileType is 0.5
			tile2break('right', nearestObstacle)
		if tileType is 1
			puck.animate
				properties: 
					midX: cellMidX(puckCoordinates.x+nearestObstacle, puckCoordinates.y)
				curve: puckCurve
				time: puckCurveTime
				
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x+nearestObstacle
			puckCoordinates.y = puckCoordinates.y 
		if tileType is 2
			tile2break('right', nearestObstacle)
			#print 'break right'
	
	
	puckMoveLeft = ->
		puckRow = currentLevel.board[puckCoordinates.y]
		puckFromEdgeLeftArray = puckRow[..puckCoordinates.x]
		puckFromEdgeLeftArrayReverse = puckFromEdgeLeftArray.reverse()
		puckFromEdgeLeftArrayReverse.shift()
		#print puckFromEdgeLeftArrayReverse
		for i in puckFromEdgeLeftArrayReverse
			if i > 0
				tileType = i
				break #stop going through the row
		if i <= 0
			puck.animate
				properties: 
					midX: cellMidX(0, puckCoordinates.y)
				curve: puckCurve
				time: puckCurveTime
			#now update coordinates
			puckCoordinates.x = 0
			puckCoordinates.y = puckCoordinates.y 
		nearestObstacle = puckFromEdgeLeftArrayReverse.indexOf(tileType)
		#^ returns the coordinate of the block
		if tileType is 0.5
			tile2break('left', nearestObstacle)
		if tileType is 1
			puck.animate
				properties: 
					midX: cellMidX(puckCoordinates.x-nearestObstacle, puckCoordinates.y)
				curve: puckCurve
				time: puckCurveTime
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x-nearestObstacle
			puckCoordinates.y = puckCoordinates.y 
		if tileType is 2
			tile2break('left', nearestObstacle)
			#print 'break left'
	
	
	puckMoveDown = ->
		puckCol = []
		for ab in [puckCoordinates.y..currentLevel.board.length-1] by 1
			puckCol.push(currentLevel.board[ab][puckCoordinates.x])
		puckCol.shift()
		#print puckCol
		for i in puckCol
			if i > 0
				tileType = i
				break #stop going through the row
		if i <= 0
			puck.animate
				properties: 
					midY: cellMidY(puckCoordinates.x,rows-1)
				curve: puckCurve
				time: puckCurveTime
			#now update coordinates
			puckCoordinates.x = puckCoordinates.x
			puckCoordinates.y = rows-1 
		nearestObstacle = puckCol.indexOf(tileType)
		#^ returns the coordinate of the block
		if tileType is 0.5
			tile2break('down', nearestObstacle)
		if tileType is 1
			puck.animate
				properties: 
					midY: cellMidY(puckCoordinates.x, puckCoordinates.y+nearestObstacle)
				curve: puckCurve
				time: puckCurveTime
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x
			puckCoordinates.y = puckCoordinates.y+nearestObstacle 
		if tileType is 2
			tile2break('down', nearestObstacle)
			#print 'break down'
	
	
	puckMoveUp = ->
		puckCol = []
		for ab in [0..puckCoordinates.y]
			puckCol.push(currentLevel.board[ab][puckCoordinates.x])
		puckCol.reverse()
		puckCol.shift()
		#print puckCol
		for i in puckCol
			if i > 0
				tileType = i
				break #stop going through the row
		if i <= 0
			puck.animate
				properties: 
					midY: cellMidY(puckCoordinates.x,0)
				curve: puckCurve
				time: puckCurveTime
			#now update coordinates
			puckCoordinates.x = puckCoordinates.x
			puckCoordinates.y = 0 
		nearestObstacle = puckCol.indexOf(tileType)
		#^ returns the coordinate of the block
		if tileType is 0.5
			tile2break('up', nearestObstacle)
		if tileType is 1
			puck.animate
				properties: 
					midY: cellMidY(puckCoordinates.x, puckCoordinates.y-nearestObstacle)
				curve: puckCurve
				time: puckCurveTime
			#Update puck coordinates
			puckCoordinates.x = puckCoordinates.x
			puckCoordinates.y = puckCoordinates.y-nearestObstacle 
		if tileType is 2
			tile2break('up', nearestObstacle)
			#print 'break up'
	
	refreshButtton = new Layer
		maxX: Screen.width
		maxX: Screen.width - 50
		backgroundColor: 'transparent'
		scale: 0.5
		opacity: 0.6
		html: '<?xml version="1.0" encoding="utf-8"?>
<!-- Generator: Adobe Illustrator 19.2.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
<path d="M16,0l-2.3,2.3c-1.4-1.3-3.2-2.1-5-2.2C6.8-0.1,4.9,0.4,3.4,1.5L3.2,1.6c-3,2.2-4.1,6.1-2.6,9.5c1.5,3.6,5.4,5.5,9.1,4.7
	C13.3,15,16,11.7,16,8h-2c0,2.7-2,5.2-4.6,5.8c0,0,0,0,0,0c-2.8,0.6-5.7-0.9-6.8-3.5c-1.1-2.6-0.3-5.6,2-7.2
	c2.3-1.6,5.6-1.3,7.7,0.7L10,6h6L16,0L16,0z"/>
</svg>
'
	
	levelChange = false
# 	print 'level change: ' + levelChange
	shakeCount = -1
	refreshButtton.on Events.Click,()->
		controler.draggable.enabled = false
		puck.animate
			properties: 
				opacity: 0
			time: 0.4
# 		boardWrapper.animate
# 			properties: 
# 				x: boardWrapper.x+50
# 			time: 0.1
# 		shakeCount++
# 		boardWrapper.on Events.AnimationEnd,->
# 			if shakeCount isnt -1
# 				shakeCount++
# 			print shakeCount
# 			if shakeCount is 1
# 				#print '0 fired'
# 				boardWrapper.animate
# 					properties: 
# 						x: boardWrapper.x-100
# 					time: 0.1
# 			if shakeCount is 2
# 				#print '1 fired'
# 				boardWrapper.animate
# 					properties: 
# 						x: boardWrapper.x+50
# 					time: 0.1
# 				shakeCount = -1
# 				print shakeCount
		puck.once Events.AnimationEnd, () ->
			puck.midX = cellMidX(currentLevel.puckStartX, currentLevel.puckStartY)
			puck.midY = cellMidY(currentLevel.puckStartX, currentLevel.puckStartY)
			puckCoordinates.x = currentLevel.puckStartX
			puckCoordinates.y = currentLevel.puckStartY
			puck.animate
				properties: 
					opacity: 1
				time: 0.4
			controler.draggable.enabled = true
		refreshButtton.animate
			properties: 
				rotation: 360
		refreshButtton.on Events.AnimationEnd,()->
			refreshButtton.rotation = 0
# 		for rowTile in cells
# 			for colTile in rowTile
# 				colTile.destroy()
# 		puck.destroy()
# 		goal.destroy()
# 		controler.destroy()
# 		refreshButtton.destroy()
#		createLevel()
		
		
# 		wrapper.animate
# 			properties:
# 				scale: 0.6
# 				opacity: 0
# 			time: 0.5
# 		puck.animate
# 			properties:
# 				opacity: 0
# 			time: 0.2
# 		goal.animate
# 			properties:
# 				opacity: 0
# 			time: 0.2
# 		wrapper.on Events.AnimationEnd,()->
# 			#print wrapper.subLayers()
# 			createLevel()
# 			#window.location.reload()
	destroyLevel = () ->
		puck.midX = cellMidX(currentLevel.puckStartX, currentLevel.puckStartY)
		puck.midY = cellMidY(currentLevel.puckStartX, currentLevel.puckStartY)
		puckCoordinates.x = currentLevel.puckStartX
		puckCoordinates.y = currentLevel.puckStartY
		for rowTile in cells
			for colTile in rowTile
				colTile.destroy()
		puck.destroy()
		goal.destroy()
		controler.destroy()
		refreshButtton.destroy()


	CurrentlevelName.on Events.Click,()->
		destroyLevel()
		levelSelector.animate
			properties: 
				y: titlebar.height+50
# 		currentLevel = null
		CurrentlevelName.html = mainMenu.name
		
	if debugMode
		showSolutionButton = new Layer
			superLayer: titlebar
			height: titlebar.height-30
			width: titlebar.height-30
			backgroundColor: 'purple'
			opacity: 0.8
			x: 50
			borderRadius: 10
		showSolutionButton.centerY()
		solutionShown = false
		
		showSolutionButton.on Events.Click, ->
			if solutionShown
					#print 'hiding solution'
					for rowIndex in [0...rows]
						for ColIndex in [0...cols]
							if currentLevel.board[rowIndex][ColIndex] is -1
								cells[rowIndex][ColIndex].backgroundColor = 'white'
					solutionShown = false
			else
					#print 'showing solution'
					for rowIndex in [0...rows]
						for ColIndex in [0...cols]
							if currentLevel.board[rowIndex][ColIndex] is -1
								cells[rowIndex][ColIndex].backgroundColor = 'purple'
					solutionShown = true



winner = new Layer
	backgroundColor: '#1ACCAB'
	width: Screen.width
	height: Screen.height
	cornerRadius: 20
	opacity: 0.9
	scale: 0
winner.center()

winner.html = "YOU WON!"

heading = {
	font: "100 125px/1.1 Helvetica Neue"
	padding: "600px 20px"
	textAlign: "center"
	color: "white"
}

subheading = {
	font: "100 100px/1.1 Helvetica Neue"
	textAlign: "center"
	color: "white"
}


winner.style = heading
#winner.size = Utils.winner(winner.html, heading)
winner.on Events.Click,->
	destroyLevel()
	createLevel()

createLevel()

#Debugging!
# puck.on Events.AnimationEnd,()->
# 	print 'puck:'
# 	print puckCoordinates
# 	print 'goal:'
# 	print goalPosition

# CONTROLLING ALL OF THE TILES IN THE GRID
# 		timeDelay = 0
# 		for rowTile in cells
# 			for colTile in rowTile
# 				colTile.animate
# 					properties:
# 						rotation: 90
# 						scale: 0.8
# 					time: 0.1
# 					delay: timeDelay
# 				timeDelay = timeDelay + 0.2


#if currentLevel is mainMenu
#	controler.visible = false
#	refreshButtton.visible = false

# print currentLevel
# print levelBuildingErrorCode
# print Utils.round(Utils.randomNumber(0, 100))