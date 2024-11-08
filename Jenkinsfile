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
                sh 'mvn clean install'  // Use Windows command to build with Maven
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t simple-java-app .'  // Build the Docker image
            }
        }
    }
}
