
pipeline {
    agent any

    environment {
        IMAGE_NAME = "ecommerce-app"
        CONTAINER_NAME = "ecommerce-container"
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh '''
                    docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Testing the application...'
                sh '''
                    set -eu

                    TEST_CONTAINER="ecommerce-test-${BUILD_NUMBER}"

                    docker rm -f "$TEST_CONTAINER" >/dev/null 2>&1 || true

                    docker run -d \
                        --name "$TEST_CONTAINER" \
                        -p 8082:80 \
                        "${IMAGE_NAME}:${BUILD_NUMBER}"

                    trap 'docker rm -f "$TEST_CONTAINER" >/dev/null 2>&1 || true' EXIT

                    sleep 5

                    curl -fsS http://localhost:8082/ | grep -qi '<html'

                    echo "Application test passed!"
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                sh '''
                    docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true

                    docker run -d \
                        --name "$CONTAINER_NAME" \
                        --restart unless-stopped \
                        -p 80:80 \
                        "${IMAGE_NAME}:${BUILD_NUMBER}"

                    sleep 3

                    curl -fsS http://localhost/ | grep -qi '<html'

                    echo "Deployment successful!"
                '''
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check the console output.'
        }
    }
}
