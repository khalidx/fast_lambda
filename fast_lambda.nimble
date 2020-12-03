# Package

version       = "0.1.0"
author        = "Khalid Zoabi"
description   = "A super fast AWS Lambda Function, written with Nim and compiled to a native binary."
license       = "MIT"
srcDir        = "."
bin           = @["fast_lambda"]
skipExt       = @["nim"]

# Dependencies

requires "nim >= 0.20.2", "awslambda >= 0.2.0"

# Tasks

task package, "Packages the Lambda function":
  exec "docker run --rm -v \"$PWD\":/app -w /app nimlang/nim sh -c 'nimble install -y && nim c -d:release fast_lambda.nim'"
  exec "cp fast_lambda bootstrap"
  exec "zip -yr lambda.zip bootstrap"

task clean, "Cleans up build files":
  exec "rm fast_lambda"
  exec "rm bootstrap"
  exec "rm lambda.zip"
