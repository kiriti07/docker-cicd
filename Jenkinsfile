pipeline {
    agent any
    
    environment {
        DOCKERHUB_USERNAME = credentials('dockerhub-username')
        DOCKERHUB_PASSWORD = credentials('dockerhub-password')
        DOCKER_IMAGE_NAME = 'my-docker-image'
        DOCKERHUB_REPO = 'dockerhub-username/my-repo'
        DOCKERFILE_PATH = 'path/to/Dockerfile'
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE_NAME -f $DOCKERFILE_PATH .'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-password', variable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'docker tag $DOCKER_IMAGE_NAME $DOCKERHUB_REPO'
                    sh 'docker push $DOCKERHUB_REPO'
                }
            }
        }
    }
}
