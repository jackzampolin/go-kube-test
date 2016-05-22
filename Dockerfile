FROM golang:1.6.2-alpine

COPY ./hello.go $GOPATH/src/github.com/jackzampolin/go-kube-test/hello.go

WORKDIR $GOPATH/src/github.com/jackzampolin/go-kube-test/

RUN ["go", "get"]

RUN ["go", "build", "./..."]

RUN ["go", "install", "./..."]

CMD ["go-kube-test", "-port", "80"]