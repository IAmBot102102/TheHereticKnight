extends Node
class_name Item

"""
Parent class for any item. Typically, this class 
should be extended when creating new item types or
hard-coded items.

Typical hard-coded items that come to mind are the
legendaries that you find in hack-and-slashers. Those
are hard-coded into the game, so you find less of them.
Hence the title "Legendary item." 
"""

"""
Item rarity. Though not implemented YET, It's here
as sort of a #TODO.
"""
enum Rarity {
	COMMON, UNCOMMON, RARE, LEGENDARY
}

export var Name := "@undefined_N"
export var Description := "@undefined_D"
# The item rarity (or drop chance)
export var DropClass : int = Rarity.COMMON
# The size of the item in the inventory
export var Size : int = 1

"""
Anything about this item that can change the player
will be represented in this array. It is checked
when the item is added to said players' inventory.

An example would be increasing the default amount
of slots available in the players' inventory (Bags), or
something they have equipped that changes a certain stat.

Flag constants are loaded as a global
"""
var modifiers : Array
