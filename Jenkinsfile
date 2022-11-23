@Library('github.com/releaseworks/jenkinslib') _

pipeline {
    agent any
    environment {
        registry = "972078203001.dkr.ecr.us-east-1.amazonaws.com/projectfinalrepo"
    }

    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/lathk/CourseProjectFinal.git']]])
            }
        }

    // Building Docker images


    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
        steps{
            script {
                sh 'docker build -t 972078203001.dkr.ecr.us-east-1.amazonaws.com/projectfinalrepo '
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 972078203001.dkr.ecr.us-east-1.amazonaws.com '
                sh 'docker push 972078203001.dkr.ecr.us-east-1.amazonaws.com/projectfinalrepo'
            }
        }
    }

    stage('Docker Run') {
     steps{
         script {
             sshagent(credentials : ['aws_ec2']){

                sh 'ssh -o StrictHostKeyChecking=no -i Ansible.pem ubuntu@10.0.2.52'

             }
                
                sh 'docker run -d -p 8081:8080 --rm --name node 972078203001.dkr.ecr.us-east-1.amazonaws.com/projectfinalrepo'
            }
      }
    }
    }
}
