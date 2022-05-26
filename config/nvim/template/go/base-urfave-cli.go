package main

import (
	"log"
	"os"

	"github.com/urfave/cli/v2"
)

func main() {
	if err := newApp().Run(os.Args); err != nil {
		exitCode := 1
		if excoder, ok := err.(cli.ExitCoder); ok {
			exitCode = excoder.ExitCode()
		}
		log.Println(err.Error())
		os.Exit(exitCode)
	}
}

func newApp() *cli.App {
	app := cli.NewApp()
	app.Name = "{{_cursor_}}"
	app.Usage = "{{_cursor_}}"
	app.Version = "{{_cursor_}}"
	app.Authors = []*cli.Author{{
		Name:  "{{_cursor_}}",
		Email: "{{_cursor_}}",
	}}
	app.Commands = commands
	return app
}
