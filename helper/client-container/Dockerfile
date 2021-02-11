FROM alpine:latest

RUN apk add --no-cache curl jq bash

COPY shell.sh ./shell.sh
RUN chmod +x ./shell.sh

ENTRYPOINT  ["./shell.sh"]
