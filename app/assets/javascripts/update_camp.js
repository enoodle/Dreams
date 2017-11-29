$(document).ready(function() {

    $('#save-camp').click(function() {
        var step = findGetParameter('step');
        step = step || 1;
        $('#camp-form').append('<input type="hidden" name="step" value="'+step+'" />');
        $('#camp-form').submit();
    });

    $('#done-camp').click(function() {
        $('#camp-form').append('<input type="hidden" name="done" value="1" />');
        $('#camp-form').submit();
    });
});