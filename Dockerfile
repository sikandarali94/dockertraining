# Specify a base image
# The Alpine image does not come with a program called npm. One option is to find a base image that has npm preinstalled
# in the file system. The other option is to run an additional command to install npm inside of our image. In this case
# we will use a base image with npm preinstalled from Docker Hub (node image). The alpine tag means in Docker that an
# image is as small and compact as possible (meaning, it might not have git or other useful tools that usually come with
# the image). The alpine version of node will have the bare necessities: node and npm. Many repositories provide an
# alpine tag for their images.
FROM node:alpine

# At this point we are asking to install dependencies, however, the package.json file is not copied into the container.
# This is why this step gives us warnings that it could not find a package.json file. The takeaway here is that when we
# are building an image, none of the files inside of our project directory are available inside the container by
# default.
# The COPY instruction is used to move files and folders from our local file system on our machine to the file system
# inside of a temporary container that is created using during the build process. The first argument is: the path to
# folder to copy from our machine relative to the build context. The second argument is the place to copy stuff to
# inside the container.
# WORKDIR instruction sets a path from which any following command will be executed relative to this path in the
# container. If the path does not exist, it will be automatically created for us.
WORKDIR /usr/app
COPY ./ ./

# Install some dependencies
RUN npm install

# Default command
CMD ["npm", "start"]

# A container essentially has its own isolated set of ports that can recieve traffic, but by default no incoming traffic
# to our computer is going to be directed into the container in order to make sure that any request from either our
# computer or some outside computer will be redirected into the container. We have to set up an explicit port mapping
# that automatically forwards a given port in our local network to a port inside the container. Please note that this
# is only referring to incoming requests; a docker container can by default make requests on its own behalf to the
# outside world. We do not set up port forwarding inside the Dockerfile, the port forwarding stuff is strictly a runtime
# constraint e.g. docker run -p 8080:8080 <image id OR image name>. The first port on the left is the localhost port and
# the second port on the right is the port inside the container -- these do not have to be identical.