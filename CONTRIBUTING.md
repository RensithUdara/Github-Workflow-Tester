# Contributing to Workflow Tester

Thank you for your interest in improving this project! Here are the guidelines for contributing.

## How to Contribute

### 1. Local Development

#### Setup
```bash
git clone https://github.com/RensithUdara/workflow-tester.git
cd workflow-tester
chmod +x scripts/random_commit.sh
```

#### Testing Changes
```bash
# Test the commit script locally
./scripts/random_commit.sh

# View generated logs
cat workflow.log
```

### 2. Configuration Customization

Edit `config.sh` to customize behavior:

```bash
# Number of commits per run
MIN_COMMITS=2
MAX_COMMITS=4

# Delay between commits (seconds)
MIN_DELAY=30
MAX_DELAY=300

# Target branch
TARGET_BRANCH="main"

# Enable/disable debug logging
DEBUG_MODE=true
```

### 3. Workflow Modifications

To modify the GitHub Actions workflow:

1. Edit `.github/workflows/auto-committer.yml`
2. Test locally or use workflow dispatch
3. Verify in the Actions tab

### 4. Reporting Issues

When reporting issues, include:
- Workflow run link
- Error message or unexpected behavior
- Steps to reproduce
- Expected vs. actual result

## Code Standards

- Use bash best practices in scripts
- Add error handling and validation
- Include informative logging
- Add comments for complex logic
- Follow existing code style

## Testing Checklist

- [ ] Script runs without errors locally
- [ ] Git commits are created properly
- [ ] Changes are pushed successfully
- [ ] Workflow logs are generated
- [ ] No sensitive data is exposed

## Project Structure

```
workflow-tester/
├── .github/workflows/      # GitHub Actions workflows
├── scripts/                 # Automation scripts
├── config.sh               # Configuration file
├── random.txt              # Output log
├── workflow.log            # Execution logs
└── README.md               # Documentation
```

## Questions?

Open an issue or discussion in the repository.

---

**Happy Contributing!**
