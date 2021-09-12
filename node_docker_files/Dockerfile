FROM node:16.3.0
WORKDIR /app
COPY ./package.json /app
RUN npm install
# el siguiente RUN diferencia si está en development o en pruductión 

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; then npm install; else npm install --only=production; fi
COPY . /app
ENV PORT 3000
EXPOSE $PORT
#CMD ["node", "index.js"]  
#cmd de arriba es para produccion
CMD ["npm","run", "dev" ]
#cmd de arriba es para desarrollo