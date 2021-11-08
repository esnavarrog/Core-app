$(document).on('turbolinks:load', events)

function events() {
    function loader(){
        setTimeout(function() {
            $('.loader').fadeOut(1000);
            $('#body').removeClass('hidden-loader');
        }, 1000);
    }

    $('window').on('load', loader());

    $('body').on('change', '#valor-consultar', function () {
        let checkbox = $(this);
        if (checkbox.is(":checked")) {
            $('#precio-hora').val('consultar').addClass('disabled')
            $('#hidden-field-price').removeClass('disabled')
            $('#hidden-field-price').val('consultar')
        } else {
            $('#hidden-field-price').addClass('disabled')
            $('#precio-hora').val('').removeClass('disabled')
        }
    })
}