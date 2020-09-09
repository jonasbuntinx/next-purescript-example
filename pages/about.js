if (process.env.NODE_ENV == "production") {
  var mkAbout = require("../dce-output/Website.Page.About/index.js").mkAbout;
} else {
  var mkAbout = require("../output/Website.Page.About/index.js").mkAbout;
}

exports.default = mkAbout;
