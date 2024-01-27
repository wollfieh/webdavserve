BINARY_NAME=webdavserve

default: build-all

dist: build-all
	mkdir -p dist
	cp ${BINARY_NAME}-* dist

build-all: dep build-linux  build-mac

# Build for Linux
build-linux:
	GOOS=linux GOARCH=amd64 go build -o ${BINARY_NAME}-linux-amd64 .

# Build for macOS
build-mac:
	GOOS=darwin GOARCH=amd64 go build -o ${BINARY_NAME}-darwin-amd64 .


dep:
	go mod tidy
.PHONY: clean
clean:
	rm -rf ${BINARY_NAME}-* dist
