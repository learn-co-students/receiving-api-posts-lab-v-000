$(function () {
  $("form").submit(function (e) {
    e.preventDefault()
    // alert("Ha!")
    var info = $(this).serialize()
    var posting = $.post("/products", info)
    posting.done(function (data) {
      $(".productName").text(data["name"])
      $(".productDescription").text("Description: " + data["description"])
      $(".productPrice").text("Price: " + data["price"])
      $(".productInventory").text("Inventory: " + data["inventory"])

    })

    console.log(info)
  })
})
