pipeline {
    agent {
        docker {
            image '62.84.116.78:8082/box:$version'
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

        stage ('push run image') {
            steps {
                sh 'docker tag box:run$version 62.84.116.78:8082/box:run$version && docker push 62.84.116.78:8082/box:run$version'
            }
        }

        stage ('run webapp') {
            steps {
                sh 'ls'
                sh 'ssh jenkins@62.84.116.78'
                sh 'git clone https://github.com/Misterro/devops'
                sh 'docker-compose up -d'
            }
        }
    }
}
