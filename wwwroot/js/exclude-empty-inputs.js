// Make sure we don't allow the browser to cache the page
window.onpageshow = function(event)
{
    if (event.persisted)
        window.location.reload();
}

var form = document.getElementById("advanced-search");

form.addEventListener('submit', function()
{
    var inputs = form.getElementsByTagName('input');

    for (var i = 0; i < inputs.length; i++)
    {
        var input = inputs[i];
        if (input.name && !input.value)
        {
            input.name = '';
        }
    }

    var selects = form.getElementsByTagName('select');

    for (var i = 0; i < selects.length; i++)
    {
        var select = selects[i];
        if (select.name && select.value == "(any)")
        {
            select.name = '';
        }
    }
});