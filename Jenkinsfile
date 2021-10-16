pipeline {
    agent none

    stages {

        stage ('pull project') {
            agent {
                            docker {
                                image '62.84.116.78:8082/box:$version'
                                args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
                            }
                        }
            steps {
                git 'https://github.com/Misterro/boxfuse.git'
            }
        }

        stage ('build war') {
            agent {
                    docker {
                        image '62.84.116.78:8082/box:$version'
                        args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
                    }
                }
            steps {
                sh 'mvn package'
            }
        }

        stage ('build image') {
            agent {
                    docker {
                        image '62.84.116.78:8082/box:$version'
                        args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
                    }
                }
            steps {
                sh 'docker build --tag box:run$version .'
            }
        }

        stage ('push run image') {
            agent {
                    docker {
                        image '62.84.116.78:8082/box:$version'
                        args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
                    }
                }
            steps {
                sh 'docker tag box:run$version 62.84.116.78:8082/box:run$version && docker push 62.84.116.78:8082/box:run$version'
            }
        }

        stage ('run webapp') {
            agent {
                node {
                    label 'production'

                }
            }
            steps {
                sh 'ls'
            }
        }
    }
}
