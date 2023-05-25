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
		    sh 'chmod +x /var/lib/jenkins/workspace/DockerImage/'
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
			sh '''
				image_name="myweb_nginx"
				container_name="my-nginx-container"
				sudo docker build -t $image_name .
				sudo docker run -d --name $container_name -p 8080:80 $image_name
				sudo docker ps
				output=$(docker ps)
				echo "$output"
			'''	
                }
            }
        }
	    
	      stage ('Deploy') {
          steps {
		  sh 'chmod +x /var/lib/jenkins/workspace/DockerImage/create-container.sh'
		  sh './hello.sh'
            	  //sh './create-container.sh'
                }
	    }  	       
    }
}
