#!/bin/bash

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) is not installed. Installing..."
    brew install gh
fi

# Check if logged in to GitHub CLI
if ! gh auth status &> /dev/null; then
    echo "Please login to GitHub CLI:"
    gh auth login
fi

# Get the repository name from git config
REPO_URL=$(git config --get remote.origin.url)
REPO_NAME=$(echo $REPO_URL | sed 's/.*github.com[:/]\(.*\).git/\1/')

# Function to set a secret
set_secret() {
    local secret_name=$1
    local secret_value=$2
    
    echo "Setting $secret_name..."
    echo "$secret_value" | gh secret set "$secret_name" --repo "$REPO_NAME"
}

# Prompt for App Store Connect credentials
echo "Please enter your Apple Developer Team ID (10-character string):"
read -r DEVELOPMENT_TEAM

echo "Please enter your App Store Connect API Key ID:"
read -r API_KEY_ID

echo "Please enter your App Store Connect Issuer ID:"
read -r ISSUER_ID

echo "Please enter the path to your App Store Connect API Key file:"
read -r API_KEY_PATH

if [ ! -f "$API_KEY_PATH" ]; then
    echo "Error: API Key file not found at $API_KEY_PATH"
    exit 1
fi

# Read the API Key file content
API_KEY=$(cat "$API_KEY_PATH")

# Set the secrets
set_secret "DEVELOPMENT_TEAM" "$DEVELOPMENT_TEAM"
set_secret "APP_STORE_CONNECT_API_KEY_ID" "$API_KEY_ID"
set_secret "APP_STORE_CONNECT_API_ISSUER_ID" "$ISSUER_ID"
set_secret "APP_STORE_CONNECT_API_KEY" "$API_KEY"

echo "✅ Secrets have been set successfully!"
echo "You can verify them in your GitHub repository settings under Secrets and variables → Actions" 