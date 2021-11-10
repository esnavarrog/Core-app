$(document).on('turbolinks:load', events)

function events() {

    $('body').on('submit', 'form', function () {
        $('.loader').fadeIn(100);
    })

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

    $('body').on('click', '#submit-update', function () {
        $('#submit-update-form').click();
    })

    $('body').on('click', '#submit-details', function () {
        $('#submit-details-form').click();
    })

    $('body').on('change', '#girl_avatar', function () {
        let styles = 'width:186px; height:186px; object-fit: cover;'
        let className = 'img-circle-form'
        let target = '#avatar-form'
        filePreview(this, target, className, styles)
    })
    $('body').on('change', '#girl_portada', function () {
        let styles = 'height:162px; object-fit: cover;';
        let className = 'portada';
        let target = '#portada-form';
        filePreview(this, target, className, styles)
    })

    function filePreview(input, target, className, styles) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); 
            reader.onload = function (e) {
                $(target).html('<img src="'+e.target.result+'" style="'+styles+'"  class="'+className+'" />');
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
}