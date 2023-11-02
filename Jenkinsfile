pipeline{
    agent any



    stages {


        stage('Getting project from CDCI-Checkpoint') {
            steps{
      			checkout([$class: 'GitSCM', branches: [[name: '*/master']],
			extensions: [],
			userRemoteConfigs: [[url: 'https://github.com/Omar-Bensalah/CDCI-Checkpoint.git']]])
            }
        }


       stage('Cleaning the project') {
            steps{
                	sh "mvn -B -hellomoto clean  "
            }
        }

		stage('Install Dependencies') {
            steps {
                // Use Node.js and npm installed on the Jenkins agent
                sh 'npm install'
            }
        }
		
		stage('Build Angular App') {
            steps {
                // Build the Angular app
                sh 'npm run build'
            }
        }

        stage('Artifact Construction') {
            steps{
                	sh "mvn -B -hellomoto package "
            }
        }



         stage('Unit Tests') {
            steps{
               		 sh "mvn test "
            }
        }



        stage('Code Quality Check via SonarQube') {
            steps{

             		sh "  mvn sonar:sonar -Dsonar.projectKey=cicdback -Dsonar.host.url=http://192.168.2.55:9000 -Dsonar.login=14a06bdf65b0b44ae3947bf04b44767fa5a78d1a"

            }
        }


        stage('Publish to Nexus') {
            steps {


  sh 'mvn clean package deploy:deploy-file -DgroupId=com.esprit.examen -DartifactId=tpAchatProject -Dversion=1.2 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=deploymentRepo -Durl=http://192.168.2.55:8081/repository/maven-releases/ -Dfile=target/tpAchatProject-1.2.jar'


            }
        }

}
	    
        /*post {
		success{
		mail bcc: '', body: '''Dear Omar, 
we are happy to inform you that your pipeline build was successful. 
Great work ! 
-Jenkins Team-''', cc: '', from: 'omar.ben.salah@outlook.com', replyTo: '', subject: 'Build Finished - Success', to: 'omar.ben.salah@outlook.com'
		}
		
		failure{
mail bcc: '', body: '''Dear Omar, 
we are sorry to inform you that your pipeline build failed. 
Keep working ! 
-Jenkins Team-''', cc: '', from: 'omar.ben.salah@outlook.com', replyTo: '', subject: 'Build Finished - Failure', to: 'omar.ben.salah@outlook.com'
		}

       always {
		//emailext attachLog: true, body: '', subject: 'Build finished',from: 'omar.ben.salah@outlook.com' , to: 'omar.ben.salah@outlook.com'
            cleanWs()
       }
    }*/
    
	
}
       
