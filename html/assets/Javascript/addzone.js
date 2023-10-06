function once(fn, context) { 
    var result;
    return function() { 
        if (fn) {
            result = fn.apply(context || this, arguments);
            fn = null;
        }
        return result;
    };
}

function addzone2database (clickID) {
    //GET FORM ID
    var chldid = clickID;
    var x = document.getElementById(chldid).parentElement.id;
  
    //GET FORM DATA
    var data = new FormData(document.getElementById(x));
  
    //AJAX CALL
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'assets/PHP/append.php',true);
    xhr.onload = function () {
    };
    xhr.send(data);
    return false;
}

var addzone = once(addzone2database);