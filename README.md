# MySwiftUIApp

A SwiftUI iOS application with CI/CD setup using GitHub Actions and Fastlane.

## Requirements

- Xcode 13.0+
- iOS 15.0+
- Ruby 3.0+ (for Fastlane)
- XcodeGen
- GitHub CLI (for setting up secrets)

## Setup

1. Install XcodeGen:
```bash
brew install xcodegen
```

2. Install Ruby dependencies:
```bash
bundle install
```

3. Generate Xcode project:
```bash
xcodegen generate
```

4. Open the generated Xcode project:
```bash
open MySwiftUIApp.xcodeproj
```

## CI/CD

The project uses GitHub Actions for continuous integration and delivery:

- On every pull request: Builds and runs tests
- On main branch pushes: Builds, tests, and distributes to TestFlight

### Setting up GitHub Secrets

There are two ways to set up the required secrets for TestFlight distribution:

#### Option 1: Using the Setup Script (Recommended)

Run the provided setup script:
```bash
./scripts/setup_secrets.sh
```

The script will:
1. Install GitHub CLI if not already installed
2. Prompt you to log in to GitHub if needed
3. Ask for your App Store Connect credentials
4. Automatically set up the required secrets in your GitHub repository

#### Option 2: Manual Setup

To enable TestFlight distribution, add these secrets manually in your GitHub repository settings:

1. Go to your repository's Settings → Secrets and variables → Actions
2. Add the following secrets:
   - `APP_STORE_CONNECT_API_KEY_ID`
   - `APP_STORE_CONNECT_API_ISSUER_ID`
   - `APP_STORE_CONNECT_API_KEY`

## Testing

Run tests locally using Fastlane:
```bash
bundle exec fastlane test
```

## Distribution

Deploy to TestFlight using Fastlane:
```bash
bundle exec fastlane beta
``` 