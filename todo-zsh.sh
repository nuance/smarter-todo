DROP="$HOME/dev/projects/todo"

alias t="$DROP/todo.py"

tw () {
    CURRENT=`$DROP/todo.py xl`
    $DROP/todo.py xa @work @okr p:tests
    $DROP/todo.py $*
    $DROP/todo.py xr
    $DROP/todo.py x $CURRENT
}

tc () {
    CURRENT=`$DROP/todo.py xl`
    $DROP/todo.py xa @class @soda @cory p:class p:nlp p:pml p:espm p:cs194 p:research
    $DROP/todo.py $*
    $DROP/todo.py x
    $DROP/todo.py x $CURRENT
}

today () {
    $DROP/todo.py lst $*
}

tomorrow () {
    $DROP/todo.py nd $*
}

((PRECMD_COUNTER=0))

todoprecmd () { 
    if ((PRECMD_COUNTER == 0)); then 
	if ((`date +"%s"` - `stat -f "%c" ~/.todo-plan` > 3600)); then
	    today > ~/.todo-plan
	fi
	cat ~/.todo-plan

	((PRECMD_COUNTER=5))
    fi
    ((PRECMD_COUNTER--))
}

alias b="$DROP/todo.py b"
