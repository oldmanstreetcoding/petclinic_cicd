pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building the project...'
        sh './mvnw clean package' // Use Maven Wrapper to compile the project
      }
    }
    stage('Test') {
      steps {
        echo 'Running tests...'
        sh './mvnw test' // Execute unit tests
      }
    }
    stage('SonarQube Analysis') {
      steps {
        echo 'Running SonarQube Analysis...'
        withSonarQubeEnv('sonarqube') { // Use the SonarQube environment configured in Jenkins
          sh './mvnw sonar:sonar -Dsonar.projectKey=petclinic'
        }
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
