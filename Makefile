# Copyright (c) 2019 The BFE Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# init project path
WORKROOT := $(shell pwd)
OUTDIR   := $(WORKROOT)/output

# init environment variables
export PATH        := $(shell go env GOPATH)/bin:$(PATH)
export GO111MODULE := on

# init command params
GO           := go
GOBUILD      := $(GO) build
GOTEST       := $(GO) test
GOVET        := $(GO) vet
GOGET        := $(GO) get
GOGEN        := $(GO) generate
GOCLEAN      := $(GO) clean
GOINSTALL    := $(GO) install
GOFLAGS      := -race
STATICCHECK  := staticcheck
LICENSEEYE   := license-eye
PIP          := pip3
PIPINSTALL   := $(PIP) install

# init arch
ARCH := $(shell getconf LONG_BIT)
ifeq ($(ARCH),64)
	GOTEST += $(GOFLAGS)
endif


# init git commit id
GIT_COMMIT ?= $(shell git rev-parse HEAD)



# make, make all
all: build


build:
	$(GOBUILD) -ldflags "-X main.commit=$(GIT_COMMIT) -extldflags=-static"




# avoid filename conflict and speed up build 
.PHONY: all build
