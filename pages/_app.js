require("../styles/styles.css");

if (process.env.NODE_ENV == "production") {
  var mkApp = require("../dce-output/Pages.App/index.js").mkApp;
} else {
  var mkApp = require("../output/Pages.App/index.js").mkApp;
}

exports.default = mkApp;
