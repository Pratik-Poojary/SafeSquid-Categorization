function updatecat (clickID) {
  //GET FORM ID
  var chldid = clickID;
  var x = document.getElementById(chldid).parentElement.id;

  //GET FORM DATA
  var data = new FormData(document.getElementById(x));

  //AJAX CALL
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'assets/PHP/update.php',true);
  xhr.onload = function () {
    console.log(this.response);
  };
  xhr.send(data);
  return false;
}