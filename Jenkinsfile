pipeline {
    agent {
        docker {
            image 'python:3-alpine'
            args '-p 3000:3000 -p 5000:5001'
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
                sh 'py.test --verbose --junit-xml tests/reports/results.xml'
            }
           post {
                always {
                    junit 'tests/reports/results.xml'
                }
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                sh 'ls -l scripts scripts/start_dev.sh'
                sh './scripts/start_dev.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './scripts/kill.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh './scripts/start_dev.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './scripts/kill.sh'
            }
        }
    }
    }