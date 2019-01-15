pipeline {
  agent any
  
  environment {
    F8_TAG = "$BRANCH_NAME-$BUILD_ID"
    F8_ENVIRONMENT = "$BRANCH_NAME"
  }

  stages {
    stage('Build') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'gcr', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'docker login -u $USER -p "$PASS" https://gcr.io && f8 build --push'
        }
      }
    }
    stage('Deploy') {
      steps {
        sh 'f8 deploy'
      }
    }
    stage('Test') {
      steps {
        sh 'f8 test'
      }
    }
  }
}
