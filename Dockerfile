#Implementing nulti-step build for production environment
# Use an existing docker image as a base

FROM node:alpine as builder


WORKDIR '/app'

# Download and install a dependency
COPY package.json .
RUN npm install
COPY . .


# Tell the image what to do when it starts as a container

RUN npm run build

#/app/build will have all the build code

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html



