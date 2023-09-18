package main

import (
	"context"
	"log"
	"net"

	calculator "github.com/rvarun11/grpc-calc/go_calculator"
	"google.golang.org/grpc"
)

type myCalculatorServer struct {
    calculator.UnimplementedCalculatorServer
}

func (s *myCalculatorServer) Add(ctx context.Context, req *calculator.AddRequest) (*calculator.AddResponse, error) {
    result := req.X + req.Y
    return &calculator.AddResponse{Result: result}, nil
}

func main() {
    lis, err := net.Listen("tcp", ":50051")
    if err != nil {
        log.Fatalf("Failed to listen: %v", err)
    }
    grpcServer := grpc.NewServer()
    calculator.RegisterCalculatorServer(grpcServer, &myCalculatorServer{})
    log.Println("Server is running on port 50051...")
    if err := grpcServer.Serve(lis); err != nil {
        log.Fatalf("Failed to serve: %v", err)
    }
}
