$(document).on('turbolinks:load', events)

function events() {
    $('#modal-publish').on('hidden.bs.modal', function () {
        $('#post_img').val('')
        $('#post_video').val('')
        console.log('cerrado modal')
    })
}