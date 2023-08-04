#!/usr/bin/env bash

BINARY=tfsecurity
CHECK_GEN_BINARY=tfsecurity-checkgen
TAG=${TRAVIS_TAG:-development}
GO111MODULE=on
export CGO_ENABLED=0
args=(-ldflags "-X github.com/khulnasoft-labs/tfsecurity/version.Version=${TAG} -s -w -extldflags '-fno-PIC -static'")

mkdir -p bin/darwin
GOOS=darwin GOARCH=amd64 go build -o bin/darwin/${BINARY}-darwin-amd64 "${args[@]}" ./cmd/tfsecurity/
GOOS=darwin GOARCH=amd64 go build -o ./bin/darwin/${CHECK_GEN_BINARY}-darwin-amd64 "${args[@]}" ./cmd/tfsecurity-checkgen/
mkdir -p bin/linux
GOOS=linux GOARCH=amd64 go build -o bin/linux/${BINARY}-linux-amd64 "${args[@]}" ./cmd/tfsecurity/
GOOS=linux GOARCH=amd64 go build -o bin/linux/${CHECK_GEN_BINARY}-linux-amd64 "${args[@]}" ./cmd/tfsecurity-checkgen/
mkdir -p bin/windows
GOOS=windows GOARCH=amd64 go build -o bin/windows/${BINARY}-windows-amd64.exe "${args[@]}" ./cmd/tfsecurity/
GOOS=windows GOARCH=amd64 go build -o bin/windows/${CHECK_GEN_BINARY}-windows-amd64.exe "${args[@]}" ./cmd/tfsecurity-checkgen/
