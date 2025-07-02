version: '3.8'

services:
  vps-landing:
    build: .
    container_name: vps-landing
    restart: always
    ports:
      - "9095:80"
