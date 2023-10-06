$(function() {

    var ms = $('.recordvalue').magicSuggest({
        data: 'assets/PHP/category.php',
        valueField: 'Category_id',
        displayField: 'Category',
        resultsField: 'Category_id',
        mode: 'local',
        cls: 'custom',
        required: true,
        resultAsString: true,
        strictSuggest: true,
        expandOnFocus: true,
        resultAsString: true,
        allowFreeEntries: false,
        // useZebraStyle: true,
        toggleOnClick: true,
        sortOrder: 'category',
        noSuggestionText: 'No result matching the term {{query}}',
        allowDuplicates: false,
        placeholder: 'click to modify', 
        renderer: function(data){
            return '<div class="custom">' +
                       '<div class="CategoryName">' + data.Category + '</div>' +
                       '<div class="Description">' + data.Descriptions + '</div>' +
                   '</div>' ;
        },      
    });    

});


$(function() {

    var mc = $('.recordvalue2').magicSuggest({
        data: 'assets/PHP/category.php',
        valueField: 'Category_id',
        displayField: 'Category',
        resultsField: 'Category_id',
        mode: 'local',
        cls: 'custom',
        required: true,
        resultAsString: true,
        strictSuggest: true,
        expandOnFocus: true,
        resultAsString: true,
        allowFreeEntries: false,
        // useZebraStyle: true,
        toggleOnClick: true,
        sortOrder: 'category',
        noSuggestionText: 'No result matching the term {{query}}',
        allowDuplicates: false,
        placeholder: 'click to modify', 
        renderer: function(data){
            return '<div class="custom">' +
                       '<div class="CategoryName">' + data.Category + '</div>' +
                   '</div>' ;
        },      
    });    

});
