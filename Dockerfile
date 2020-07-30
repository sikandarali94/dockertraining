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
COPY ./ ./

# Install some dependencies
RUN npm install

# Default command
CMD ["npm", "start"]