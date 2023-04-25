$(".form")
  .find("input, textarea")
  .on("keyup blur focus", function (e) {
    var $this = $(this),
      label = $this.prev("label");

    if (e.type === "keyup") {
      if ($this.val() === "") {
        label.removeClass("active highlight");
      } else {
        label.addClass("active highlight");
      }
    } else if (e.type === "blur") {
      if ($this.val() === "") {
        label.removeClass("active highlight");
      } else {
        label.removeClass("highlight");
      }
    } else if (e.type === "focus") {
      if ($this.val() === "") {
        label.removeClass("highlight");
      } else if ($this.val() !== "") {
        label.addClass("highlight");
      }
    }
  });

$(".tab a").on("click", function (e) {
  e.preventDefault();

  $(this).parent().addClass("active");
  $(this).parent().siblings().removeClass("active");

  target = $(this).attr("href");

  $(".tab-content > div").not(target).hide();

  $(target).fadeIn(600);
});
var taxRate = 0.05;
var shippingRate = 15.0;
var fadeTime = 300;

$(document).ready(function () {
  recalculateCart();
});

//On click Plus button

$(document).ready(function () {
  $(".cart-qty-plus").click(function () {
    var $n = $(this)
      .parent(".button-container")
      .parent(".product-quantity")
      .find(".qty");

    $n.val(Number($n.val()) + 1);

    updateQuantity(this);
  });
});

// On click minus button

$(document).ready(function () {
  $(".cart-qty-minus").click(function () {
    var $n = $(this)
      .parent(".button-container")
      .parent(".product-quantity")
      .find(".qty");

    var amount = Number($n.val());
    if (amount > 1) {
      $n.val(amount - 1);

      updateQuantity(this);
    }
  });
});

// If the removed button is clicked

$(".product-removal button").click(function () {
  removeItem(this);
});

/* Recalculate cart */

function recalculateCart() {
  var subtotal = 0;

  /* Sum up row totals */

  $(".product").each(function () {
    subtotal += parseFloat($(this).children(".product-line-price").text());
  });

  /* Calculate totals */

  var tax = subtotal * taxRate;
  var shipping = subtotal < 300 ? shippingRate : 0;
  var total = subtotal;

  /* Update totals display */
  $(".totals-value").fadeOut(fadeTime, function () {
    $("#cart-subtotal").html(subtotal.toFixed(2));
    $("#cart-total").html(total.toFixed(2));
    if (total == 0) {
      $(".checkout").fadeOut(fadeTime);
    } else {
      $(".checkout").fadeIn(fadeTime);
    }
    $(".totals-value").fadeIn(fadeTime);
  });
}

/* Update quantity */

function updateQuantity(quantityInput) {
  /* Calculate line price */

  var productRow = $(quantityInput).parent().parent().parent();
  var price = parseFloat(productRow.children(".product-price").text());

  var quantity = productRow.find(".qty").val();
  var linePrice = price * quantity;

  /* Update line price display and recalc cart totals */

  productRow.children(".product-line-price").each(function () {
    $(this).fadeOut(fadeTime, function () {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });
}

/* Remove item from cart */
function removeItem(removeButton) {
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function () {
    productRow.remove();
    recalculateCart();
  });
}
