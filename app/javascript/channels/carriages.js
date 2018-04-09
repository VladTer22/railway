$(document).on('turbolinks:load', function () {
    $('.seats').hide();
    show_carriage_attr($('#carriage_type').val());

    $('#carriage_type').on('change', function (e) {
        $(".seats input").val("");
        $('.seats').hide();
        show_carriage_attr(e.target.value);
    });

    function show_carriage_attr(type) {
        switch (type) {
            case 'CoupeCarriage':
                $('.top_seats').show();
                $('.bottom_seats').show();
                break;
            case 'SleepCarriage':
                $('.bottom_seats').show();
                break;
            case 'EconomyCarriage':
                $('.top_seats').show();
                $('.bottom_seats').show();
                $('.side_top_seats').show();
                $('.side_bottom_seats').show();
                break;
            case 'SittingCarriage':
                $('.sitting_seats').show();
                break;
        }
    };
});