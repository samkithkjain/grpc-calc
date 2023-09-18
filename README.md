# Get Started with GRPC


To regenerate go server code:
```bash
protoc \
  --go_out=go_calculator \
  --go_opt=paths=source_relative \
  --go-grpc_out=go_calculator \
  --go-grpc_opt=paths=source_relative \
  calculator.proto
```

To regenerate python client code:

```bash
python3 -m grpc_tools.protoc \
  --proto_path=. \
  --python_out=. \
  --grpc_python_out=. \
  calculator.proto
```
