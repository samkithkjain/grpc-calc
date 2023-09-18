#!bin/bash

# Setup gRPC for Go
go get -u google.golang.org/protobuf/cmd/protoc-gen-go;
go install google.golang.org/protobuf/cmd/protoc-gen-go;
go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc;
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc;

# Setup gRPC for Python
# Define the desired LANG value
LANG_VALUE="en_US.UTF-8"

# Check if the LANG variable is already set in ~/.bashrc
if grep -q "export LANG=$LANG_VALUE" ~/.bashrc; then
  echo "LANG is already set in ~/.bashrc."
else
  # Append the export statement to ~/.bashrc
  echo "export LANG=$LANG_VALUE" >> ~/.bashrc
  echo "LANG set to $LANG_VALUE in ~/.bashrc."
fi

# Load the updated ~/.bashrc to apply the changes immediately
source ~/.bashrc
pipenv install Pipfile

pipenv shell
