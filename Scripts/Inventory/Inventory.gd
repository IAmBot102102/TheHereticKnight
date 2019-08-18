extends Node
class_name Inventory

"""
Parent class for any item storage type. When an
inventory is projected to the player, a VisibleInventory
will read the contents of this node to retrieve the
inventory.
"""

# Emitted when an item has been added.
signal item_added (item)
# Emitted when an item is removed.
# Item is passed to listeners of this signal before removal.
signal item_removed (item)
# Emitted when the item can't be added to the inventory.
signal item_rejected (item)
signal inventory_resized (added_slots)

# The default number of slots in any given inventory.
# NOTE: Inventory size on the screen is determined by a GUI.
export var MaxSlots := 10

var items : Array

func add_item(item : Item):
	if (items.size() + item.Size) > MaxSlots:
		emit_signal("item_rejected", item)
		return
	if item.Size > 1:
		"""
		If the size is larget than one, stick null entries
		into the array, then leave one slot for the actual item
		on top. If the size of the item is 1, then nothing would
		happen anyway, since "size() + 0" is just "resize(size())"
		"""
		items.resize(items.size() + (item.Size - 1))
	items.append(item)
	emit_signal("item_added", item)

func remove_item(item : Item):
	"""
	# TODO
	
	"find()" isn't very performant, and should be replaced with 
	a custom search algorithm. Items themselves are queried for
	the search, and should use an index instead. 
	
	Add a "remove_item()" function that uses an index from an 
	inventory instead. Item names could be useful, too.
	"""
	var idx := items.find(item)
	items.remove(idx)
	print(idx)
	# This removes the null entries that came before it.
	if item.Size > 1:
		for i in range(1, item.Size):
			items.remove(idx - i)