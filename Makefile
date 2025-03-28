default: test

test:
	go test ./...

verbose:
	go test -v ./...

bench:
	go test -v -bench . ./...

clean:
	rm -rf internal/provider/*_rs.go
	rm -rf internal/provider/*_ds.go
	rm -rf docs/resources/*.md
	rm -rf examples/resources/prismasdwan_*tf

build:
	gofmt -s -w .
	go build
	
.PHONY: test verbose bench fmt docs
