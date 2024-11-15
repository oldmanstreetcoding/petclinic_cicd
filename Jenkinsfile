pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building the project...'
        sh './gradlew clean build' // Use Gradle Wrapper to build the project
      }
    }
    stage('Test') {
      steps {
        echo 'Running tests...'
        sh './gradlew test' // Execute tests with Gradle
      }
    }
    stage('SonarQube Analysis') {
      steps {
        echo 'Running SonarQube Analysis...'
        withSonarQubeEnv('sonarqube') { // Use the SonarQube environment configured in Jenkins
          sh './gradlew sonarqube -Dsonar.projectKey=petclinic'
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
