pipeline {
    agent any
    
     environment {
        AWS_ACCOUNT_ID = '340539263267'
        AWS_DEFAULT_REGION = 'ap-south-1'
        ECR_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
        IMAGE_REPO_NAME = 'admin-service'
        IMAGE_NAME = "${env.ECR_URL}/${IMAGE_REPO_NAME}:${BUILD_NUMBER}"
        DEPLOY_AGENT_LABEL = 'Dev'
     }
    
        stages{
        stage('Git Checkout') {
            steps {
                git ( url: "https://github.com/rondavid-q/task-2-deployment.git", credentialsId: "github", branch: "main" )
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${env.IMAGE_NAME} -f Dockerfile ."
                }
            }
        }
        
        stage('Push to ECR') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: "witmer-dev-0", secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${env.ECR_URL}"
                        sh "docker push ${env.IMAGE_NAME}"
                    }
                }
            }
        }
        
        stage('Creating ENV FILE') {
            steps {
                script {
                    stash includes: 'docker-compose.yaml', name: 'ARTEFACT-1'
                }
            }
        }
        
                stage('Deploy to EC2') {
            agent {
                label "${env.DEPLOY_AGENT_LABEL}"
            }
            
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: "witmer-dev-0", secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${env.ECR_URL}"
                        unstash 'ARTEFACT-1'
                        sh "cat docker-compose.yaml"
                        sh "docker-compose up -d"
                    }
                }
            }
        }
        stage('Clean Workspace') {
            steps {
                script {
                    cleanWs()
                   }
                }
            }
        }
}
    
        
        
        