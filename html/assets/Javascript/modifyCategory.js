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

function modifycategory () {
  
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
    
    // input element for selecting the category
    var recordvalue = document.createElement("input");
    recordvalue.setAttribute("type", "text");
    recordvalue.setAttribute("class", "recordvalue2");
    recordvalue.setAttribute("id", "mod_cat");
    recordvalue.setAttribute("name", "recordvalue");

  
    //submit button
    var s = document.createElement("button");
    s.setAttribute("type", "button");
    s.setAttribute("id", "btnid1");
    s.setAttribute("onclick", "search_websites(this.id)");
    s.innerHTML = "Search";
  
    //Create Structure
    div.append(form);
    form.append(divformvalue);  
    divformvalue.append(recordvalue);
    form.append(s);

    //Form Div
    document.getElementsByClassName("ModifyCategory")[0].appendChild(div);

    //Reload Script
   function reloadScript(id) {
    var $el =  $('#' + id);
    $('#' + id).replaceWith('<script id="' + id + '" src="' + $el.prop('src') + '"><\/script>');
  }
  reloadScript('instanciation');
}
var modifyCategoryRow = once(modifycategory);
