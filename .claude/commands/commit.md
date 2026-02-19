---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*)
description: Create a signed git commit following Conventional Commits
---

# Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

# Your task

Based on the above changes, create a single git commit. Always use `git commit -S` to create a GPG/SSH signed commit. Stage and create the commit using a single message. Do not use any other tools or do anything else. Do not send any other text or messages besides these tool calls.

The commit message must end with the following trailer:

```
🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>
```

Follow the Conventional Commits specification below for the commit message format.

---

# Conventional Commits Guide for Claude Code

This guide describes the standard for commit messages in this project, based on the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

## Format

```txt
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Commit Types

### feat

Introduces a new feature.

**Examples:**

```txt
feat: add product variant synchronization
feat: support Hetzner firewall rules
feat: implement webhook retry mechanism with exponential backoff
```

### fix

Fixes a bug.

**Examples:**

```txt
fix: resolve volume mount permission issues
fix: handle nil pointer in order processing
fix: correct product variant parent-child relationship query
```

### refactor

Code change that doesn't alter functionality (performance, structure, readability).

**Examples:**

```txt
refactor: simplify order webhook handler logic
refactor: consolidate backend configurations
refactor: extract database connection logic into utility module
```

### perf

Performance improvements.

**Examples:**

```txt
perf: add indexes to product variant queries
perf: optimize bulk import with goroutine pooling
perf: reduce memory allocation in data processing
```

### docs

Documentation changes.

**Examples:**

```txt
docs: add deployment guide for YouTrack with OAuth
docs(fix): document webhook payload structure
docs(feat): explain state backend migration procedure
```

### test

New or modified tests.

**Examples:**
```
test(golang): add unit tests for fulfillment API
test(python): add integration tests for Shopware connector
test: increase coverage for error handling scenarios
```

### chore

Other changes (dependencies, build config, CI/CD, etc.).

**Examples:**

```txt
chore(deps): update Go dependencies
chore(ci): upgrade TeamCity Docker image to latest LTS
chore(build): add linting rules for Python projects
```

### ci

Changes to CI/CD configuration.

**Examples:**

```txt
ci: add automated deployment step for main branch
ci: configure artifact retention policies
ci: add CodeQL security scanning
```

### style

Code formatting, missing semicolons, etc. (no logical changes).

**Examples:**

```txt
style(go): apply gofmt formatting
style(lua): fix indentation in configuration files
```
