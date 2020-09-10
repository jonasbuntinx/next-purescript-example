if (process.env.NODE_ENV == "production") {
  var mkNotFound = require("../dce-output/Pages.NotFound/index.js").mkNotFound;
} else {
  var mkNotFound = require("../output/Pages.NotFound/index.js").mkNotFound;
}

exports.default = mkNotFound;
