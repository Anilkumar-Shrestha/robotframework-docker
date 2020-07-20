pipeline{
    agent any

    stages{

        stage('Checkout Code') {
            steps {
                cleanWs()
                git branch: "master", url:'https://github.com/Anilkumar-Shrestha/robotframework-docker.git'
                echo 'checking out scm....'
            }
        }

        stage('Execute Tests') {
            steps {
                sh 'docker-compose up'
                echo 'executing test....'
            }

        }

    }
}
