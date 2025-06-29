# in case of web socket  we dont required to communicate 
# database at image build time

FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./packages ./packages
COPY ./package.json ./package.json 
COPY ./bun.lock ./bun.lock 

COPY ./package-lock.json ./package-lock.json
COPY ./turbo.json ./turbo.json

COPY ./apps/ws ./apps/ws

RUN bun install
RUN bun run db:generate

EXPOSE 8081

CMD [ "bun", "run", "start:ws" ]
