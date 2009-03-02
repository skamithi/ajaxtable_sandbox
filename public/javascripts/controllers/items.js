Event.addBehavior({
    'body' : function() {
        new Ajax.Request('/items/add_spinners',{
                      method: 'get',
                      parameters: {}
                    });
    },

    '#query': Observed(
        function() {
            new Ajax.Request('/items', {
                method: 'get',
                parameters: $('search_form').serialize(true) });
        },
        { frequency: 0.5 }
    ),

    '#search_form' : Remote.Form({
            onLoading : function(){ $('query_spinner').show(); },
              onLoaded: function() { $('query_spinner').hide(); }
    }),
    '#show_all_items' : Remote.Link,
    'th.sortit a' : Remote.Link,
    'div.pagination a' : Remote.Link
});
