FROM node:lts-alpine3.15 AS dev
RUN echo 'Instalando para ambiente de desenvolvimento'
WORKDIR /usr/app
COPY . .
RUN npm install
RUN npx tsc

FROM dev AS baseprod
RUN echo 'Reinstalando para ambiente de produção'
ENV NODE_ENV="production"
RUN npm install

FROM node:lts-alpine3.15 AS prod
RUN echo 'Estágio final para ambiente de produção'
WORKDIR /usr/app
COPY --from=baseprod /usr/app/build build
COPY --from=baseprod /usr/app/node_modules node_modules
COPY --from=baseprod /usr/app/views views
ENV NODE_ENV="production"
CMD ["node", "build/index.js"]