root = global ? window

if not root.ShareCoffee? or not root.ShareCoffee.REST?
	throw new Error("LoadError")

# based on RFC2616 - HTTP specs
root.ShareCoffee.MaxUrlLength = 2000

root.ShareCoffee.REST.Search =
	build:
		query:
			for: new ShareCoffee.RESTFactory 'GET'
		postQuery:
			for: new ShareCoffee.RESTFactory 'POST'
		suggest:
			for: new ShareCoffee.RESTFactory 'GET'
