extends Resource

# Grid.gd
# Stores a 1-dimensional array while providing functions to
# allow the user to interact with it as a 2-dimensional array

var Grid = []

var COLUMNS
var ROWS

func _init(var x, var y, var default = null):
	COLUMNS = x
	ROWS = y
	
	var i = 0
	while i < x*y:
		Grid.append(default)
		i += 1

func setElement(var x, var y, var set):
	Grid[coordsToIndex(x, y)] = set

func getElement(var x, var y):
	return Grid[coordsToIndex(x,y)]


#Index to Coordinates converters
func coordsToIndex(var x, var y):
	if isValid(x,y) == false:
		print("Value pair(", x, ",", y, ") out of range")
	else:
		x -= 1
		y -= 1
		x += y * COLUMNS
		return x

func indexToCoords(var index):
	if(index < 0 or index >= COLUMNS*ROWS):
		print("Out of range")
		return null
		
	else:
		var ret = Vector2()
		ret.x = (index % COLUMNS) + 1
		ret.y = (index / COLUMNS) + 1
		return ret


#Print all squares and their content
func printAll():
	var i = 0
	while i < Grid.size() :
		print(indexToCoords(i), ": ", Grid[i])
		i += 1

#Return true if passed coordinates are in grid parameters
func isValid(var x, var y):
	if (typeof(x) != TYPE_INT or typeof(y) != TYPE_INT):
		return false

	if x < 1 or y < 1:
		return false 
	elif x > COLUMNS or y > ROWS:
		return false
	else:
		return true 
