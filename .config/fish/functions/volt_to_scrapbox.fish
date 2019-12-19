function volt_to_scrapbox
	volt list | sed -r '1,2d; s/.*\/([a-zA-Z-]+\/[a-zA-Z-]+).*/[\1 https:\/\/github.com\/\1]/g'
end
