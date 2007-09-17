DROP="/home/matt/todo-drop"

alias t="$DROP/todo.py"

function tw {
    $DROP/todo.py x @work @okr p:tests
    $DROP/todo.py $*
    $DROP/todo.py x
}

function tc {
    $DROP/todo.py x @class @soda p:class p:e190 p:cs188 p:chem1a p:cs281a p:research
    $DROP/todo.py $*
    $DROP/todo.py x
}

alias b="$DROP/todo.py b"
