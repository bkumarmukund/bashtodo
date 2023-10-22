# bashtodo

**bashtodo** is a simple, command-line task(todo) manager implemented as an executable bash script. It allows you to manage your to-do list with ease. You can add, list, mark tasks as complete, and delete tasks using the command line.

## Table of Contents
- [Usage](#usage)
- [Features](#features)
- [Installation](#installation)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Usage

```bash
./bashtodo [options]
-l: List all tasks.
-a "task": Add a new task.
-c task_number: Mark a task as complete.
-d task_number: Delete a task.
```

## Features

- Manage your to-do list from the command line.
- Easily add new tasks to your list.
- Mark tasks as complete with a simple command.
- Delete tasks that are no longer needed.
- List all tasks with task numbers for easy reference.

## Installation

1. Download: Download the bashtodo.sh script to your preferred directory.
2. Configuration: Open the script and set the filename variable to specify where your to-do list will be stored.
3. Optional Notifications: You can choose your preferred notification method by setting the notify variable (either notify-send or echo for no notifications).
4. Make Executable: Make the script executable:
```bash
   chmod +x bashtodo.sh
```

## Examples

- List all tasks:
```bash
./bashtodo -l
```
Sample Output:
```plaintext
[01] Add tasks to the bashtodo project
[02] Test the bashtodo script
[03] Document the bashtodo project in the README
```

- Add a new task:
```bash
./bashtodo -a "This is a new task."
```

- Mark a task as complete (replace task_number with the actual task number):
```bash
./bashtodo -c 1
```
Sample Output:
```plaintext
Task 1 marked as complete.
```

- Delete a task (replace task_number with the actual task number):
```bash
./bashtodo -d 2
```

Sample Output:
```plaintext
Task 2 deleted.
```

## Contributing

Contributions are welcome! If you have any improvements or suggestions, please create a pull request.

## License

This project is licensed under the MIT License.
