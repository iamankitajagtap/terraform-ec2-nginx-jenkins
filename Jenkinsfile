
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Prepare Public Key') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'tf-server-public-key',
                        variable: 'TF_PUBLIC_KEY'
                    )
                ]) {
                    sh '''
                        printf '%s\\n' "$TF_PUBLIC_KEY" > tf-server-key.pub
                        chmod 600 tf-server-key.pub
                    '''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -input=false'
            }
        }
    }

    post {
        always {
            sh 'rm -f tf-server-key.pub'
        }
    }
}
