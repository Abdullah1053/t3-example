FROM node:lts-alpine
ENV NODE_ENV=production
ENV DATABASE_URL="postgres://postgres:BtG9uJVtfPtcF74@localhost:5432/postgres"
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 5555
RUN chown -R node /usr/src/app
USER node
CMD npx prisma studio
