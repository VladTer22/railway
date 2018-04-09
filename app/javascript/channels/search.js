$(document).ready(function (){
    $('.search_form').submit(function (){
        let start = $('.start');
        let end = $('.end');

        if(start.val() === end.val())
        {
            alert('Starting station cannot be the same as end station');
            return false;
        }
        else
        {
            return true;
        }
    })
})