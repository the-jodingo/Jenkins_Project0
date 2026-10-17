// Jenkinsfile - Pizza Shop CI/CD Pipeline
// Builds Maven project, creates WAR file, deploys to Tomcat

pipeline {
    agent any

    tools {
        maven 'maven-3'
        jdk 'jdk-11'
    }

    environment {
        WAR_FILE = 'target/pizza-shop.war'
        TOMCAT_HOST = 'localhost'
        TOMCAT_PORT = '8080'
    }

    stages {
        stage('Checkout') {
            steps {
                cleanDir()
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Package WAR') {
            steps {
                sh 'mvn war:war'
            }
            post {
                success {
                    archiveArtifacts artifacts: "${WAR_FILE}", fingerprint: true
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'tomcat-creds',
                        usernameVariable: 'TOMCAT_USER',
                        passwordVariable: 'TOMCAT_PASS'
                    )]) {
                        echo "Deploying ${WAR_FILE} to Tomcat at ${TOMCAT_HOST}:${TOMCAT_PORT}"
                        sh """
                            curl --fail -u "$TOMCAT_USER:$TOMCAT_PASS" \
                                --upload-file ${WAR_FILE} \
                                "http://${TOMCAT_HOST}:${TOMCAT_PORT}/manager/text/deploy?path=/&tag=ci-cd"
                        """
                    }
                }
            }
        }

        stage('Verify') {
            steps {
                script {
                    def response = sh(
                        script: "curl -s -o /dev/null -w '%{http_code}' http://${TOMCAT_HOST}:${TOMCAT_PORT}/",
                        returnStdout: true
                    ).trim()

                    if (response == "200") {
                        echo "Deployment verified: Pizza Shop is live at http://${TOMCAT_HOST}:${TOMCAT_PORT}/"
                    } else {
                        echo "Warning: Got HTTP ${response} — check Tomcat deployment"
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ CI/CD Pipeline completed successfully — Pizza Shop deployed!'
        }
        failure {
            echo '❌ CI/CD Pipeline failed — check logs for details'
        }
        always {
            cleanWs()
        }
    }
}
