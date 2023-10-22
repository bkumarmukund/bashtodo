#!/bin/bash

# Set the filename for your todo list
filename="$HOME/Documents/studyLog/$(date +%Y/%b/day%d.todo)"

# Set the notification command to be used
  # Use notify-send
  notify="notify-send -t 3000 -u"
  # Use echo
  #notify="echo "

# Check if the todo file exists; if not, create it
if [ ! -e "$filename" ]; then
    touch "$filename"
fi

# Function to display the todo list
display_todo() {
  if [ -s "$filename" ]; then
    awk -F ' ' '{ printf "[%02d] %s\n", NR, $0 }' "$filename"
  else
    $notify critical "No tasks found."
  fi
}

# Function to add a task to the todo list
add_task() {
    echo "$1" >> "$filename"
    $notify low "Task added: $1"
}

# Function to mark a task as complete
complete_task() {
    task_number=$1
    sed -i "${task_number}s/^/- [x] /" "$filename"
    $notify critical "Task $task_number marked as complete."
}

# Function to delete a task from list
delete_task() {
  task_number="$1"
  if [ -s "$filename" ]; then
    if [ "$task_number" -le "$(wc -l < "$filename")" ]; then
      sed -i "${task_number}d" "$filename"
      $notify low "Task $task_number deleted."
    else
      $notify critical "Invalid task number."
    fi
  else
    $notify critical "No tasks found."
  fi
}

# Parse command-line options
while getopts ":la:cd:" opt; do
  case $opt in
    l)
      # List tasks
      display_todo
      exit
      ;;
    a)
      # Add a task
      add_task "$OPTARG"
      exit
      ;;
    c)
      # Complete a task
      complete_task "$OPTARG"
      exit
      ;;
    d)
      # Delete a task
      delete_task "$OPTARG"      
      exit
      ;;
    *)
    echo "Usage: $0 [-l] [-a task] [-c task_number] [-d task_number]"
    ;;
  esac
done

# Main menu
if [ $OPTIND -eq 1 ]; then
  # Display todo if no argument
  display_todo
  exit 1
fi