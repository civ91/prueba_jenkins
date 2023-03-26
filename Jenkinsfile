pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building Artifacts'
        sh 'mvn compile'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
        sh 'mvn test'
      }
    }

    stage('Exec') {
      steps {
        echo 'Executing'
        sh 'mvn exec:java'
      }
    }

    stage('ok') {
      steps {
        sleep 1
      }
    }

  }
}