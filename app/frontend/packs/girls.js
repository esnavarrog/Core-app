$(document).on('turbolinks:load', events)

function events() {
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