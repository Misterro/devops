pipeline {
    agent {
        docker {
            image '178.154.200.210:8082/box:$version'
        }
    }
    
    stages {
        stage ('pull project') {
            steps {
                git 'https://github.com/Misterro/boxfuse.git'
            }
        }
        
        stage ('build war') {
            steps {
                sh 'mvn package'
            }
        }
        
        stage ('build image') {
            steps {
                sh 'docker build --tag box:run$version .'
            }
        }
        
        stage ('push run images') {
            steps {
                sh 'docker tag box:run$version 178.154.200.210:8082/box:run$version && docker push 178.154.200.210:8082/box:run$version'
            }
        }
        
        stage ('run webapp') {
            agent any
            steps {
                sh 'docker run -p 8084:8080 178.154.200.210:8082/box:run$version'
            }
        }
    }
}
