root = global ? window

if not root.ShareCoffee?
	throw new Error("LoadError")

root.ShareCoffee.Search =
	build:
		query: 
			for: new ShareCoffee.RESTFactory 'GET'
		postQuery: 
			for: new ShareCoffee.RESTFactory 'POST'
		suggest: 
			for: new ShareCoffee.RESTFactory 'GET'