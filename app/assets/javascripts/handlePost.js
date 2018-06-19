$(function () {
    $('form').submit(function (e) { 
        e.preventDefault();
        const values = $(this).serialize();
        const postResp = $.post('/products', values);

        postResp.done(function (respData) {
            console.log('respData :', respData);
            $('.name').html(respData.name);
            $('.description').html(respData.description);
            $('.inventory').html(respData.inventory);
            $('.price').html(respData.price);
        });
     });
});