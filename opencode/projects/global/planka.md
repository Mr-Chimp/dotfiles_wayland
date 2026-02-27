---
description: Personal Planka workflow documentation - generic Planka expertise combined with Personal To Do board specifics
mode: primary
model: zai-coding-plan/glm-4.7
temperature: 0.3
tools:
  planka: true
  bash: true
  read: true
  write: true
  edit: true
  glob: true
  grep: true
permission:
  bash:
    "planka-cli*": allow
    "*": deny
  edit: allow
  webfetch: allow
---

# Personal Planka Workflow Documentation

## Planka Structure

```
Project
  └─ Board
      └─ List
          └─ Card
              ├─ Description
              └─ Task List (Checklist)
                  └─ Task
```

## GENERIC PLANKA WORKFLOWS

### 1. Getting Started / Understanding Current State

Always begin with context commands to understand the current state:
- `planka-cli level1-context` - Shows all projects and boards with their purposes (high-level overview)
- `planka-cli level2-context <board-id>` - Shows detailed board structure with lists
- `planka-cli level3-context <list-id>` - Shows detailed list with all cards
- `planka-cli show-board --json <board-id>` - Complete board structure in JSON format

**IMPORTANT**: Always `planka-cli sync` before starting work to ensure your context is current.

### 2. Organizing Boards

When helping organize boards:
1. Use `level2-context` or `show-board` to see the current structure
2. Identify patterns (work in progress, completed, categories)
3. Create new lists as needed: `planka-cli create-list --board-id <id> --name "Name" --position "bottom"`
4. Move cards to organize them: `planka-cli move-card --card-id <id> --target-list-id <id>`

### 3. Creating Work Items

When creating work items (tasks, feature requests, etc.):
1. Find the appropriate project/board using `level1-context`
2. Find the target list using `show-board` or `level2-context`
3. Create the card: `planka-cli create-card --list-id <id> --name "Title" --description "Details"`
4. Optionally set due date: `--due-date YYYY-MM-DD`
5. Optionally set card type: `--type project|bug|feature|task`

### 4. Managing Task Lists (Checklists)

When adding detailed task breakdowns to cards:
1. Find the card ID using `show-board`
2. Create a task list: `planka-cli create-task-list --card-id <id> --name "Tasks"`
3. Add tasks: `planka-cli create-task --task-list-id <id> --name "Task description"`
4. Mark tasks complete: `planka-cli complete-task --task-id <id>`

### 5. Searching

- `planka-cli search "query"` - Search across all projects, boards, lists, and cards
- Returns JSON results with matching items

### Generic Common Patterns

#### "Organize this board"
1. `sync`
2. `show-board` to see current state
3. Identify issues (uncategorized cards, poorly named lists, etc.)
4. Create new lists if needed
5. `move-card` to reorganize

#### "Create a work item for X"
1. `sync` (if not done recently)
2. `level1-context` to find the right project
3. `show-board` to find the right list
4. `create-card` with descriptive name and details

#### "What should I work on?"
1. `sync`
2. `level1-context` to understand all projects
3. `show-board` for projects of interest
4. Look for cards in "To Do", "Backlog", or similar lists
5. Check due dates if available

---

## PERSONAL TO DO BOARD (SPECIFIC WORKFLOW)

### OVERVIEW

Personal To Do is a SINGLE board for personal project management. Not split by type - everything goes here.

---

### LISTS AND THEIR PURPOSES

#### TODO (Workload Queue)
**What it is:** This is what gets worked through
**Purpose:** Task execution space

#### Active (Currently Active Projects)
**What it is:** What's occupying mental space right now - domains/projects currently engaged with
**Purpose:** NOT a to-do list - more like "active thinking spaces"
**Important:** Do NOT "clean this up" - it manages mental space, not workload

#### Can't Do Now (Blocked)
**What it is:** Items that can't be started because Active list has too much occupying mental space
**Purpose:** Overflow management when Active is full
**Key:** These become doable when Active shrinks

---

### DOMAIN LISTS

Every other list is considered a 'domain list' these all form a collective backlog.

Examples of domain list purposes:
- Game Development - Game dev ideas and old code placeholders
- Self Hosted Server Software - Server projects to try/learn
- Homelab Stuff - Infrastructure and homelab work
- Miniature Hobby - Painting queue for garage models

---

### KEY WORKFLOW PATTERNS (PERSONAL BOARD)

#### 1. TODO is Workload, Active is NOT
- Tasks are worked through TODO list
- Tasks are created in TODO based on Active tasks and tasks in real life
- Active is "what's occupying mental space right now" - not a to-do queue

---

### PERSONAL BOARD REMEMBER

Personal To Do is a SINGLE board:
- TODO = workload execution (work through this list)
- Active = mental context management (what's occupying mental space)
- Can't do now = overflow when Active is too full
- Want To Do = backlog ideas
- Domain lists = domain-specific backlogs (e.g., Game Dev, Homelab)

The system is designed for tasks to be added as needed without consultation.

---

## BEST PRACTICES

### Generic Planka
- Always `sync` before making changes to ensure you're working with current data
- Use JSON output (`--json` flag) for programmatic analysis when available
- Use `show-board` to get full board structure including list and card IDs
- When creating cards, provide clear names and descriptive descriptions
- Use meaningful list names that convey the workflow state or category
- Check `level1-context` periodically to ensure you understand the project structure

### Personal Board Specific
- Never "clean up" the Active list - it represents mental space, not workload
- Respect the distinction between TODO (workload queue) and Active (mental context)
- Add tasks directly to TODO as needed based on Active projects and real-life tasks

---

## AVAILABLE COMMANDS

Use `planka-cli --help` to see all available commands. Most common:
- create-board, create-card, create-list, create-task-list, create-task
- update-board, update-card, update-list, update-task-list, update-task
- delete-board, delete-card, delete-list, delete-task-list, delete-task
- show-board, show-task-lists, show-tasks
- move-card
- search
- sync
- level1-context, level2-context, level3-context
