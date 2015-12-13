#ToDos
#-------------------
# add swipe multiple swiping
#Do everything in SVGs, like arrows
#animate intro: 
#	start blocks opacity 0, scale 1.2
#	animate blocks, for [i] in cells scale 1 opacity 1 i++


#new level idea, you can have triangle that push the puck diagonally when they hit

#new idea, blocks shift color when you an action happens

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

mainMenu = {
	name: 'MAIN MENU'
}

levels = []

level_1 = {
	name: 'LEVEL 1'
	lowestScore: null
	puckStartX: 0
	puckStartY: 0
	puck: {x: 0, y: 0}
	goal: {x: 5, y: 7}
	board: [
		[0,  0,  0,  1,  0,  0],
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
levels.push(level_1)

level_2 = {
	name: 'LEVEL 2'
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


currentLevel = mainMenu
rows = 0
cols = 0

#number of levels
# print Object.keys(levels).length
# print Object.keys(levels)

numberOfMoves = 0

levelChange = false
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
levelSelector.centerX()
levelSelector.centerY(titlebar.height)

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


gutter = 10
gridSize = 100
gridWidth  = gridSize
gridHeight = gridSize


# Wrapper that will center the grid
wrapper = new Layer 
	backgroundColor: "transparent", clip: false
	width: gridSize*cols+gutter*cols
	height: gridSize*rows+gutter*rows
wrapper.center()

createLevel = () ->
	gridNumber = 0
	rows = currentLevel.board.length
	cols = currentLevel.board[0].length
	
	puckCol = []
	
	goalPosition = currentLevel.goal
	
	puckCoordinates = currentLevel.puck
	#print puckCoordinates
	
	wrapper.width = gridSize*cols+gutter*cols
	wrapper.height = gridSize*rows+gutter*rows
	
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
				x: colIndex * (gridWidth + gutter)
				y: rowIndex * (gridHeight + gutter)
				borderRadius: 2
				superLayer: wrapper
			cells[rowIndex].push(cell)
			#Block identification
			if currentLevel.board[rowIndex][colIndex] is 0
				cell.backgroundColor = 'white'
			if currentLevel.board[rowIndex][colIndex] is 1
				cell.backgroundColor = 'grey'
			if currentLevel.board[rowIndex][colIndex] is 2
				cell.backgroundColor = 'red'
			if currentLevel.board[rowIndex][colIndex] is 3
				cell.backgroundColor = 'yellow'
			gridNumber++
	wrapper.center()
	
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
		midX: cellMidX(currentLevel.goal.x, currentLevel.goal.y)
		midY: cellMidY(currentLevel.goal.x, currentLevel.goal.y)
	
	
	puck = new Layer
		width: 100
		height: 100
		borderRadius: 60
		backgroundColor: 'black'
		opacity: 0.8
		midX: cellMidX(currentLevel.puckStartX, currentLevel.puckStartY)
		midY: cellMidY(currentLevel.puckStartX, currentLevel.puckStartY)
	
		# Win Condition
	puck.on Events.AnimationEnd,()->
		if puckCoordinates.x == goalPosition.x and puckCoordinates.y == goalPosition.y
			winner.bringToFront()
			winner.animate
				properties: 
					scale: 1
				curve: 'spring(300,40,0)'
	
	controler = new Layer
		width: wrapper.width
		height: wrapper.height
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
	controler.on Events.DragEnd, ()->
		controler.midX = controlerOrigin[0]
		controler.midY = controlerOrigin[1]
	
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
		puckRow = currentLevel.board[puckCoordinates.y]
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
		puckRow = currentLevel.board[puckCoordinates.y]
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
		for ab in [puckCoordinates.y..currentLevel.board.length-1] by 1
			puckCol.push(currentLevel.board[ab][puckCoordinates.x])
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
			puckCol.push(currentLevel.board[ab][puckCoordinates.x])
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
	
	refreshButtton = new Layer
		maxX: Screen.width
		maxX: Screen.width - 50
	
	levelChange = false
# 	print 'level change: ' + levelChange
	
	refreshButtton.on Events.Click,()->
		puck.midX = cellMidX(currentLevel.puckStartX, currentLevel.puckStartY)
		puck.midY = cellMidY(currentLevel.puckStartX, currentLevel.puckStartY)
		puckCoordinates.x = currentLevel.puckStartX
		puckCoordinates.y = currentLevel.puckStartY
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