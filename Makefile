.PHONY: build clean deploy gomodgen

build: gomodgen
	export GO111MODULE=on
	env GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w" -o bin/businessCRUD ./cmd/businessCRUD
	env GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w" -o bin/relationshipsCRUD ./cmd/relationshipsCRUD

clean:
	rm -rf ./bin ./vendor go.sum

deploy: clean build
	sls deploy --verbose

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
