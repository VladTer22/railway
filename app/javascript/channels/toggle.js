export function toggle(form, title, obj) {
    form.toggle();
    title.toggle();
    if ($(obj).hasClass('cancel')) {
        $(obj).html('Edit');
        $(obj).removeClass('cancel')
    } else {
        $(obj).html('Cancel');
        $(obj).addClass('cancel')
    }
}