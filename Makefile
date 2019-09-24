SHELL := /bin/bash

# List of targets the `readme` target should call before generating the readme
export TERRAFORM_VERSION ?= 0.12.9

-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

## Lint terraform code
lint:
	$(SELF) terraform/install terraform/get-modules terraform/get-plugins terraform/lint terraform/validate