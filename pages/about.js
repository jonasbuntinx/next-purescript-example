if (process.env.NODE_ENV == "production") {
  var mkAbout = require("../dce-output/Pages.About/index.js").mkAbout;
} else {
  var mkAbout = require("../output/Pages.About/index.js").mkAbout;
}

exports.default = mkAbout;
