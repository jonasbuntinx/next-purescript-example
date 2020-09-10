if (process.env.NODE_ENV == "production") {
  var home = require("../dce-output/Pages.Home/index.js");
} else {
  var home = require("../output/Pages.Home/index.js");
}

exports.getServerSideProps = home.getServerSideProps;

exports.default = home.mkHome;
