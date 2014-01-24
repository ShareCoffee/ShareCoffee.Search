/*
ShareCoffee.Search (c) 2014 Thorsten Hans
| dotnet-rocks.com | https://github.com/ThorstenHans/ShareCoffee.Search/ | under MIT License |
*/


(function() {
  var root,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  root = typeof global !== "undefined" && global !== null ? global : window;

  if ((root.ShareCoffee == null) || (root.ShareCoffee.CrossDomain == null)) {
    throw new Error("LoadError");
  }

  root.ShareCoffee.CrossDomain.Search = {
    build: {
      query: {
        "for": new ShareCoffee.CrossDomainRESTFactory('GET')
      },
      postQuery: {
        "for": new ShareCoffee.CrossDomainRESTFactory('POST')
      },
      suggest: {
        "for": new ShareCoffee.CrossDomainRESTFactory('GET')
      }
    }
  };

  root = typeof global !== "undefined" && global !== null ? global : window;

  if (root.ShareCoffee == null) {
    throw new Error("LoadError");
  }

  root.ShareCoffee.QueryProperties = (function() {
    function _Class(querytext, selectproperties, querytemplate) {
      this.querytext = querytext;
      this.selectproperties = selectproperties;
      this.querytemplate = querytemplate;
      this.validateUrl = __bind(this.validateUrl, this);
      this.getRequestProperties = __bind(this.getRequestProperties, this);
      this.getUrl = __bind(this.getUrl, this);
      if (this.querytext == null) {
        this.querytext = null;
      }
      this.isPostQuery = false;
      if (this.querytemplate == null) {
        this.querytemplate = null;
      }
      if (this.enableinterleaving == null) {
        this.enableinterleaving = null;
      }
      if (this.sourceid == null) {
        this.sourceid = null;
      }
      if (this.rankingmodelid == null) {
        this.rankingmodelid = null;
      }
      if (this.startrow == null) {
        this.startrow = null;
      }
      if (this.rowlimit == null) {
        this.rowlimit = null;
      }
      if (this.rowsperpage == null) {
        this.rowsperpage = null;
      }
      if (this.selectproperties == null) {
        this.selectproperties = null;
      }
      if (this.culture == null) {
        this.culture = null;
      }
      if (this.refiners == null) {
        this.refiners = null;
      }
      if (this.refinementfilters == null) {
        this.refinementfilters = null;
      }
      if (this.hiddenconstraints == null) {
        this.hiddenconstraints = null;
      }
      if (this.sortlist == null) {
        this.sortlist = null;
      }
      if (this.enablestemming == null) {
        this.enablestemming = null;
      }
      if (this.trimduplicates == null) {
        this.trimduplicates = null;
      }
      if (this.trimduplicatesincludeid == null) {
        this.trimduplicatesincludeid = null;
      }
      if (this.timeout == null) {
        this.timeout = null;
      }
      if (this.enablenicknames == null) {
        this.enablenicknames = null;
      }
      if (this.enablephonetic == null) {
        this.enablephonetic = null;
      }
      if (this.enablefql == null) {
        this.enablefql = null;
      }
      if (this.hithighlightedproperties == null) {
        this.hithighlightedproperties = null;
      }
      if (this.bypassresulttypes == null) {
        this.bypassresulttypes = null;
      }
      if (this.processbestbets == null) {
        this.processbestbets = null;
      }
      if (this.clienttype == null) {
        this.clienttype = null;
      }
      if (this.personalizationdata == null) {
        this.personalizationdata = null;
      }
      if (this.resultsurl == null) {
        this.resultsurl = null;
      }
      if (this.querytag == null) {
        this.querytag = null;
      }
      if (this.enablequeryrules == null) {
        this.enablequeryrules = null;
      }
      if (this.enablesorting == null) {
        this.enablesorting = null;
      }
      this.hostWebUrl = null;
      this.onSuccess = null;
      this.onError = null;
    }

    _Class.prototype.getUrl = function() {
      var getSafeStringForREST, p, propertyValue, url, urlProperties;
      urlProperties = ['querytext', 'querytemplate', 'enableinterleaving', 'sourceid', 'rankingmodelid', 'startrow', 'rowlimit', 'rowsperpage', 'selectproperties', 'culture', 'refiners', 'refinementfilters', 'hiddenconstraints', 'sortlist', 'enablestemming', 'trimduplicates', 'trimduplicatesincludeid', 'timeout', 'enablenicknames', 'enablephonetic', 'enablefql', 'hithighlightedproperties', 'bypassresulttypes', 'processbestbets', 'clienttype', 'personalizationdata', 'resultsurl', 'querytag', 'enablequeryrules', 'enablesorting'];
      getSafeStringForREST = function(input) {
        return encodeURIComponent(input.replace(/'/g, '"'));
      };
      url = "Search/query?";
      for (p in this) {
        propertyValue = this[p];
        if (urlProperties.indexOf(p) > -1 && (propertyValue != null)) {
          if (typeof propertyValue === 'string') {
            url = "" + url + p + "='" + (getSafeStringForREST(propertyValue)) + "'&";
          } else if (typeof propertyValue === 'number' || typeof propertyValue === 'boolean') {
            url = "" + url + p + "=" + propertyValue + "&";
          }
        }
      }
      return url.substr(0, url.length - 1);
    };

    _Class.prototype.getRequestProperties = function() {
      this.validateUrl();
      return new ShareCoffee.REST.RequestProperties(this.getUrl(), null, this.hostWebUrl, null, this.onSuccess, this.onError);
    };

    _Class.prototype.validateUrl = function() {
      var url;
      url = "";
      if (this.hostWebUrl != null) {
        url = "" + (ShareCoffee.Commons.getApiRootUrl()) + "SP.AppContextSite(@target)/" + (this.getUrl()) + "?@target='" + this.hostWebUrl + "'";
      } else {
        url = "" + (ShareCoffee.Commons.getApiRootUrl()) + (this.getUrl());
      }
      if (url.length > ShareCoffee.MaxUrlLength) {
        throw new Error('URL is to long, please use a PostQuery instead of a regular GET Query');
      }
    };

    return _Class;

  })();

  root.ShareCoffee.PostQueryProperties = (function(_super) {
    __extends(_Class, _super);

    function _Class(querytext, selectproperties, querytemplate) {
      this.querytext = querytext;
      this.selectproperties = selectproperties;
      this.querytemplate = querytemplate;
      _Class.__super__.constructor.call(this, this.querytext, this.selectproperties, this.querytemplate);
      this.isPostQuery = true;
    }

    _Class.prototype.getRequestProperties = function() {
      var p, payload, propertyValue, urlProperties;
      payload = {};
      urlProperties = ['querytext', 'querytemplate', 'enableinterleaving', 'sourceid', 'rankingmodelid', 'startrow', 'rowlimit', 'rowsperpage', 'selectproperties', 'culture', 'refiners', 'refinementfilters', 'hiddenconstraints', 'sortlist', 'enablestemming', 'trimduplicates', 'trimduplicatesincludeid', 'timeout', 'enablenicknames', 'enablephonetic', 'enablefql', 'hithighlightedproperties', 'bypassresulttypes', 'processbestbets', 'clienttype', 'personalizationdata', 'resultsurl', 'querytag', 'enablequeryrules', 'enablesorting'];
      for (p in this) {
        propertyValue = this[p];
        if (urlProperties.indexOf(p) > -1 && (propertyValue != null)) {
          payload[p] = this[p];
        }
      }
      return new ShareCoffee.REST.RequestProperties("Search/postQuery", payload, this.hostWebUrl, null, this.onSuccess, this.onError);
    };

    return _Class;

  })(root.ShareCoffee.QueryProperties);

  root.ShareCoffee.SuggestProperties = (function() {
    function _Class(querytext, inumberofquerysuggestions, inumberofresultsuggestions, fprequerysuggestions, fhithighlighting, fcapitalizefirstletters, showpeoplenamesuggestions, culture) {
      this.querytext = querytext;
      this.inumberofquerysuggestions = inumberofquerysuggestions;
      this.inumberofresultsuggestions = inumberofresultsuggestions;
      this.fprequerysuggestions = fprequerysuggestions;
      this.fhithighlighting = fhithighlighting;
      this.fcapitalizefirstletters = fcapitalizefirstletters;
      this.showpeoplenamesuggestions = showpeoplenamesuggestions;
      this.culture = culture;
      this.getUrl = __bind(this.getUrl, this);
      this.getRequestProperties = __bind(this.getRequestProperties, this);
      if (this.querytext == null) {
        this.querytext = null;
      }
      if (this.inumberofquerysuggestions == null) {
        this.inumberofquerysuggestions = null;
      }
      if (this.inumberofresultsuggestions == null) {
        this.inumberofresultsuggestions = null;
      }
      if (this.fprequerysuggestions == null) {
        this.fprequerysuggestions = null;
      }
      if (this.fhithighlighting == null) {
        this.fhithighlighting = null;
      }
      if (this.fcapitalizefirstletters == null) {
        this.fcapitalizefirstletters = null;
      }
      if (this.showpeoplenamesuggestions == null) {
        this.showpeoplenamesuggestions = null;
      }
      if (this.culture == null) {
        this.culture = null;
      }
      this.hostWebUrl = null;
      this.onSuccess = null;
      this.onError = null;
    }

    _Class.prototype.getRequestProperties = function() {
      return new ShareCoffee.REST.RequestProperties(this.getUrl(), null, this.hostWebUrl, null, this.onSuccess, this.onError);
    };

    _Class.prototype.getUrl = function() {
      var getSafeStringForREST, p, propertyValue, url, urlProperties;
      urlProperties = ['querytext', 'inumberofquerysuggestions', 'inumberofresultsuggestions', 'fprequerysuggestions', 'fhithighlighting', 'fcapitalizefirstletters', 'showpeoplenamesuggestions', 'culture'];
      url = "Search/suggest?";
      getSafeStringForREST = function(input) {
        return encodeURIComponent(input.replace(/'/g, '"'));
      };
      for (p in this) {
        propertyValue = this[p];
        if (urlProperties.indexOf(p) > -1 && (propertyValue != null)) {
          if (typeof propertyValue === 'string') {
            url = "" + url + p + "='" + (getSafeStringForREST(propertyValue)) + "'&";
          } else if (typeof propertyValue === 'number' || typeof propertyValue === 'boolean') {
            url = "" + url + p + "=" + propertyValue + "&";
          }
        }
      }
      return url.substr(0, url.length - 1);
    };

    return _Class;

  })();

  root = typeof global !== "undefined" && global !== null ? global : window;

  if ((root.ShareCoffee == null) || (root.ShareCoffee.REST == null)) {
    throw new Error("LoadError");
  }

  root.ShareCoffee.MaxUrlLength = 100;

  root.ShareCoffee.REST.Search = {
    build: {
      query: {
        "for": new ShareCoffee.RESTFactory('GET')
      },
      postQuery: {
        "for": new ShareCoffee.RESTFactory('POST')
      },
      suggest: {
        "for": new ShareCoffee.RESTFactory('GET')
      }
    }
  };

}).call(this);

/*
//@ sourceMappingURL=ShareCoffee.Search.js.map
*/