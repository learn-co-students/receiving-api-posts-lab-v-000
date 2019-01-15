$(function(){
    $('form#new_product').on('submit', function(e){
        e.preventDefault();
        var formData = $(this).serialize();
        var res = $.post('/products.json', formData);
        res.done(function(data){
            $('#name').text(data.name);
            $('#price').html(data.price);
            $('#description').html(data.description);
            $('#inventory').text(data.inventory)
        })
    })
})