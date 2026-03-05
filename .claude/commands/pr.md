---
allowed-tools: Bash(git branch:*), Bash(git log:*), Bash(git diff:*), Bash(gh pr create:*), Bash(ls:*), Bash(cat:*), AskUserQuestion
description: Create a GitHub Pull Request
---

# Context

- Current branch: !`git branch --show-current`
- Base branch: !`git log --oneline --merges -1 2>/dev/null || echo "main"`
- Recent commits on this branch: !`git log --oneline main..HEAD 2>/dev/null || git log --oneline -10`
- Changed files: !`git diff --name-only main 2>/dev/null || git diff --name-only HEAD~1`
- Project README (if exists): !`ls README* readme* 2>/dev/null | head -1 | xargs cat 2>/dev/null | head -30 || echo "No README found"`

# Your task

1. **Detect project language**: Analyze the README content and recent commit messages to determine if this project is primarily in German or English. Use that language for the PR title and description.

2. **Ask the user** (using AskUserQuestion) if there is an issue or ticket ID (e.g. GitHub issue number, Jira ticket, YouTrack ID) that should be referenced in the PR. If yes, include it in the PR description.

3. **Create the PR** using `gh pr create` with:
   - A concise, descriptive title
   - A minimal description: only what is necessary to understand the change — no TODOs, no checklists, no template boilerplate
   - Reference to the issue/ticket ID if provided (e.g. `Closes #123` or just the ticket ID)
   - Target the appropriate base branch (usually `main`)

Keep the description as short as possible. Let the commits speak for themselves.
