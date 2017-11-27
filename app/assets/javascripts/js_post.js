function jsPost() {
  $("#new_product").submit(function(e) {
    e.preventDefault();
    var content = $(this).serialize();
    var posting = $.post('/products', content);

    posting.done(function(data) {
      var product = data['product'];
      $('#productName').text(product['name']);
      $('#productPrice').text(product['price']);
      $('#productDescription').text(product['description']);
      $('#productInventory').text(product['inventory']);
      console.log(data);
    });
  });
}