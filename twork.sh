#!/bin/bash

bash -c "/home/mattj/todo-drop/todo.py -p ls @work ; /home/mattj/todo-drop/todo.py -p ls p:tests | grep -v @okr " | sort | uniq
