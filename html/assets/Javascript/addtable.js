function table () {
  
    //GET FORM DATA
    var data = new FormData(document.getElementById('categorytable'));
    
    //AJAX CALL
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'assets/PHP/categorytable.php');
    xhr.onload = function () {
    console.log(this.response);
    };
    xhr.send(data);
    return false;
  
}
 