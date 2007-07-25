#!/bin/bash

TODODROP=~/todo-drop

bash -c "$TODODROP/todo.py -p ls @work ; $TODODROP/todo.py -p ls p:tests" | grep -v @okr | sort | uniq
