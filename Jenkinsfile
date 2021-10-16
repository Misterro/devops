pipeline {
    agent none

    stages {
        stage ('run webapp') {
            agent {
                label 'production'
            }
            steps {
                sh 'ls'
            }
        }
    }
}
