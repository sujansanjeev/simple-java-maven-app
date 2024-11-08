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

        // stage('Docker Run') {
        //     steps {
        //         sh 'docker run -d -p 8081:8080 simple-java-app'  // Run the container
        //     }
        // }
    }
}
