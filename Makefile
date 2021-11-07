VERSION=0.0.2
LDFLAGS=-ldflags "-w -s -X main.version=${VERSION} "

all: session-overflow

.PHONY: session-overflow

session-overflow: main.go
	go build $(LDFLAGS) -o session-overflow main.go

linux: main.go
	GOOS=linux GOARCH=amd64 go build $(LDFLAGS) -o session-overflow main.go

check:
	go test ./...

fmt:
	go fmt ./...

tag:
	git tag v${VERSION}
	git push origin v${VERSION}
	git push origin main
