require("../styles/styles.css");

if (process.env.NODE_ENV == "production") {
  var mkApp = require("../dce-output/Website.App/index.js").mkApp;
} else {
  var mkApp = require("../output/Website.App/index.js").mkApp;
}

exports.default = function App (props) { return mkApp(props)(); };
