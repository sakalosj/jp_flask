pipeline {
    agent {
        docker {
            image 'python:3-alpine'
            args '-p 3000:3000 -p 5001:5000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'find . -name requirements.txt'
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'py.test'
            }
        }
    }
}