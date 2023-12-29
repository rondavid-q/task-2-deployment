This is a sample nodejs project sourced from the github public repos for the purpose of this task.

This repo has the nodejs project along with the Dockerfile to dockerize the application adn docker-compose file to bring up the conatiner instances.

The webhook has been attached along with this project and its been configured in Jenkins which is accessible and shared via mail.

git repo: https://github.com/rondavid-q/task-2-deployment.git

The jenkins job will be triggered if there is any code push or merge to the main branch.

We can configure the instance created via repo: https://github.com/rondavid-q/task-2-instance.git as the machine where the application will be deployed.

I have used the machine that was created during my task adn have configured it as node agent and it will be deployed there.

This can also be done via ssh scripts in jenkins. To maximise the security and for teh same concerns not to expose the exposee ssh keys, it is done via node agent.

Please login to the Jenkins that is shared via mail to access the pipleine : task-2-deployment.
