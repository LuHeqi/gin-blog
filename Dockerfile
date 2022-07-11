FROM golang:1.18.2 as gobuildstage
ENV GOPROXY https://goproxy.cn,direct
WORKDIR /src/github.com/gin-blog
COPY . /src/github.com/gin-blog
RUN go build .
FROM ubuntu:22.04
COPY --from=gobuildstage /src/github.com/gin-blog .

EXPOSE 8080
ENTRYPOINT ["./gin-blog"]