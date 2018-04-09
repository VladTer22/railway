import { toggle } from './toggle.js'

$(document).ready(function () {
    $('a.edit_train_btn').click(function (e) {
        e.preventDefault();
        const train_id = $(this).data('trainId');
        let form;
        let title;

        form = $('#edit_train_' + train_id);
        title = $('#train_number_' + train_id);
        toggle(form, title, $(this));
    })
})