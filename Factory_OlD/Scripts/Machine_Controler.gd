extends Node2D

#First of all, i'm gona deifine hera how a machine is defined,
#they create objects every x time depending of the type of machine their are 
#and thy produce diferent objects.
#The OBJECT GOES ON THE DIRECTION ON WITH THE MACHINE IS FACING 


# I have to delete that, I should use a sub-scene and instance it for every machine
#it will have some variables depending of the type,
#btu no texture, the texture is the tile itself(not sure of that idea, but promesing)
#i have to figuere out how to make node positioning work with the tile2D


class_name machine

var id
var pos
var type
var orientation

func _init(ID,x,y,Type,Orientation):
	id = ID
	pos =Vector2(x,y)
	type = Type
	orientation = Orientation


	
