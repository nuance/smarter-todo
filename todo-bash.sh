DROP="/home/matt/todo-drop"

alias t="$DROP/todo.py"

function tw {
		CURRENT=`$DROP/todo.py xl`
    $DROP/todo.py xa @work @okr p:tests
    $DROP/todo.py $*
    $DROP/todo.py xr
		$DROP/todo.py x $CURRENT
}

function tc {
		CURRENT=`$DROP/todo.py xl`
    $DROP/todo.py xa @class @soda p:class p:e190 p:cs188 p:chem1a p:cs281a p:research
    $DROP/todo.py $*
    $DROP/todo.py x
		$DROP/todo.py x $CURRENT
}

alias b="$DROP/todo.py b"
