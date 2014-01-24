root = global ? window

if not root.ShareCoffee? or not root.ShareCoffee.REST?
	throw new Error("LoadError")

root.ShareCoffee.MaxUrlLength = 100

root.ShareCoffee.REST.Search =
	build:
		query:
			for: new ShareCoffee.RESTFactory 'GET'
		postQuery:
			for: new ShareCoffee.RESTFactory 'POST'
		suggest:
			for: new ShareCoffee.RESTFactory 'GET'
