#!/bin/bash

TODO_FILE="tasks.txt"

# Function to add a task
function add_task() {
    task=$(rofi -dmenu -p "Enter task:")
    if [[ -n "$task" ]]; then
        echo "[ ] $task" >> "$TODO_FILE"
        rofi -e "Task added: $task"
    fi
}

# Function to list tasks
function list_tasks() {
    tasks=$(cat "$TODO_FILE" | rofi -dmenu -i -p "Tasks:")
    echo "$tasks"
}

# Function to mark a task as done
function complete_task() {
    tasks=$(cat "$TODO_FILE")
    task=$(echo "$tasks" | rofi -dmenu -i -p "Complete task:")
    
    if [[ -n "$task" ]]; then
        # Extract the actual task without the status marker
        task_content=$(echo "$task" | sed 's/^\[.\] //')
        # Mark the task as completed in the file
        sed -i "s/^\[ \] $task_content$/[x] $task_content/" "$TODO_FILE"
        rofi -e "Task completed: $task_content"
    fi
}

# Main loop for menu options
while true; do
    option=$(rofi -dmenu -p "Select an option:" <<EOF
Add Task
List Tasks
Complete Task
Quit
EOF
    )

    # Exit script if Escape key is pressed
    if [[ -z "$option" ]]; then
        break
    fi

    case $option in
        "Add Task")
            add_task
            ;;
        "List Tasks")
            list_tasks
            ;;
        "Complete Task")
            complete_task
            ;;
        "Quit")
            break
            ;;
        *)
            rofi -e "Invalid option: $option"
            ;;
    esac
done

exit 0
