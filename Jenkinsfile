pipeline {

    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker run --name yamllint --rm -v /var/lib/docker/volumes/jenkins_home/_data/workspace/$(basename "$PWD"):/data cytopia/yamllint:latest .'
                sh 'docker run --name shellcheck --rm -v /var/lib/docker/volumes/jenkins_home/_data/workspace/$(basename "$PWD"):/mnt" koalaman/shellcheck:latest'
            }
        }
    }
}
