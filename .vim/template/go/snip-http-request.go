	client := http.Client{}
	method := ""
	url := ""
	body := bytes.NewBufferString("")
	req, err := http.NewRequest(method, url, body)
	if err != nil {
		return err
	}

	req.Header.Add("key", "value")
	res, err := client.Do(req)
	if err != nil {
		return err
	}
	defer res.Body.Close()

	pp.Println(res.Body)
