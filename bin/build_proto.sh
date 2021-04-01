#!/usr/bin/bash

# Step 1: create temporary directory
TEMP=$(mktemp -d -t protofiles-XXXXXX)

# Step 2: download proto file
wget -P ${TEMP} https://raw.githubusercontent.com/ahmedkhalf/rpc-mail/master/mail.proto

# Step 3: generate python code from proto files
poetry run python -m grpc_tools.protoc -I ${TEMP} --python_out=../rpc_mail/protomail/ --grpc_python_out=../rpc_mail/protomail/ "$TEMP/mail.proto"

# Step 4: delete temporary directory
rm -rf ${TEMP}

