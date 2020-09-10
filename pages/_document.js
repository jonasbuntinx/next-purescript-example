if (process.env.NODE_ENV == "production") {
  var mkDocument = require("../dce-output/Pages.Document/index.js").mkDocument;
} else {
  var mkDocument = require("../output/Pages.Document/index.js").mkDocument;
}

exports.default = mkDocument();
