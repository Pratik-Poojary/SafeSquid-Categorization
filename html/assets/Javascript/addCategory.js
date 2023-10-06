function addCategory () {
  
    //GET FORM DATA
    var data = new FormData(document.getElementById('AddCat'));
    
    //AJAX CALL
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'assets/PHP/addcategory2database.php');
    xhr.onload = function () {
    console.log(this.response);
    };
    xhr.send(data);
    return false;
  
} 