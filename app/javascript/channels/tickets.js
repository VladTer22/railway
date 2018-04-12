$(document).ready(function () {
    let selected = $('#ticket_carriage_type').val();
    $('#ticket_seat_type').children().hide();
    change(selected)
    $('#ticket_carriage_type').on('change', function (e) {
        selected = $('#ticket_carriage_type').val();
        $('#ticket_seat_type').children().hide();
        change(selected);
    });
})

function change(selected) {
    switch (selected) {
        case 'CoupeCarriage':
            $('#ticket_seat_type').val("Bottom")
            $('#ticket_seat_type option[value="Bottom"]').show();
            $('#ticket_seat_type option[value="Top"]').show();
            break;
        case 'SleepCarriage':
            $('#ticket_seat_type').val("Bottom")
            $('#ticket_seat_type option[value="Bottom"]').show();
            break;
        case 'EconomyCarriage':
            $('#ticket_seat_type').val("Bottom")
            $('#ticket_seat_type option[value="Bottom"]').show();
            $('#ticket_seat_type option[value="Top"]').show();
            $('#ticket_seat_type option[value="Side top"]').show();
            $('#ticket_seat_type option[value="Side bottom"]').show();
            break;
        case 'SittingCarriage':
            $('#ticket_seat_type').val("Sitting")
            $('#ticket_seat_type option[value="Sitting"]').show();
            break;
    }
}