# We can tag an image using as, as shown below.
FROM node:latest as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

# We do not have to put any syntax or indication that we are doing another step. We just start another process using a
# base image.
# The default startup command of the nginx image starts nginx for us.
FROM nginx
# We can use --from to copy from another phase. In this case we are copying from the builder phase. The next argument
# is from which directory in the phase do we want to copy the contents from. The last argument is where we want to copy
# those contents in the container.
COPY --from=builder /app/build /usr/share/nginx/html