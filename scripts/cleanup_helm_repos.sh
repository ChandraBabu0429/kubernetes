#!/bin/bash

# Step 1: List all Helm deployments
helm list -A --output yaml > helm_deployments.yaml

# Step 2: List all repositories
helm repo list > helm_repos.txt

# Step 3: Check which repos are in use
declare -A repo_in_use

# Parse Helm deployments to find which repos are used
while read -r line; do
    if [[ "$line" =~ "chart:" ]]; then
        chart=$(echo $line | cut -d ':' -f 2- | xargs)
        repo_name=$(echo $chart | cut -d '/' -f 1)
        repo_in_use["$repo_name"]=1
    fi
done < helm_deployments.yaml

# Step 4: Suggest repositories to remove
echo "The following repositories are not in use by any current deployment:"
while read -r line; do
    repo_name=$(echo $line | awk '{print $1}')
    if [[ -z ${repo_in_use["$repo_name"]} ]]; then
        echo $repo_name
    fi
done < helm_repos.txt

# Step 5: Ask for confirmation to remove
read -p "Do you want to remove these repositories? (y/n): " confirm
if [[ $confirm == "y" ]]; then
    while read -r line; do
        repo_name=$(echo $line | awk '{print $1}')
        if [[ -z ${repo_in_use["$repo_name"]} ]]; then
            echo "Removing unused repository: $repo_name"
            helm repo remove $repo_name
        fi
    done < helm_repos.txt
    # Update helm repositories after removal
    helm repo update
else
    echo "No repositories were removed."
fi

# Clean up temporary files
rm helm_deployments.yaml helm_repos.txt
