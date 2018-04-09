import { toggle } from './toggle.js'

$(document).ready(function (){
    $('a.edit_route_btn').click(function (e) {
        e.preventDefault();
        const route_id = $(this).data('routeId');
        let form;
        let title;

        form = $('#edit_route_' + route_id);
        title = $('#route_title_' + route_id);
        toggle(form, title, $(this));
    })
})