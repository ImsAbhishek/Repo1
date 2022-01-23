pipeline { 
   agent any
   
   tools {
      jdk 'java11'
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
//   stage("Maven Build") {
//   steps {
//      sh "mvn clean package"
// }}
   
stage("ssh to the server") {
  steps {
    script {
        withCredentials([sshUserPrivateKey(credentialsId: '34.228.12.253',   keyFileVariable: 'key', passphraseVariable: 'passphrase', usernameVariable: 'username')]) {

    sh '''
    echo $key > secret.pem
    echo pass $passphrase
    chmod 777 secret.pem
    cat secret.pem
    ssh -i secret.pem ec2-user@18.209.46.3
    rm -rf secret.pem
    '''
        }
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
