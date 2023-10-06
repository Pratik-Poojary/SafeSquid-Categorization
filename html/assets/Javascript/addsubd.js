function addsubd () {
  
  //GET FORM DATA
  var data = new FormData(document.getElementById('formid'));
  
  //AJAX CALL
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'assets/PHP/addsub.php');
  xhr.onload = function () {
  console.log(this.response);
  };
  xhr.send(data);
  return false;

}
