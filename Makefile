BINARY_NAME=webdavserve

default: build-all

dist: build-all
	install -D ${BINARY_NAME}-* dist/${BINARY_NAME}

build-all: build-linux  build-mac

# Build for Linux
build-linux:
	GOOS=linux GOARCH=amd64 go build -o ${BINARY_NAME}-linux-amd64 .

# Build for macOS
build-mac:
	GOOS=darwin GOARCH=amd64 go build -o ${BINARY_NAME}-darwin-amd64 .


.PHONY: clean
clean:
	rm -rf ${BINARY_NAME} dist
