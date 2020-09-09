if (process.env.NODE_ENV == "production") {
  var mkNotFound = require("../dce-output/Website.Page.NotFound/index.js").mkNotFound;
} else {
  var mkNotFound = require("../output/Website.Page.NotFound/index.js").mkNotFound;
}

exports.default = mkNotFound;
