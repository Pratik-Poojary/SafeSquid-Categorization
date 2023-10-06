function readyxml () {

    jQuery.ajax({
        type: "GET",
        statusCode: {
            200: function() {
                var a = document.createElement('a');
                a.href = "../../category_list/index.php";
                a.download = 'category';
                a.click();
            }
        }
    });
    
}
