pipeline {
  agent any

  environment {
    TF_ENV = "terraform-azure-vm"  // environment folder name
    ARM_CLIENT_ID = credentials('azure-sp-client-id')         // Jenkins Credential ID for clientId
    ARM_CLIENT_SECRET = credentials('azure-sp-client-secret') // Jenkins Credential ID for clientSecret
    ARM_SUBSCRIPTION_ID = credentials('azure-sp-subscription-id')
    ARM_TENANT_ID = credentials('azure-sp-tenant-id')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Terraform Validate & Plan') {
      when {
        branch pattern: "feature/.*|release/.*", comparator: "REGEXP"
      }
      steps {
        dir("${TF_ENV}") {
          sh 'terraform init -backend-config=backend.tfvars'
          sh 'terraform validate'
          sh 'terraform plan -out=tfplan'
        }
      }
    }

    stage('Terraform Apply (Release Branch)') {
      when {
        branch pattern: "release/.*", comparator: "REGEXP"
      }
      steps {
        dir("${TF_ENV}") {
          sh 'terraform init -backend-config=backend.tfvars'
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Manual Merge to Main') {
      when {
        branch pattern: "release/.*", comparator: "REGEXP"
      }
      steps {
        input message: "Infrastructure applied successfully. Merge release to main?"
        sh """
          git config user.email "jenkins@example.com"
          git config user.name "Jenkins CI"
          git checkout main
          git merge --no-ff ${env.BRANCH_NAME} -m "Automated merge of ${env.BRANCH_NAME} after prod apply"
          git push origin main
        """
      }
    }
  }
}





  
