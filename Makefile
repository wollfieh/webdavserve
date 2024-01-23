BINARY=webdavserve

all: $(BINARY)
$(BINARY):
	go build -o $(BINARY) .

.PHONY: clean
clean:
	rm -f $(BINARY)
