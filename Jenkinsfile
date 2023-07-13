pipeline {
    agent any
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/surjeetaxis/surjeetjenkins.git/']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t surjeetjenkins:1.0 .'
                    sh 'docker tag surjeetjenkins:1.0 surjeetcse/surjeetjenkins:1.0'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                     sh 'docker login -u surjeetcse -p ${dockerhubpwd}'
                   }
                   sh 'docker push surjeetcse/surjeetjenkins:1.0'
                }
            }
        }
        stage('Deploy to k8s'){
                    steps{
                        script{
                            kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                        }
                    }
                }
    }
}