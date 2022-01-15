$(document).on('turbolinks:load', events)

function events() {

    $('.button-select-type-user').on('click', function(){
        let target = $(this).data('target')
        $('#first-info').toggleClass('d-none')
        $('#' + target).fadeIn('slow')
    })



}