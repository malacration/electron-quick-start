FROM node:18.12.1

# Create and define the node_modules's cache directory.
RUN mkdir /usr/src/cache
WORKDIR /usr/src/cache

# Install the application's dependencies into the node_modules's cache directory.
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm run make
RUN npm install electron-builder
RUN ls -l
RUN npm run package
RUN ls

# Create and define the application's working directory.
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
CMD ng serve --host 0.0.0.0 --disableHostCheck true
EXPOSE 4200/tcp