pipeline { 
	agent any
    stages { 
	    stage('Dev: Clone repository') {
	        steps{
	        	checkout scm
	        }
	    }
        stage('Dev: Build & Test') { 
        	agent {
		        docker {
		            image 'maven:3-alpine'
		            args '-v /root/.m2:/root/.m2'
		        }
   			} 
            steps { 
               sh 'mvn -B -DskipTests clean package'  
            }
        }    
       	stage('Dev: Build Image') { 
		    steps { 
		    	hello("world")
		       	env app = dockerBuild() 
       		}
       	}
       	stage('Dev: Push Image') { 
		    steps { 
		    	script{
		    	    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            		app.push("latest")
        			}
		    	}
       		}
       	}
    }
}