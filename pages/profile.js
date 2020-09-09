if (process.env.NODE_ENV == "production") {
  var mkProfile = require("../dce-output/Website.Page.Profile/index.js").mkProfile;
} else {
  var mkProfile = require("../output/Website.Page.Profile/index.js").mkProfile;
}

exports.default = mkProfile;
