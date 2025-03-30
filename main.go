package main

import (
	"context"
	"os"
	"os/signal"
	"syscall"

	"github.com/DARKXSIDE78/teldrive/cmd"
)

func main() {
	ctx, cancel := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM, syscall.SIGQUIT)
	defer cancel()

	if err := cmd.New().ExecuteContext(ctx); err != nil {
		panic(err)
	}
}
