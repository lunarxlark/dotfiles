app := cli.App{
  Name:    "{{_cursor_}}",
  Usage:   "{{_cursor_}}",
  Version: "{{_cursor_}}",
  Commands: []*cli.Command{
    {Name: "list", Action: cmdList},
  },
}

err := app.Run(os.Args)
if err != nil {
  log.Fatal(err.Error())
}

func cmdList(ctx *cli.Context) error {
	return nil
}
