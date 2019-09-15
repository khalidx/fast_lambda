import awslambda, osproc, json, times

proc handler(event: JsonNode, context: LambdaContext): JsonNode =
  echo "Hi from nim! Invocation will timeout at: ", context.deadline.format("yyyy-MM-dd'T'HH:mm:ss'.'fff")

  event["newKey"] = %*"newVal"

  let (output, exitCode) = execCmdEx "ls"

  event["cmdOutput"] = %*output
  event["cmdExitCode"] = %*exitCode

  event

when isMainModule:
  startLambda(handler)
