extends Machine
class_name Converter

var res1Name : String 
var res2Name : String
var res3Name : String
var res4Name : String

var res1Quantity : int 
var res2Quantity : int
var res3Quantity : int
var res4Quantity : int

var resourceDictionary : Dictionary


func setConverterMateriels(res1Name : String ,res2Name : String, res3Name : String, res4Name : String,
							res1Quantity : int, res2Quantity : int, res3Quantity : int, res4Quantity : int ):
	self.resourceDictionary[res1Name] = 0
	self.resourceDictionary[res2Name] = 0
	self.resourceDictionary[res3Name] = 0
	self.resourceDictionary[res4Name] = 0
	
	print(resourceDictionary)
	self.res1Name = res1Name
	self.res2Name = res2Name
	self.res3Name = res3Name
	self.res4Name = res4Name
	
	self.res1Quantity = res1Quantity
	self.res2Quantity = res2Quantity
	self.res3Quantity = res3Quantity
	self.res4Quantity = res4Quantity
	
	
func haveEnoughResources() -> bool:
	var ok : bool = false
	if resourceDictionary[res1Name] >= res1Quantity:
		if resourceDictionary[res2Name] >= res2Quantity:
			if resourceDictionary[res2Name] >= res3Quantity:
				if resourceDictionary[res2Name] >= res4Quantity:
					ok = true
	return ok

func generateResource():
	if haveEnoughResources():
		.generateResource()
		resourceDictionary[res1Name] -= res1Quantity
		resourceDictionary[res2Name] -= res2Quantity
		resourceDictionary[res3Name] -= res3Quantity
		resourceDictionary[res4Name]-= res4Quantity


func addressource(area : Area2D):
	if area.is_in_group(res1Name):
		self.resourceDictionary[res1Name] += 1
		print("+1 in " + res1Name)
	if area.is_in_group(res2Name):
		self.resourceDictionary[res2Name] += 1
	if area.is_in_group(res3Name):
		self.resourceDictionary[res3Name] += 1
	if area.is_in_group(res4Name):
		self.resourceDictionary[res4Name] += 1
	
