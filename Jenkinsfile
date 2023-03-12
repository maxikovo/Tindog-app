pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t maxikov/tindogapp3 .'
      }
    }

    stage('run') {
      steps {
        sh 'docker run --name app -p 80:80 -d maxikov/tindogapp3'
      }
    }

    stage('test') {
      steps {
        sh 'curl 54.236.48.212:80 '
      }
    }
	
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push maxikov/tindogapp3'
      }
    }
    stage('logout') {
      steps {
        sh 'docker logout'
      }
    }
  }
 }
