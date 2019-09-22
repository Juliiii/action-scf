#!/bin/bash

if [ -z "$INPUT_APPID" -o -z "$INPUT_SECRETID"  -o -z "$INPUT_SECRETKEY" ]
then
    echo "Required parameter missing: appId, secretId, secretKey"
    exit 1
fi


scf configure set --appid "$INPUT_APPID" --secret-id "$INPUT_SECRETID" --secret-key "$INPUT_SECRETKEY"

if [ -n "$INPUT_REGION" ]
then
  scf configure set --region "$INPUT_REGION"
fi

if [ -n "$INPUT_REGION" ]
then
  scf configure set --region "$INPUT_REGION"
fi

if [ -n "$INPUT_USINGCOS" -a "$INPUT_USINGCOS" != "false"  ]
then
  scf configure set --using-cos y
fi

scf configure get