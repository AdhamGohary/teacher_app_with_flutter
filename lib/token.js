/*const axios = require("axios");
const localStorage = require("node-localstorage");
///////////////////////////////
function storeToken(token) {
  localStorage.setItem("token", token);
}

///////////////////////////////
function getToken() {
  localStorage.getItem("token");
}

//////////////////////////////
function getTokenFromBackend() {
  axios
    .get("http://192.168.137.1:9090/teacherapp/userNameAndPasswordRoutes")
    .then((response) => {
      const token = response.headers["Authorization"];
      storeToken(token);
    });
}
/////////////////////////////
module.exports = {
  getTokenFromBackend,
  storeToken,
  getToken,
};*/
