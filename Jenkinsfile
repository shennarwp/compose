pipeline {

    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker run --name yamllint --rm -v /var/lib/docker/volumes/jenkins_home/_data/workspace/$(basename "$PWD"):/data cytopia/yamllint .'
            }
        }
    }
}
