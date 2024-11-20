pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building the project...'
        sh './mvnw clean package'
      }
    }
    stage('Test') {
      steps {
        echo 'Running tests...'
        sh './mvnw test'
      }
    }
    stage('SonarQube Analysis') {
      steps {
        echo 'Running SonarQube Analysis...'
        withSonarQubeEnv('sonarqube') {
          sh './mvnw sonar:sonar -Dsonar.projectKey=petclinic'
        }
      }
    }
    stage('Execute') {
      steps {
        echo 'Starting the application...'
        sh 'nohup java -jar target/spring-petclinic-3.3.0-SNAPSHOT.jar --server.port=8081 &'
      }
    }
  }
  post {
    always {
      echo 'Pipeline completed!'
    }
    success {
      echo 'Pipeline succeeded!'
    }
    failure {
      echo 'Pipeline failed.'
    }
  }
}
