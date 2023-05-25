pipeline {
    agent any
    stages {
        stage('Welcome') { 
            steps { 
               echo 'This Build will create a Docker Container' 
            }
        }
        stage('Pull Sources') {
            steps {
             git url: 'https://github.com/kiriti07/docker-cicd.git', branch: 'main'
            }
         }
        
        stage('Build') {
            steps {
                script {
                    try {
                        sh 'docker --version'
                    } catch (Exception e) {
                        error('Docker is not installed. Please install Docker on the Jenkins agent.')
                    }
                }
            }
        }
	    
	      stage ('Deploy') {
          steps {
		  sh 'chmod +x /var/lib/jenkins/workspace/DockerImage/create-container.sh'
		  sh './create-container.sh'
            //sh './create-container.sh'
                }
	    }  	       
    }
}
