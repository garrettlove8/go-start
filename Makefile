.PHONY: build clean deploy

# build-local:
# 	export GO111MODULE=on
# 	env GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w" -o bin/businessCRUD ./cmd/businessCRUD
# 	env GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w" -o bin/relationshipsCRUD ./cmd/relationshipsCRUD

build:
	export GO111MODULE=on
	env GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o bin/businessCRUD ./cmd/businessCRUD
	env GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o bin/relationshipsCRUD ./cmd/relationshipsCRUD

clean:
	rm -rf ./bin ./vendor
	go mod tidy

# deploy-local: clean build-local
# 	sls deploy --verbose --stage local

deploy: clean build
	sls deploy --verbose

# remove-local:
# 	sls remove --verbose --stage local

remove:
	sls remove --verbose
