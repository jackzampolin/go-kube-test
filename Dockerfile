# Use base golang alpine image
FROM golang:1.6.2

EXPOSE 80

# Copy in files
COPY . $GOPATH/src/github.com/jackzampolin/go-kube-test/

# Set working directory
WORKDIR $GOPATH/src/github.com/jackzampolin/go-kube-test/

# Build binary
RUN go build -o go-kube-test hello.go

# Run app on port 80
CMD ["./go-kube-test", "-port", "8080"]