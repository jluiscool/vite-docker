# set the base image to create the image for react app
FROM node:20-alpine

RUN mkdir /home/node/app
WORKDIR /home/node/app
RUN chown -R node:node ./
COPY --chown=node:node package*.json ./
RUN npm install

# Copy the rest of the source files into the image.
COPY --chown=node:node . .
#RUN chmod -R 777 ./
USER node

# Expose the port that the application listens on.
EXPOSE 5173

# Run the application.
CMD npm run dev
