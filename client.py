import grpc
import calculator_pb2 as a
import calculator_pb2_grpc as b

def run_client(num1, num2):
    channel = grpc.insecure_channel('localhost:50051')
    client = b.CalculatorStub(channel)
    request = a.AddRequest(x=num1, y=num2)
    response = client.Add(request)
    print(f"Result: {request.x} + {request.y} = {response.result}")

if __name__ == '__main__':
    num1 = 10
    num2 = 20
    run_client(num1, num2)
