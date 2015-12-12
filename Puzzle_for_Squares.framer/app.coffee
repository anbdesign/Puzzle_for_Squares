#bugs, not updating location in all directions

#ToDos
#-------------------
#Put on Git hub
#Do everything in SVGs, like arrows
#Put in title bar
#animate intro: 
#	start blocks opacity 0, scale 1.2
#	animate blocks, for [i] in cells scale 1 opacity 1 i++


#new level idea, you can have triangle that push the puck diagonally when they hit

#This is the ice game :-) 

# 0 = blank space	//
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
#Levels


level_1 = {
	name: 'LEVEL 1'
	lowestScore: null
	puck: {x: 1, y: 4}
	goal: {x: 5, y: 7}
	board: [
		[1,  0,  0,  1,  0,  0],
		[0,  0,  0,  0,  1,  1],
		[2,  0,  0,  0,  0,  0],
		[0,  0,  1,  0,  0,  2],
		[1,  0,  0,  0,  0,  0],
		[0,  0,  0,  0,  0,  1],
		[1,  0,  0,  0,  0,  0],
		[1,  0,  0,  2,  0,  0],
		[1,  0,  2,  0,  1,  1],
	]
}

rows = level_1.board.length
cols = level_1.board[0].length

puckCol = []

goalPosition = level_1.goal

currentLevel = level_1

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
	width: Screen.width
	backgroundColor: lightGrey
levelName = new Layer
	backgroundColor: 'transparent'
	superLayer: titlebar
levelName.html = currentLevel.name

titleText = {
	font: "100 50px/1.1 Helvetica Neue"
	textAlign: "center"
	color: "black"
	letterSpacing: '10px'
}

levelName.style = titleText
levelName.size = Utils.textSize(levelName.html, titleText)
levelName.bringToFront()
levelName.center()

numberOfMoves = new Layer
	backgroundColor: 'transparent'
	superLayer: titlebar
	visible: false
numberOfMoves.html = 

titleText = {
	font: "100 50px/1.1 Helvetica Neue"
	textAlign: "center"
	color: "black"
	letterSpacing: '10px'
}

numberOfMoves.style = titleText
numberOfMoves.size = Utils.textSize(numberOfMoves.html, titleText)
numberOfMoves.bringToFront()



refreshButtton = new Layer
	maxX: Screen.width
	maxX: Screen.width - 50

Events.keys



gutter = 10
gridSize = 100
gridWidth  = gridSize
gridHeight = gridSize
gridNumber = 0

cells = []

# Wrapper that will center the grid
wrapper = new Layer 
	backgroundColor: "transparent", clip: false
	width: gridSize*cols+gutter*cols
	height: gridSize*rows+gutter*rows

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
			x: colIndex * (gridWidth + gutter)
			y: rowIndex * (gridHeight + gutter)
			borderRadius: 2
			superLayer: wrapper
		cells[rowIndex].push(cell)
		#Block identification
		if level_1.board[rowIndex][colIndex] is 0
			cell.backgroundColor = 'white'
		if level_1.board[rowIndex][colIndex] is 1
			cell.backgroundColor = 'grey'
		if level_1.board[rowIndex][colIndex] is 2
			cell.backgroundColor = 'red'
		if level_1.board[rowIndex][colIndex] is 3
			cell.backgroundColor = 'yellow'
		gridNumber++
wrapper.center()

puckCoordinates = level_1.puck

cellMidX = (xCoordinate, yCoordinate) -> 
	wrapper.x + cells[yCoordinate][xCoordinate].midX

cellMidY = (xCoordinate, yCoordinate) -> 
	wrapper.y + cells[yCoordinate][xCoordinate].midY


goal = new Layer
	width: 100
	height: 100
	borderRadius: 20
	backgroundColor: 'green'
	opacity: 0.8
	midX: cellMidX(level_1.goal.x, level_1.goal.y)
	midY: cellMidY(level_1.goal.x, level_1.goal.y)


puck = new Layer
	width: 100
	height: 100
	borderRadius: 60
	backgroundColor: 'black'
	opacity: 0.8
	midX: cellMidX(level_1.puck.x, level_1.puck.y)
	midY: cellMidY(level_1.puck.x, level_1.puck.y)

