pipeline {
    agent any
    triggers{
        pollSCM('* * * * *')
    }

    stages {

        stage("Terraform init"){
            steps {
                
                    withCredentials([
                    aws(
                        credentialsId: 'aws-training',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]){
                        sh "terraform init"
                    }
                }
            
        }
        stage("Terraform plan"){
            steps {
                
                    withCredentials([
                    aws(
                        credentialsId: 'aws-training',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]){
                        sh "terraform plan"
                    }
                }
            
        }

        stage("Approve Deployment") {
            when{
                expression {
                    env.GIT_BRANCH == "origin/main" || env.GIT_BRANCH == "origin/master"
                }
            }
            steps {
                script {
                    timeout(time: 10, unit: 'MINUTES') {
                        input message: "Do you want to proceed with Terraform APPLY?"
                    }
                }
            }
        }

        stage("Terraform apply"){
            when{
                expression {
                    env.GIT_BRANCH == "origin/main" || env.GIT_BRANCH == "origin/master"
                }
            }
            steps {
                
                    withCredentials([
                    aws(
                        credentialsId: 'aws-training',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]){
                        sh "terraform apply --auto-approve"
                    }
                }
            
        }
        stage("Clean up"){
            steps {
                cleanWs()
            }
        }
    }
}