extends Node
class_name Behaviour

var _parent :Node = null

func init(parent:Node) -> Node:
	_parent = parent
	return self
