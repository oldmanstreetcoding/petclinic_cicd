pipeline {
    agent any

    environment {
        APP_NAME = "spring-petclinic"
        JAR_FILE = "target/spring-petclinic-3.3.0-SNAPSHOT.jar"
        IMAGE_NAME = "petclinic-app"
        CONTAINER_NAME = "petclinic-container"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                sh './mvnw clean package' // Compile and package the JAR
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    // Use Docker to build an image with the JAR file
                    sh """
                    docker build -t ${IMAGE_NAME} .
                    """
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                script {
                    // Stop and remove any existing container with the same name
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """
                    
                    // Run the new container and expose port 8081
                    sh """
                    docker run -d --name ${CONTAINER_NAME} -p 8081:8081 ${IMAGE_NAME}
                    """
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
