# fast_lambda

A super fast AWS Lambda Function, written with Nim and compiled to a native binary.

- Single-digit cold-start times, usually < 1ms outside of a VPC
- When inside a VPC, usually starts in under 30ms (with the new AWS VPC networking improvements)

## Usage

1. Build

```sh
nimble install -y
```

2. Package

```sh
nimble package
```

3. Deploy

Create an AWS Lambda Function with the "custom runtime" option and upload the `lambda.zip` file.

## Thanks

A big shoutout and thanks to the creators of the [Nim programming language](https://nim-lang.org/) and the [awslambda.nim](https://github.com/lambci/awslambda.nim) repository!
