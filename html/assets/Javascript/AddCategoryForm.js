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


function addCategory () {
  
    // div 
    var div = document.createElement("div");
    div.setAttribute("class", "record");
  
    // divform 
    var divform = document.createElement("div");
    divform.setAttribute("class", "form-record");
    // divformvalue
    var divformvalue = document.createElement("div");
    divformvalue.setAttribute("class", "form-record-value");
    
    // form
    var form = document.createElement("form");
    form.setAttribute("class", "form");
    form.setAttribute("id", "AddCat");
  
    // input element for Category
    var recordname = document.createElement("input");
    recordname.setAttribute("type", "text");
    recordname.setAttribute("class", "category");
    recordname.setAttribute("name", "Category");
    recordname.setAttribute("Placeholder", "Category");
    recordname.setAttribute("value", "" );
  
    // input element for Description
    var recordvalue = document.createElement("input");
    recordvalue.setAttribute("type", "text");
    recordvalue.setAttribute("class", "Description");
    recordvalue.setAttribute("name", "Description");
    recordvalue.setAttribute("Placeholder", "Description");
    recordvalue.setAttribute("value", "");
  
    //submit button
    var s = document.createElement("button");
    s.setAttribute("type", "button");
    s.setAttribute("onclick", "addCategory()");
    s.innerHTML = "Add Category";
  
    //Create Structure
    div.append(form);
    form.append(divform);
    form.append(divformvalue);  
    divform.append(recordname);
    divformvalue.append(recordvalue);
    form.append(s);


    //Create Table
    var table = document.createElement("table");
    table.setAttribute("class", "table");
    
    //Create thead
    var thead = document.createElement("thead");

    //Create tr
    var tr = document.createElement("tr");
    
    //Create th
    var thCid = document.createElement("th");
    thCid.innerHTML = "Category_id";

    //Create th
    var thC = document.createElement("th");
    thC.innerHTML = "Category";

    //Create th
    var thD = document.createElement("th");
    thD.innerHTML = "Description";
    
    //Create th
    var tbody = document.createElement("tbody");
    
    //Create table Structure
    table.append(thead);
    table.append(tbody);
    thead.append(tr)
    tr.append(thCid); 
    tr.append(thC); 
    tr.append(thD); 

    //Form Div
    document.getElementsByClassName("AddCategory")[0].appendChild(div);
    document.getElementsByClassName("CategoryTable")[0].appendChild(table);

    //load php table
    var obj = new XMLHttpRequest();
    obj.onreadystatechange = function() {
        if(obj.readyState == 4) {
                document.getElementsByTagName("tbody")[0].innerHTML = obj.responseText;
        }
    }
    obj.open("GET", 'assets/PHP/categorytable.php', true);
    obj.setRequestHeader("Content-Type", "text/plain");
    obj.send("");

  
}
var addCategoryRow = once(addCategory);
