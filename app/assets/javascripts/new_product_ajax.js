$(function() {
  $('form').submit(function(e) {
    e.preventDefault();

    var values = $(this).serialize();
    var posting = $.post("/products", values);

    posting.done(function(data) {
      var product = data;
      $('#productName').text(product["name"]);
      $('#productPrice').text('$' + product["price"]);
      $('#productInventory').text(product["inventory"]);
      $('#productDescription').text(product["description"]);
      debugger;
    });
  });
});