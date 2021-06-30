#! \bin\sh

npm install -g localtunnel

lt --port  8888 &
lt --port  8080 &
lt --port  8081 &
lt --port  8082 &
