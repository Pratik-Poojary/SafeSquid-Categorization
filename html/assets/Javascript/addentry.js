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


function additionalentryForm (val) {
  
  let zoneid = val;

  // div 
  var div = document.createElement("div");
  div.setAttribute("class", "record");

  // div 
  var divform = document.createElement("div");
  divform.setAttribute("class", "form-record");
  // div 
  var divformvalue = document.createElement("div");
  divformvalue.setAttribute("class", "form-record-value");
  
  // form
  var form = document.createElement("form");
  form.setAttribute("class", "form");
  form.setAttribute("id", "formid");

  // input element for recordname
  var recordname = document.createElement("input");
  recordname.setAttribute("type", "text");
  recordname.setAttribute("class", "recordname");
  recordname.setAttribute("name", "record");
  recordname.setAttribute("value", "" );

  // input element for zone
  var zone = document.createElement("input");
  zone.setAttribute("type", "hidden")
  zone.setAttribute("name", "zone");
  zone.setAttribute("class", "zoneid");
  zone.setAttribute("value", document.getElementsByClassName("zoneid").innerHTML = zoneid);

  // input element for recordvalue
  var recordvalue = document.createElement("input");
  recordvalue.setAttribute("type", "text");
  recordvalue.setAttribute("class", "recordvalue");
  recordvalue.setAttribute("name", "recordvalue");
  recordvalue.setAttribute("value", "");

  //submit button
  var s = document.createElement("button");
  s.setAttribute("type", "button");
  s.setAttribute("onclick", "addsubd()");
  s.innerHTML = "Update";

  //Create Structure
  div.append(form);
  form.append(divform);
  form.append(divformvalue);  
  divform.append(recordname);
  recordname.append(zone);
  divformvalue.append(recordvalue);
  form.append(s);

  //Form Div
  document.getElementsByClassName("MasterRecord")[0].appendChild(div);

  //Reload Script
   function reloadScript(id) {
    var $el =  $('#' + id);
    $('#' + id).replaceWith('<script id="' + id + '" src="' + $el.prop('src') + '"><\/script>');
  }
  reloadScript('instanciation');
}

var loadForm = once(additionalentryForm);


