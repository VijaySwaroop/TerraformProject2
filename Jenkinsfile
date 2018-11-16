node{
    stage ('git checout'){
        git 'https://github.com/javahometech/my-app.git'
    }
    stage ('Maven Build'){
//        sh '''sudo mkdir /mnt/artifacts'''
        sh '''mvn clean package'''
//        sh '''sudo cp /var/lib/jenkins/workspace/deployproject/target/myweb-0.0.4.war /mvn/artifacts/'''
    }
    stage ('Ansible Trigger'){
        sshagent(['Tomcat']) {
            sh '''ansible-playbook ansible.yaml '''
        }

    }
}