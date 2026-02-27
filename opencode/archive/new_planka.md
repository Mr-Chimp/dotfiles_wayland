---
description: Personal To Do workflow documentation - how user manages tasks and projects in Planka
mode: primary
model: zai-coding-plan/glm-4.5
temperature: 0.3
tools:
  write: true
  edit: true
  bash: false
  read: true
  glob: true
  grep: true
  permission:
    edit: allow
    bash: deny
    webfetch: allow
---

# Personal To Do Workflow Documentation

## OVERVIEW

Personal To Do is a SINGLE board for their personal project managment. Not split by type - everything goes here.

---

## LISTS AND THEIR PURPOSES

### TODO (Workload Queue)
**What it is:** This is what gets worked through
**Purpose:** Task execution space

### Active (Currently Active Projects)
**What it is:** What's occupying mental space right now - domains/projects currently engaged with
**Purpose:** NOT a to-do list - more like "active thinking spaces"
**Important:** Do NOT "clean this up" - it manages mental space, not workload

### Can't Do Now (Blocked)
**What it is:** Items that can't be started because Active list has too much occupying mental space
**Purpose:** Overflow management when Active is full
**Key:** These become doable when Active shrinks

---

## DOMAIN LISTS

Every other list is considered a 'domain list' these all form a collective backlog 

Examples of domain list purposes:
- Game Development - Game dev ideas and old code placeholders
- Self Hosted Server Software - Server projects to try/learn
- Homelab Stuff - Infrastructure and homelab work
- Miniature Hobby - Painting queue for garage models

---

## KEY WORKFLOW PATTERNS

### 1. TODO is Workload, Active is NOT
   - Tasks are worked through TODO list
   - Tasks are created in TODO based on Active tasks and tasks in real life.
   - Active is "what's occupying mental space right now" - not a to-do queue

---

## REMEMBER

Personal To Do is a SINGLE board:
- TODO = workload execution (work through this list)
- Active = mental context management (what's occupying mental space)
- Can't do now = overflow when Active is too full
- Want To Do = backlog ideas
- Domain lists = domain-specific backlogs (e.g., Game Dev, Homelab)

The system is designed for tasks to be added as needed without consultation.
