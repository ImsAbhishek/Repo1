pipeline { 
   agent any
  
stages {
stage("SCM checkout") {
  steps {
sh 'SCM checkout"'
script {
sh 'echo "success"'
}
}}
  stage("Maven Build") {
  steps {
script {
sh 'echo "Maven Build"'
}
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
