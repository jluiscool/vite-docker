# set the base image to create the image for the React app
FROM node:20-alpine

USER node
RUN mkdir /home/node/app
WORKDIR /home/node/app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY --chown=node:node package*.json ./
RUN npm install

# Copy the rest of the source files into the image and set ownership and permissions
COPY --chown=node:node . .
RUN chown node:node ./vite.config.js
RUN chmod 777 ./vite.config.js


# Expose the port that the application listens on.
EXPOSE 5173

# Run the application.
CMD npm run dev
