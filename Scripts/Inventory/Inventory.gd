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
		on top.
		"""
		items.resize(items.size() + (item.Size - 1))
	items.append(item)
	emit_signal("item_added", item)

func remove_item(item) -> bool:
	match typeof(item):
		TYPE_STRING: break
		TYPE_ARRAY: break
		TYPE_INT: break
	return false
