extends Node

"""
@global

This script contains all possible flags for the
"modifiers" property of any item.

The single enum below is bound to the script, so
you can call any flag with "ItemFlag.FLAG"

This may be removed in the future, as matching different
flags in a plethora of nested if-else statements results
in total chaos.
"""
enum {
	# Checked when the item modifies an inventory size.
	FLAG_MODIFY_INVENTORY_SIZE
}
