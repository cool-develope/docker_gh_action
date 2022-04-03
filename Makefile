GOBASE := $(shell pwd)
GOBIN := $(GOBASE)/dist
GOENVVARS := GOBIN=$(GOBIN)
GOBINARY := docker_gh

LINT := $$(go env GOPATH)/bin/golangci-lint run --timeout=5m -E whitespace -E gosec -E gci -E misspell -E gomnd -E gofmt -E goimports -E golint --exclude-use-default=false --max-same-issues 0
BUILD := $(GOENVVARS) go build $(LDFLAGS) -o $(GOBIN)/$(GOBINARY)

.PHONY: build
build: ## Build the binary locally into ./dist
	$(BUILD)

.PHONY: build-docker
build-docker: ## Builds a docker image with the core binary
	docker build -t docker_gh -f ./Dockerfile . --build-arg PRIVATE_TOKEN=${PRIVATE_TOKEN}