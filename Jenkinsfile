pipeline {
    agent any

    tools {
        nodejs 'NodeJS-20'
    }

    stages {
        stage('Checkout') {
            steps {
                // Jenkins pulls the code automatically based on your job configuration
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Build Application') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Containerize Output') {
            steps {
                sh 'docker build -t angular-restful-crud:latest .'
            }
        }
    }
}