FROM alpine:latest  

WORKDIR /app

RUN apk add --no-cache nodejs npm && \
    npm install express mysql2

COPY . ./

EXPOSE 4743

CMD ["node", "src/app.js"]
