.DEFAULT_GOAL := help

.PHONY: help test verbose bench clean build

help: ## Display this help message
	@echo "Available targets:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""

test: ## Run all tests
	@echo "Running tests..."
	go test ./...
	@echo "Tests completed."

verbose: ## Run tests with verbose output
	@echo "Running tests in verbose mode..."
	go test -v ./...
	@echo "Verbose tests completed."

bench: ## Run benchmarks
	@echo "Running benchmarks..."
	go test -v -bench . ./...
	@echo "Benchmarks completed."

clean: ## Clean generated files
	@echo "Cleaning generated files..."
	@echo "Removing resource files..."
	rm -rf internal/provider/*_rs.go
	@echo "Removing data source files..."
	rm -rf internal/provider/*_ds.go
	@echo "Removing documentation..."
	rm -rf docs/resources/*.md
	@echo "Removing example files..."
	rm -rf examples/resources/prismasdwan_*tf
	@echo "Clean completed."

build: ## Format code and build the provider
	@echo "Formatting code..."
	gofmt -s -w .
	@echo "Building provider..."
	go build
	@echo "Build completed."
