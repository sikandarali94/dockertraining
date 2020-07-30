# Specify a base image
# The Alpine image does not come with a program called npm. One option is to find a base image that has npm preinstalled
# in the file system. The other option is to run an additional command to install npm inside of our image. In this case
# we will use a base image with npm preinstalled from Docker Hub (node image). The alpine tag means in Docker that an
# image is as small and compact as possible (meaning, it might not have git or other useful tools that usually come with
# the image). The alpine version of node will have the bare necessities: node and npm. Many repositories provide an
# alpine tag for their images.
FROM node:alpine

# Install some dependencies
RUN npm install

# Default command
CMD ["npm", "start"]