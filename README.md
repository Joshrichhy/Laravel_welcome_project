Laravel Dockerized Project

This repository contains a Laravel application set up to run in a Docker container with Apache and PHP. Follow the steps below to clone, build, run, and manage the application.

Prerequisites

Make sure the following tools are installed on your system:

Git: For cloning the repository.
Docker: To build and run the application.
Bash: To execute the restart_laravel.sh script.


Setup Instructions

1. Clone the Repository
git clone  https://github.com/Joshrichhy/Laravel_welcome_project.git
cd Laravel_welcome_project
2. Build the Docker Image
Build the Docker image using the provided Dockerfile:

docker build -t laravel-app .
3. Run the Docker Container
Run the container, exposing port 80:
docker run -d -p 80:80 --name laravel-container laravel-app

4. Access the Application
Open your browser and navigate to:

http://localhost:80

You should see the message:
"Welcome to Lemonade Payment DevOps Assessment"

Managing CPU Usage and Restarting the Laravel Service

The restart_laravel.sh Script
The restart_laravel.sh script monitors CPU usage and restarts the Laravel service if it exceeds a specified threshold and it is in the root of the application.

Usage Instructions
1. Grant Execute Permissions:
    Before running the script, make it executable:
    chmod +x restart_laravel.sh
    Run the Script:
    Execute the script to monitor CPU usage and restart the Laravel service when necessary:
    ./restart_laravel.sh


Stopping the Application
    To stop the running container:
    RUN the following command in your terminal
    docker stop laravel-container
    docker rm laravel-container
