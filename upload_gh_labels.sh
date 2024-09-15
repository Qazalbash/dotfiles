#!/bin/bash

gh label create "bug" -c E74C3C -d "Something isn't working"
gh label create "documentation" -c 9B59B6 -d "Improvements or additions to documentation"
gh label create "duplicate" -c cfd3d7 -d "This issue or pull request already exists"
gh label create "enhancement" -c 1ABC9C -d "New feature or request"
gh label create "help_wanted" -c D35400 -d "Extra attention is needed"
gh label create "good_first_issue" -c 5DADE2 -d "Good for newcomers"
gh label create "question" -c d876e3 -d "Further information is requested"
gh label create "contributions_welcome" -c 63B658 -d "PRs are welcome"
gh label create "pull_ready" -c 210299 -d "Ready to be merged"
gh label create "experimental" -c B943F6 -d "Experimental feature"
gh label create "meta" -c F9D0C4 -d "Ignored label"
gh label create "dependencies" -c 0366d6 -d "Pull requests that update a dependency file"
gh label create "tutorial/example" -c 431276 -d "Example or tutorial"
gh label create "CPU" -c 006b75 -d "Accelerator is CPU (which doesn't accelerate actually)"
gh label create "GPU" -c 006b75 -d "Accelerator is GPU"
gh label create "TPU" -c 006b75 -d "Accelerator is TPU"
gh label create "github_actions" -c 000000 -d "Pull requests that update GitHub Actions code"
gh label create "P0" -c 2ECC71 -d "Low priority"
gh label create "P1" -c F1C40F -d "Medium priority"
gh label create "P2" -c E67E22 -d "High priority"