if (process.env.NODE_ENV == "production") {
  var mkProfile = require("../dce-output/Pages.Profile/index.js").mkProfile;
} else {
  var mkProfile = require("../output/Pages.Profile/index.js").mkProfile;
}

exports.default = mkProfile;
