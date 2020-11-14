#!/bin/sh

set -euo 

rm -rf ./dist

# transpile
tsc -p tsconfig.json

cp ./package.json ./yarn.lock ./dist
cd dist

# yarn install or yarn
yarn install

# upload source code to AWS Lambda
zip -r ./lambda.zip *

aws lambda update-function-code \
    --function-name x \
    --zip-file fileb://lambda.zip