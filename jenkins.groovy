pipeline { 
   agent any
   
   tools {
      java 'java11'
      maven 'maven-3.3.1'
   }
  
stages {
    stage("clean workspace") {
        steps{
            cleanWs()
        }
    }
stage("SCM checkout") {
  steps {
sh 'echo "SCM checkout"'

checkout([$class: 'GitSCM', 
branches: [[name: '*/master']],
 extensions: [],
 userRemoteConfigs: [[credentialsId: 'github-cred', 
url: 'https://github.com/narendra9582/maven-project.git']]])

}}
  stage("Maven Build") {
  steps {
     sh "mvn clean package"
}}
   
stage("sonarqube code anlysis") {
  steps {
script {
sh 'echo "sonarqube code anlysis"'
}
}}
stage("docker build") {
  steps {
script {
sh 'echo "docker build"'
}
}}
stage("Nexus image push") {
  steps {
script {
sh 'echo "Nexus image push"'
}
}}
stage("Docker deploy") {
  steps {
script {
sh 'echo "Docker deploy"'
}
}}
  stage("email notification") {
  steps {
script {
sh 'echo "email notification"'
}
}}
}
}
