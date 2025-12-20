# Quick Start Guide

Get your workflow-tester running in minutes!

## 1. Clone and Setup (2 minutes)

```bash
git clone https://github.com/RensithUdara/workflow-tester.git
cd workflow-tester
chmod +x scripts/random_commit.sh
```

## 2. Configure (Optional)

Edit `config.sh` to customize behavior:

```bash
# Example: Change to 10-minute intervals and 3-5 commits
MIN_COMMITS=3
MAX_COMMITS=5
MIN_DELAY=60   # 1 minute
MAX_DELAY=300  # 5 minutes
```

## 3. Test Locally

```bash
# Run the script once
./scripts/random_commit.sh

# View results
cat workflow.log
cat random.txt
```

## 4. Push to GitHub

```bash
git add .
git commit -m "Initial commit"
git push origin main
```

## 5. Monitor Workflow

1. Go to your GitHub repo → **Actions**
2. Select **Auto Committer** workflow
3. Watch it run every 5 minutes!

## Common Tasks

### Change Execution Frequency

Edit `.github/workflows/auto-committer.yml`:

```yaml
cron: "*/10 * * * *"  # Change to every 10 minutes
```

### Disable Workflow Temporarily

In GitHub repo settings → **Actions** → **Disable**

Or modify the schedule:
```yaml
- cron: "0 0 5 * *"  # Runs only on 5th of month
```

### View Execution Logs

```
GitHub → Actions → Auto Committer → Latest Run → View logs
```

### Reset Log Files

```bash
# Clear random.txt (keep git history)
echo "" > random.txt
git add random.txt
git commit -m "Reset log file"
git push
```

---

**Need help?** Check [README.md](README.md) for full documentation or [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.
