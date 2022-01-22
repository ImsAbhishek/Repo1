pipeline { 
   agent any
  
stages {
  stage("Ec2-connection") {
  steps {
     withCredentials([sshUserPrivateKey(credentialsId: 'server',   keyFileVariable: 'key', passphraseVariable: 'passphrase', usernameVariable: 'username')])
     
script {
sh 'echo "Hey Abhishek"'
   sh 'echo "credentialsId: $server"'
sh 'echo "keyFileVariable: $key"'
sh 'echo "passphraseVariable: $passphrase"'
sh 'echo "usernameVariable: $username"'

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
