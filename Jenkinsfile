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
                sh 'sh docker build . '
                sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 972078203001.dkr.ecr.us-east-1.amazonaws.com/projectfinalrepo '
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
