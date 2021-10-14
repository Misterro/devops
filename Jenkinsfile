pipeline {
    agent {
        docker {
            image '178.154.202.215:8082/box:$version'
            args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
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
                sh 'docker tag box:run$version 178.154.202.215:8082/box:run$version && docker push 178.154.202.215:8082/box:run$version'
            }
        }
        
        stage ('run webapp') {
            agent {
                    label 'node'
                }
            steps {
                sh 'ls'
            }
        }
    }
}
