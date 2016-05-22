# Use base golang alpine image
FROM golang:1.6.2-alpine

# Copy in files
COPY ./hello.go $GOPATH/src/github.com/jackzampolin/go-kube-test/hello.go

# Set working directory
WORKDIR $GOPATH/src/github.com/jackzampolin/go-kube-test/

# Install deps
RUN ["go", "get", "-u", "-t", "-f", "-v", "./..."]

# Build binary
RUN ["go", "build", "./..."]

# Install binary
RUN ["go", "install", "./..."]

# Run app on port 80
CMD ["go-kube-test", "-port", "80"]