pipeline { 
   agent any
stages {
  stage("Build") {
  steps {
script {
sh 'echo "Hey Abhishek"'
}
}}
}
}
