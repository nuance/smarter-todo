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
    $DROP/todo.py xa @class @soda @cory p:class p:nlp p:pml p:espm p:cs194 p:research
    $DROP/todo.py $*
    $DROP/todo.py x
		$DROP/todo.py x $CURRENT
}

alias b="$DROP/todo.py b"
