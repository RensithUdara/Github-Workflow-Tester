# Workflow Tester

An automated GitHub Actions workflow project that performs periodic random commits to simulate continuous activity and test workflow automation.

## Overview

This project demonstrates automated commit workflows using GitHub Actions. It runs on a scheduled interval (every 5 minutes) to automatically generate and push commits with random log entries to the repository.

## Features

- **Automated Commits**: Automatically generates commits on a configurable schedule
- **Random Entry Generation**: Creates random log entries with timestamps
- **Scheduled Execution**: Runs via GitHub Actions on a cron schedule
- **Manual Trigger**: Supports manual workflow dispatch for on-demand execution
- **Configurable Intervals**: Easy to adjust commit frequency

## Project Structure

```
workflow-tester/
├── .github/
│   └── workflows/
│       └── auto-committer.yml      # GitHub Actions workflow configuration
├── scripts/
│   └── random_commit.sh            # Script to generate random commits
├── random.txt                       # Log file for commit entries
└── README.md                        # This file
```

## How It Works

### Workflow Execution

The GitHub Actions workflow (`auto-committer.yml`) triggers automatically every 5 minutes. When executed, it:

1. **Checks out** the repository using the GitHub token
2. **Configures Git** with author information
3. **Runs** the `random_commit.sh` script
4. **Commits and pushes** changes to the main branch

### Random Commit Script

The `random_commit.sh` script:

- Generates **2-4 random commits** per execution
- Appends timestamped log entries to `random.txt`
- Spaces out commits with 30-300 second delays
- Pushes all changes to the origin main branch

Each log entry includes:
- Current date and time
- A random number for uniqueness

## Configuration

### Workflow Schedule

Edit the cron expression in [.github/workflows/auto-committer.yml](.github/workflows/auto-committer.yml):

```yaml
on:
  schedule:
    - cron: "*/5 * * * *"  # Every 5 minutes
```

**Cron Format**: `minute hour day month dayofweek`
- `*/5 * * * *` = Every 5 minutes
- `0 */2 * * *` = Every 2 hours
- `0 0 * * *` = Daily at midnight

### Git Configuration

Update the Git user details in the workflow file:

```yaml
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Requirements

- GitHub repository with Actions enabled
- Write permissions on the repository
- `GITHUB_TOKEN` secret (automatically provided by GitHub)

## Usage

### Automatic Execution

The workflow runs automatically based on the configured schedule (every 5 minutes by default).

### Manual Trigger

To trigger the workflow manually:

1. Go to your repository on GitHub
2. Click **Actions**
3. Select **Auto Committer**
4. Click **Run workflow**

### Local Testing

To test the script locally:

```bash
chmod +x scripts/random_commit.sh
./scripts/random_commit.sh
```

## Files

| File | Purpose |
|------|---------|
| `.github/workflows/auto-committer.yml` | GitHub Actions workflow configuration |
| `scripts/random_commit.sh` | Bash script that generates random commits |
| `random.txt` | Log file where commit entries are appended |
| `README.md` | Project documentation |

## Use Cases

- Testing GitHub Actions workflows
- Simulating continuous repository activity
- Learning GitHub Actions automation
- Maintaining contribution streaks
- Demo/testing purposes for CI/CD pipelines

## Security Notes

- The workflow uses `secrets.GITHUB_TOKEN` which is automatically provided by GitHub Actions
- Git credentials are configured within the workflow context
- No sensitive information is committed to the repository
- Ensure appropriate branch protection rules are in place

## Customization

### Change Commit Frequency

Modify the cron schedule in `auto-committer.yml` to adjust how often commits are generated.

### Modify Commit Count

Edit the `COMMITS` calculation in `random_commit.sh` to change how many commits per execution:

```bash
COMMITS=$(( ( RANDOM % 3 ) + 2 ))  # Currently 2-4 commits
```

### Change Target Branch

Update the push command in `random_commit.sh`:

```bash
git push origin main  # Change 'main' to your branch
```

## Troubleshooting

**Workflow not running?**
- Ensure GitHub Actions is enabled in repository settings
- Check workflow syntax in the Actions tab
- Verify branch exists and is accessible

**Commits not pushing?**
- Verify push permissions and branch protection rules
- Check that the target branch exists
- Review workflow run logs for error messages

**Script permissions errors?**
- The workflow handles `chmod +x` automatically
- For local testing, run: `chmod +x scripts/random_commit.sh`

## Workflow Logs

View workflow execution logs in GitHub:

1. Go to repository **Actions** tab
2. Select **Auto Committer** workflow
3. Click on a specific run to see detailed logs

## License

This project is provided as-is for educational and testing purposes.

## Author

Created by RensithUdara

---

**Last Updated**: December 2025
