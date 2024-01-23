BINARY=webdavserve

$(BINARY):
	go build -o $(BINARY) .

clean:
	rm -f $(BINARY)
