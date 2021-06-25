	client := http.Client{}
	url := ""
	method := ""
	body := bytes.NewBufferString("")
	req, err := http.NewRequest(url, method, body)
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
