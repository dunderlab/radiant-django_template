# Django Template for Radiant Wrapper

This repository contains a Django project template that can be used with Radiant to create mobile applications from your Django web application.

## Project Structure

This is a standard Django project. The main project directory is `project/`, which contains:

- `manage.py`: Django's command-line utility for administrative tasks
- `project/`: The actual Django project package with settings, URLs, and WSGI/ASGI configurations

## Configuration

### .p4a File

The `.p4a` file in the root directory must be filled with the following configuration:

```
--package org.example.django_app
--name "My WebView Django Application"
--dist_name project
--version 0.1
--port 5000
--icon assets/icon.png
--presplash assets/icon_w.png
--presplash-color #ff6439
--requirements python3,hostpython3,sqlite3,sqlparse,asgiref,pytz,pyjnius
```

This configuration specifies:

- `--package`: The Java package name for your Android application
- `--name`: The display name of your application
- `--dist_name`: The distribution name (should match your Django project name)
- `--version`: The version number of your application
- `--port`: The port number your Django application will run on
- `--icon`: Path to the application icon image file
- `--presplash`: Path to the splash screen image shown during app launch
- `--presplash-color`: Background color for the splash screen in hex format
- `--requirements`: Python packages required for your application


## Getting Started

1. Clone this repository
2. Make sure the `.p4a` file is properly configured
3. Develop your Django application in the `project/` directory
4. Use Radiant to build and deploy your mobile application

## GitHub Workflow

This repository includes a GitHub workflow file (`.github/workflows/radiant_wrapper.yml`) that automatically generates an installable APK for Android. The workflow is triggered:

- On every push to the repository
- Manually through the GitHub Actions interface

The workflow performs the following steps:
1. Sets up the build environment
2. Installs necessary dependencies
3. Configures the application based on your project structure
4. Builds an Android APK for ARM64 architecture
5. Uploads the generated APK as a GitHub artifact

After the workflow completes, you can download the APK from the GitHub Actions page of your repository.
