This is a sample nodejs project sourced from the github public repos for the purpose of this task.
The service is exposed via port 7000 - This has been changed in the sample project.
This repo has the nodejs project along with the Dockerfile to dockerize the application adn docker-compose file to bring up the conatiner instances.

The webhook has been attached along with this project and its been configured in Jenkins which is accessible and shared via mail.

git repo: https://github.com/rondavid-q/task-2-deployment.git

The jenkins job will be triggered if there is any code push or merge to the main branch.

We can configure the instance created via repo: https://github.com/rondavid-q/task-2-instance.git as the machine where the application will be deployed.

I have used the machine that was created during my task adn have configured it as node agent and it will be deployed there.

This can also be done via ssh scripts in jenkins. To maximise the security and for teh same concerns not to expose the exposee ssh keys, it is done via node agent.

Please login to the Jenkins that is shared via mail to access the pipleine : task-2-deployment.

The stesp include:
1. cloning the repo
2. Building the docker image
3. Pushing the docker iage to repository
4. Deploying the docker container onto EC2 instance.
5. You can include test cases by running npm test and I have commented out that step as this sample project doest have much to test upon. ( We can also run sonarqube tests for which I have templates)

The above job will be teriggreed via webhook

Note:
The deployed machine should have the below packages:

1. awscli
2. docker

The above packages can be installed and configured via ansbile during provision of each EC2 instance.


The server (URL to test) where it is deployed and can be checked post deployment: http://91.107.210.94:7000/

The output should --> Örnek Node.js Projesi

