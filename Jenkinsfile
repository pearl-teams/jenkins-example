pipeline { 
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    } 
    stages { 
	    stage('Dev: Clone repository') {
	        checkout scm
	    }
        stage('Dev: Build & Test') { 
            steps { 
               sh 'mvn -B -DskipTests clean package'  
            }
        }    
       	stage('Dev: Build Image') { 
		    steps { 
		       echo 'Hier wird dein Docker Image gebaut!' 
       		}
       	}
    }
}