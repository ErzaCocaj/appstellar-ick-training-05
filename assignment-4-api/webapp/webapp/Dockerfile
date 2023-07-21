FROM node:18
#Create spp dir
WORKDIR /usr/appstellar-stellar-web

COPY package*.json /usr/appstellar-stellar-web/

# Install dependencies
RUN npm install

COPY . /usr/appstellar-stellar-web

#Build project
RUN npm run build

#Copy nextJS build
COPY . /usr/appstellar-stellar-web/

EXPOSE 3000

CMD [ "npm", "run", "start" ]
