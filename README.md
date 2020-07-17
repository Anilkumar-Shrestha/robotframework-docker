# robotframework-docker
This is an example of running robotframework selenium test in headlesschrome through docker image build. A simple guide to practice the test with docker images as well. Go through below guidance. 

## Overview of Docker and its importance in automation CI testing.

<P> First of all if you are working as QA Automation engineer, then you should be aware of the struggles in test automation when it comes to testing against different test enviroments from scratch, installing all the dependencies in new machine, incompataible between drivers and browser versions etc. You should have heard of Docker, Container, Orchestration talk between developer and operations team. But Did you ever wonder how Docker can contribute to the field of test automation? </P>
<p>OK!!</p>
<P>First, lets talk about the advantages of utilizing Docker over the automation testing.</p>

* Installation on any new machine only requires one tool (Docker) instead of multiple tools like Python, Pip, robot-framework, test libaries, user define keywords.
* Installation is harmonized over all team members and the CI enviroment is in one central place.
* Updating versions of individual components can be easily done using a separate docker image.

You understand the benefits of docker in testing, lets see now, how.

## Where to start?

<p> Whenever I am trying to learn new things then the most difficult part to figure out is to from where do I start? So let me tell you that as well. Since I am using Windows machine so in this whole learning path, I am going through windows steps. </p>

* Start with creating an [account on Docker Hub](https://hub.docker.com/) (its free)
* Install docker for windows desktop. [Installation guidance with download](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
* If you are not able to install docker on windows due to some incompatibility , the you can use [docker playground](https://labs.play-with-docker.com/) for practice.

Now there are two steps to use Docker.

1. Using the Ready-Made images
2. Creating your own images and then use it.

## Using the Ready-Made image

We are going to use the image from dockerhub that has already been created. [robotframework-docker-image](https://hub.docker.com/r/kumarshresthaanil/robotframework-docker)

Run below command on the command line to pull the image from docker hub to your pc.
> > > *docker pull kumarshresthaanil/robotframework-docker* 

If you want to go inside container and run the script and dig into container
> > > *docker run -it --name robotframework-docker  kumarshresthaanil/robotframework-docker bash*
> > > *robot googletest.robot*

If you want to  run the script  from your computer and get the results in your local harddrive
> > > *docker run -v [local folder location]:/project/testresults --name robotframework-docker  kumarshresthaanil/robotframework-docker*

## Creating your own images and then use it.

<P> For creating your image, you have to clone the project in your local drive.</p>

* clone the project. 
> > > *git clone https://github.com/Anilkumar-Shrestha/robotframework-docker.git*
* After you have cloned the repository on your local drive, start command line and go to the project folder robotframework-docker you just cloned. You should be in the path where Dockerfile file exist.
* Run the command : 
> > > *docker build -t <'dockerhub-username'>/robotframework-docker .*

> *You can give your own tag name instead of robotframework-docker mentioned in command above. 'dockerhub-username' is the username of the account dockerhub. Please do dont forget the dot in the end which represent the current dir path of Dockerfile*
* You can check if image is build using command: docker images
> > *Congratulations!! if image is successfully build.*
* Now you can push your image to your docker hub account using command. 
> > > *docker push <'dockerhub-username'>/robotframework-docker*
* After this you can follow the "Using the Ready-Made images" steps.

Congratulations Again, you have successfully run the test.
But Did you figureout something, you need to run the docker run command each time you need to run the test. Thats easy part but that can ease more with docker-compose yaml file.
Lets run the test in container using image through Docker-Compose command.

## Using Docker-Compose comand
****TODO**