#	TITLE TYPE ACTIONS	#
#	TITLE TYPE ACTIONS	#
#	TITLE TYPE ACTIONS	#

tile2break = (moveDirection, nearestObstacle) ->
	if moveDirection is 'right'
		puck.animate
			properties: 
				midX: cellMidX(puckCoordinates.x+nearestObstacle+1 ,puckCoordinates.y)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x+nearestObstacle+1
		puckCoordinates.y = puckCoordinates.y
	if moveDirection is 'left'
		puck.animate
			properties: 
				midX: cellMidX(puckCoordinates.x-nearestObstacle-1,puckCoordinates.y)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x-nearestObstacle-1
		puckCoordinates.y = puckCoordinates.y 
	if moveDirection is 'down'
		puck.animate
			properties: 
				midY: cellMidY(puckCoordinates.x,puckCoordinates.y+nearestObstacle+1)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x
		puckCoordinates.y = puckCoordinates.y+nearestObstacle+1
	if moveDirection is 'up'
		puck.animate
			properties: 
				midY: cellMidY(puckCoordinates.x,puckCoordinates.y-nearestObstacle-1)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x
		puckCoordinates.y = puckCoordinates.y-nearestObstacle-1

#	END TITLE TYPE ACTIONS	#
#	END TITLE TYPE ACTIONS	#
#	END TITLE TYPE ACTIONS	#

puckMoveRight = ->
	puckRow = level_1.board[puckCoordinates.y]
	puckFromEdgeArray = puckRow[puckCoordinates.x..]
	puckFromEdgeArray.shift()
	#print puckFromEdgeArray
	#print puckFromEdgeArray
	for i in puckFromEdgeArray
		if i > 0
			tileType = i
			break #stop going through the row
	if i is 0
		puck.animate
			properties: 
				midX: cellMidX(cols-1,puckCoordinates.y)
		puckCoordinates.x = cols-1
		puckCoordinates.y = puckCoordinates.y 
	nearestObstacle = puckFromEdgeArray.indexOf(tileType)
	#^ returns the coordinate of the block
	if tileType is 1
		puck.animate
			properties: 
				midX: cellMidX(puckCoordinates.x+nearestObstacle, puckCoordinates.y)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x+nearestObstacle
		puckCoordinates.y = puckCoordinates.y 
	if tileType is 2
		tile2break('right', nearestObstacle)
		#print 'break right'


puckMoveLeft = ->
	puckRow = level_1.board[puckCoordinates.y]
	puckFromEdgeLeftArray = puckRow[..puckCoordinates.x]
	puckFromEdgeLeftArrayReverse = puckFromEdgeLeftArray.reverse()
	puckFromEdgeLeftArrayReverse.shift()
	#print puckFromEdgeLeftArrayReverse
	for i in puckFromEdgeLeftArrayReverse
		if i > 0
			tileType = i
			break #stop going through the row
	if i is 0
		puck.animate
			properties: 
				midX: cellMidX(0, puckCoordinates.y)
		#now update coordinates
		puckCoordinates.x = 0
		puckCoordinates.y = puckCoordinates.y 
	nearestObstacle = puckFromEdgeLeftArrayReverse.indexOf(tileType)
	#^ returns the coordinate of the block
	if tileType is 1
		puck.animate
			properties: 
				midX: cellMidX(puckCoordinates.x-nearestObstacle, puckCoordinates.y)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x-nearestObstacle
		puckCoordinates.y = puckCoordinates.y 
	if tileType is 2
		tile2break('left', nearestObstacle)
		#print 'break left'


