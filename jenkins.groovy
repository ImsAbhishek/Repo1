pipeline { 
   agent any
   environment {
      secret_file = credentials{'jenkins.pem'}
    }
stages {
  stage("Ec2-connection") {
  steps {
script {
sh 'echo "Hey Abhishek"'
sh 'shh -i $secret_file ec2-user@http://34.228.12.253'
}
}}
  stage("status") {
  steps {
script {
sh 'echo "success"'
}
}}
}
}
