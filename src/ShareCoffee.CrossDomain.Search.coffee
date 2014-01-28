root = global ? window

if not root.ShareCoffee? or not root.ShareCoffee.CrossDomain?
	throw new Error("LoadError")


root.ShareCoffee.CrossDomain.Search =
	build:
		query:
			for: new ShareCoffee.CrossDomainRESTFactory 'GET'
		postQuery:
			for: new ShareCoffee.CrossDomainRESTFactory 'POST'
		suggest:
			for: new ShareCoffee.CrossDomainRESTFactory 'GET'
