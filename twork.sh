#!/bin/bash

bash -c "/home/mattj/todo-drop/todo.py -p ls @work ; /home/mattj/todo-drop/todo.py -p ls @okr ; /home/mattj/todo-drop/todo.py -p ls p:tests" | sort | uniq
