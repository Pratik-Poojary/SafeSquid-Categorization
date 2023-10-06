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

function search_websites (clickID) {
    //GET FORM ID
    var chldid = clickID;
    var x = document.getElementById(chldid).parentElement.id;

    //GET FORM DATA
    var data = new FormData(document.getElementById(x));

    //AJAX CALL
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'assets/PHP/search_category.php',true);
    xhr.onload = function () {

        let jsonData = JSON.parse(this.responseText);
    
        // div 
        var div = document.createElement("div");
        div.setAttribute("class", "addrecord");

        // divformvalue
        var divformvalue = document.createElement("div");
        divformvalue.setAttribute("class", "form-record-value");

        // form
        var form = document.createElement("form");
        form.setAttribute("class", "form");
        form.setAttribute("id", "formid_modify_cat");

        // divform 
        var divform = document.createElement("div");
        divform.setAttribute("class", "form-record");

        // input element for appending websites to a category.
        var recordname = document.createElement("textarea");
        recordname.setAttribute("type", "text");
        recordname.setAttribute("class", "list_website");
        recordname.setAttribute("id", "list_website");
        recordname.setAttribute("name", "Select Category");
        // Loop through the JSON array and populate the textarea
        jsonData.forEach(function (item) {
            let urlbl = item.origin;
            let website = urlbl.slice(0,-10);
            recordname.innerHTML += website + '\n';
        });

        //Create Structure
        div.append(form);
        form.append(divform);
        divform.append(recordname);

        //Form Div
        document.getElementsByClassName("ModifyCategory")[0].appendChild(div);

        //Update onclick function.
        document.getElementById( "btnid1" ).setAttribute( "onClick", "javascript: modifycategory_blukupdate();" );
        document.getElementById( "btnid1" ).innerHTML = "Modify Category";

    };
    xhr.send(data);
}

//find difference between strings.
function findDiff(str1, str2){ 
    let diff= "";
    str2.split('').forEach(function(val, i){
      if (val != str1.charAt(i))
        diff += val ;         
    });
    return diff;
}

function modifycategory_blukupdate () {

    //GET FORM ID
    var textAreaString = document.getElementById("list_website");
    var htmlString = document.getElementById("mod_cat")
        .innerHTML;

    //GET CATEGORY VALUE
    const parser = new DOMParser();
    const doc = parser.parseFromString(htmlString, 'text/html');
    const hiddenInputs = doc.querySelectorAll('input[type="hidden"]');
    const webCategoryArray = Array.from(hiddenInputs).map(input => input.value);

    //GET TEXTAREA DATA
    var new_web_list = textAreaString.value;
    var default_web_list = textAreaString.defaultValue;
    var websiteArray = new Array();
    var uniq_str = findDiff(default_web_list, new_web_list)
    websiteArray  = uniq_str.split('\n')
        .map(item => item.trim())
        .filter(item => item !== ''); 
    
    //GET DATA from the array.
    const data = {
        "webCategory":  webCategoryArray,
        "website": websiteArray
    };

    // AJAX CALL
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'assets/PHP/modify_category.php',true);
    xhr.onload = function () {
    }
    //send the unique data
    xhr.send(JSON.stringify(data));
}

var modifycat = once(modifycategory_blukupdate);