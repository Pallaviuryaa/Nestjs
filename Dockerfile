FROM node:16

# Create app directory, this is in our container/in our image
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY nest-js-starter/package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
ADD nest-js-starter/ ./

RUN npm run build

EXPOSE 8080
CMD [ "node", "dist/main" ]
