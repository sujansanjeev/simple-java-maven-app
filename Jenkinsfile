pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                bat 'mvn clean install'  // Use Windows command to build with Maven
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t simple-java-app .'  // Build the Docker image
            }
        }

        stage('Docker Run') {
            steps {
                bat 'docker run -d -p 8080:8080 simple-java-app'  // Run the container
            }
        }
    }
}
