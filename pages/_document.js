if (process.env.NODE_ENV == "production") {
  var mkDocument = require("../dce-output/Website.Document/index.js").mkDocument;
} else {
  var mkDocument = require("../output/Website.Document/index.js").mkDocument;
}

exports.default = mkDocument();
