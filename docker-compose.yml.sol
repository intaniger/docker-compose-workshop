version: '3'

services:
  api:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - .:/usr/src/app
    working_dir: /usr/src/app
    networks:
      - app-network
    environment:
      - NODE_ENV=development
      - DATABASE=mongodb://mongodb:27017/playground
      - PORT=3000
    links:
      - mongodb

  mongodb:
    image: mongo
    networks:
      - app-network

networks:
  app-network:
    driver: bridge