puckMoveDown = ->
	puckCol = []
	for ab in [puckCoordinates.y..level_1.board.length-1] by 1
		puckCol.push(level_1.board[ab][puckCoordinates.x])
	puckCol.shift()
	#print puckCol
	for i in puckCol
		if i > 0
			tileType = i
			break #stop going through the row
	if i is 0
		puck.animate
			properties: 
				midY: cellMidY(puckCoordinates.x,rows-1)
		#now update coordinates
		puckCoordinates.x = puckCoordinates.x
		puckCoordinates.y = rows-1 
	nearestObstacle = puckCol.indexOf(tileType)
	#^ returns the coordinate of the block
	if tileType is 1
		puck.animate
			properties: 
				midY: cellMidY(puckCoordinates.x, puckCoordinates.y+nearestObstacle)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x
		puckCoordinates.y = puckCoordinates.y+nearestObstacle 
	if tileType is 2
		tile2break('down', nearestObstacle)
		#print 'break down'


puckMoveUp = ->
	puckCol = []
	for ab in [0..puckCoordinates.y]
		puckCol.push(level_1.board[ab][puckCoordinates.x])
	puckCol.reverse()
	puckCol.shift()
	#print puckCol
	for i in puckCol
		if i > 0
			tileType = i
			break #stop going through the row
	if i is 0
		puck.animate
			properties: 
				midY: cellMidY(puckCoordinates.x,0)
		#now update coordinates
		puckCoordinates.x = puckCoordinates.x
		puckCoordinates.y = 0 
	nearestObstacle = puckCol.indexOf(tileType)
	#^ returns the coordinate of the block
	if tileType is 1
		puck.animate
			properties: 
				midY: cellMidY(puckCoordinates.x, puckCoordinates.y-nearestObstacle)
		#Update puck coordinates
		puckCoordinates.x = puckCoordinates.x
		puckCoordinates.y = puckCoordinates.y-nearestObstacle 
	if tileType is 2
		tile2break('up', nearestObstacle)
		#print 'break up'

#print puckCoordinates
#puckMoveLeft()
# print puckMoveLeft()
#puckMoveRight()
#print puckCoordinates
#puckMoveDown()
#puckMoveUp()


controler = new Layer
	width: Screen.width-100
	height: Screen.height-100
	midX: wrapper.midX
	midY: wrapper.midY
	backgroundColor: 'transparent'
controler.draggable.enabled = true
controler.draggable.momentum = false
controlerOrigin = [controler.midX, controler.midY]

controlerResponsiveness = 100
controlerRespsNumUp = controler.midY-controlerResponsiveness
controlerRespsNumDown = controler.midY+controlerResponsiveness
controlerRespsNumLeft = controler.midX-controlerResponsiveness
controlerRespsNumRight = controler.midX+controlerResponsiveness

# print puckCoordinates

controler.on Events.DragEnd,()->
	if puck.isAnimating isnt true 
		if controler.midY < controlerRespsNumUp and controler.draggable.direction == 'up'
			puckMoveUp()
			#print 'puck up fixed'
			#print puck.isAnimating
		if controler.midY > controlerRespsNumDown and controler.draggable.direction == 'down'
			puckMoveDown()
			#print 'puck down fixed'
		if controler.midX < controlerRespsNumLeft and controler.draggable.direction == 'left'
			puckMoveLeft()
			#print "move puck left \\ dynamic"
		if controler.midX > controlerRespsNumRight and controler.draggable.direction == 'right'
			puckMoveRight()
			#print 'move puck right \\ dynamic'
			#print puckCoordinates

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
winner.bringToFront()

# Win Condition
puck.on Events.AnimationEnd,()->
	if puckCoordinates.x == goalPosition.x and puckCoordinates.y == goalPosition.y
		winner.animate
			properties: 
				scale: 1
			curve: 'spring(300,40,0)'

# print puckCoordinates
# print goalPosition

#Debugging!
# puck.on Events.AnimationEnd,()->
# 	print 'puck:'
# 	print puckCoordinates
# 	print 'goal:'
# 	print goalPosition
 

controler.on Events.DragEnd, ()->
	controler.midX = controlerOrigin[0]
	controler.midY = controlerOrigin[1]

refreshButtton.on Events.Click,()->
	wrapper.animate
		properties:
			scale: 0.6
			opacity: 0
		time: 0.5
	puck.animate
		properties:
			opacity: 0
		time: 0.2
	goal.animate
		properties:
			opacity: 0
		time: 0.2
	wrapper.on Events.AnimationEnd,()->
		window.location.reload()