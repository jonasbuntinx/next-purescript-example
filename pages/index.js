if (process.env.NODE_ENV == "production") {
  var home = require("../dce-output/Website.Page.Home/index.js");
} else {
  var home = require("../output/Website.Page.Home/index.js");
}

exports.getServerSideProps = home.getServerSideProps;

exports.default = home.mkHome;
