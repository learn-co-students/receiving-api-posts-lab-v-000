$(function() {
  $('form#new_product').on('submit', function(e) {
    e.preventDefault();
    var newProductData = $(this).serialize();

    $.post('/products', newProductData, function(resp) {
      $('#created-product .name').text(resp.name);
      $('#created-product .price').text(resp.price);
      $('#created-product .description').text(resp.description);
      $('#created-product .inventory').text(resp.inventory);
    });
  });
});
