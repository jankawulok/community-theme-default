/* global generated_date, baseDir, contentOnly, fieldRequired, freeProductTranslation, delete_txt,
 orderProcess, CUSTOMIZE_TEXTFIELD, customizationIdMessage, freeShippingTranslation, toBeDetermined */
$(function() {

  ajaxCart.overrideButtonsInThePage();

  var current_timestamp = parseInt(new Date().getTime() / 1000);

  if (typeof $('.ajax_cart_quantity').html() == 'undefined' || (typeof generated_date != 'undefined' && generated_date != null && (parseInt(generated_date) + 30) < current_timestamp))
    ajaxCart.refresh();

  /** Hover observers */
  var oBlockcartDropDown = new HoverWatcher('#blockcart-dropdown');
  var oBlockcart         = new HoverWatcher('#blockcart');
  var $cartDropDown      = $('#blockcart-dropdown');
  var $cartHeader        = $('#blockcart-header');
  var is_touch_enabled   = ('ontouchstart' in document.documentElement);

  var hoverCollapseTimeout = 200;


  $(document).on('click', '#layer_cart .cross, #layer_cart .continue, .layer_cart_overlay', function(e) {
    e.preventDefault();
    $('.layer_cart_overlay').hide();
    $('#layer_cart').fadeOut('fast');
  });

});

//JS Object : update the cart by ajax actions
var ajaxCart = {

  nb_total_products: 0,

  //override every button in the page in relation to the cart
  overrideButtonsInThePage: function() {
    //for every 'add' buttons...
    $(document).off('click', '.ajax_add_to_cart_button').on('click', '.ajax_add_to_cart_button', function(e) {
      e.preventDefault();
      var idProduct          = parseInt($(this).data('id-product'));
      var idProductAttribute = parseInt($(this).data('id-product-attribute'));
      var minimalQuantity    = parseInt($(this).data('minimal_quantity')) || 1;

      if ($(this).prop('disabled') != 'disabled')
        ajaxCart.add(idProduct, idProductAttribute, false, this, minimalQuantity);
    });
    //for product page 'add' button...
    if ($('.cart_block').length) {
      $(document).off('click', '#add_to_cart button').on('click', '#add_to_cart button', function(e) {
        e.preventDefault();
        ajaxCart.add($('#product_page_product_id').val(), $('#idCombination').val(), true, null, $('#quantity_wanted').val(), null);
      });
    }

    //for 'delete' buttons in the cart block...
    $(document).off('click', '.cart_block_list .ajax_cart_block_remove_link').on('click', '.cart_block_list .ajax_cart_block_remove_link', function(e) {
      e.preventDefault();
      // Customized product management
      var customizationId = 0;
      var productId = 0;
      var productAttributeId = 0;
      var customizableProductDiv = $($(this).parent().parent()).find('div[data-id^=deleteCustomizableProduct_]');
      var idAddressDelivery = false;

      if (customizableProductDiv && $(customizableProductDiv).length) {
        var ids = customizableProductDiv.data('id').split('_');
        if (typeof(ids[1]) != 'undefined') {
          customizationId = parseInt(ids[1]);
          productId = parseInt(ids[2]);
          if (typeof(ids[3]) != 'undefined')
            productAttributeId = parseInt(ids[3]);
          if (typeof(ids[4]) != 'undefined')
            idAddressDelivery = parseInt(ids[4]);
        }
      }

      // Common product management
      if (!customizationId) {
        //retrieve idProduct and idCombination from the displayed product in the block cart
        var firstCut = $(this).parent().parent().data('id').replace('cart_block_product_', '');
        firstCut = firstCut.replace('deleteCustomizableProduct_', '');
        ids = firstCut.split('_');
        productId = parseInt(ids[0]);

        if (typeof(ids[1]) != 'undefined')
          productAttributeId = parseInt(ids[1]);
        if (typeof(ids[2]) != 'undefined')
          idAddressDelivery = parseInt(ids[2]);
      }

      // Removing product from the cart
      ajaxCart.remove(productId, productAttributeId, customizationId, idAddressDelivery);
    });
  },

  // try to expand the cart
  expand: function() {
    // disabled
  },

  // try to collapse the cart
  collapse: function() {
    // disabled
  },
  // Fix display when using back and previous browsers buttons
  refresh: function() {
    $.ajax({
      type: 'POST',
      headers: {'cache-control': 'no-cache'},
      url: (typeof(baseUri) !== 'undefined') ? baseUri + '?rand=' + new Date().getTime() : '',
      async: true,
      cache: false,
      dataType: 'json',
      data: (typeof(static_token) !== 'undefined') ? 'controller=cart&ajax=true&token=' + static_token : '',
      success: function(jsonData) {
        ajaxCart.updateCart(jsonData);
      }
    });
  },

  // Update the cart information
  updateCartInformation: function(jsonData, addedFromProductPage) {
    ajaxCart.updateCart(jsonData);
    var $productPageBtn = $('#add_to_cart').find('button');
    // reactive the button when adding has finished
    if (addedFromProductPage) {
      $productPageBtn.removeProp('disabled').removeClass('disabled');
      $productPageBtn.toggleClass('added', !jsonData.hasError || jsonData.hasError == false);
    } else
      $('.ajax_add_to_cart_button').removeProp('disabled');
  },

  // close fancybox
  updateFancyBox: function() {},

  // add a product in the cart via ajax
  add: function(idProduct, idCombination, addedFromProductPage, callerElement, quantity, whishlist) {

    if (addedFromProductPage && !checkCustomizations()) {
      if (contentOnly) {
        window.parent.location.href = window.location.href.replace('content_only=1', '');
        return;
      }
      PrestaShop.showError(fieldRequired);
      return;
    }

    var $productPageBtn = $('#add_to_cart').find('button');

    //disabled the button when adding to not double add if user double click
    if (addedFromProductPage) {
      $productPageBtn.prop('disabled', 'disabled').addClass('disabled');
      $('.filled').removeClass('filled');
    } else
      $(callerElement).prop('disabled', 'disabled');

    //send the ajax request to the server

    $.ajax({
      type: 'POST',
      headers: {'cache-control': 'no-cache'},
      url: baseUri + '?rand=' + new Date().getTime(),
      async: true,
      cache: false,
      dataType: 'json',
      data: 'controller=cart&add=1&ajax=true&qty=' + ((quantity && quantity != null) ? quantity : '1') + '&id_product=' +
      idProduct + '&token=' + static_token + ((parseInt(idCombination) && idCombination != null) ? '&ipa=' +
      parseInt(idCombination) : '' + '&id_customization=' + ((typeof customizationId !== 'undefined') ? customizationId : 0)),

      /**
       * @param {{ errors, hasError, crossSelling, products }} jsonData
       */
      success: function(jsonData) {
        // add appliance to wishlist module
        if (whishlist && !jsonData.errors) {
          WishlistAddProductCart(whishlist[0], idProduct, idCombination, whishlist[1]);
        }

        if (!jsonData.hasError) {
          if (contentOnly) {
            window.parent.ajaxCart.updateCartInformation(jsonData, addedFromProductPage);
          } else {
            ajaxCart.updateCartInformation(jsonData, addedFromProductPage);
          }

          if (jsonData.crossSelling) {
            $('.crossseling').html(jsonData.crossSelling);
          }

          if (idCombination) {
            $(jsonData.products).each(function() {
              if (this.id != undefined && this.id == parseInt(idProduct) && this.idCombination == parseInt(idCombination)) {
                if (contentOnly) {
                  window.parent.ajaxCart.updateLayer(this);
                } else {
                  ajaxCart.updateLayer(this);
                }
              }
            });
          } else {
            $(jsonData.products).each(function() {
              if (this.id != undefined && this.id == parseInt(idProduct)) {
                if (contentOnly) {
                  window.parent.ajaxCart.updateLayer(this);
                } else {
                  ajaxCart.updateLayer(this);
                }
              }
            });
          }

          if (contentOnly) {
            parent.$.fancybox.close();
          }

        } else {
          if (contentOnly) {
            window.parent.ajaxCart.updateCart(jsonData);
          } else {
            ajaxCart.updateCart(jsonData);
          }

          if (addedFromProductPage) {
            $productPageBtn.removeProp('disabled').removeClass('disabled');
          } else {
            $(callerElement).removeProp('disabled');
          }
        }

        emptyCustomizations();

      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        PrestaShop.showError(
          'Impossible to add the product to the cart.<br/>textStatus: \'' + textStatus + '\'<br/>errorThrown: \'' +
          errorThrown + '\'<br/>responseText:<br/>' + XMLHttpRequest.responseText
        );
        // Reactivate the button when adding has finished
        if (addedFromProductPage) {
          $productPageBtn.removeProp('disabled').removeClass('disabled');
        } else {
          $(callerElement).removeProp('disabled');
        }
      }
    });
  },

  //remove a product from the cart via ajax
  remove: function(idProduct, idCombination, customizationId, idAddressDelivery) {
    //send the ajax request to the server
    $.ajax({
      type: 'POST',
      headers: {'cache-control': 'no-cache'},
      url: baseUri + '?rand=' + new Date().getTime(),
      async: true,
      cache: false,
      dataType: 'json',
      data: 'controller=cart&delete=1&id_product=' + idProduct + '&ipa=' + ((idCombination != null && parseInt(idCombination)) ? idCombination : '') +
      ((customizationId && customizationId != null) ? '&id_customization=' + customizationId : '') + '&id_address_delivery=' +
      idAddressDelivery + '&token=' + static_token + '&ajax=true',
      success: function(jsonData) {
        ajaxCart.updateCart(jsonData);
        var bodyId = $('body').attr('id');
        if (bodyId == 'order' || bodyId == 'order-opc') {
          deleteProductFromSummary(idProduct + '_' + idCombination + '_' + customizationId + '_' + idAddressDelivery);
        }
      },
      error: function() {
        PrestaShop.showError('ERROR: unable to delete the product');
      }
    });
  },

  //hide the products displayed in the page but no more in the json data
  hideOldProducts: function(jsonData) {
    //delete an eventually removed product of the displayed cart (only if cart is not empty!)
    if ($('.cart_block_list:first dl.products').length > 0) {
      var removedProductId = null;

      //look for a product to delete...
      $('.cart_block_list:first dl.products dt').each(function() {
        //retrieve idProduct and idCombination from the displayed product in the block cart
        var domIdProduct = $(this).data('id');
        var firstCut = domIdProduct.replace('cart_block_product_', '');
        var ids = firstCut.split('_');

        //try to know if the current product is still in the new list
        var stayInTheCart = false;
        for (var aProduct in jsonData.products) {
          if (jsonData.products.hasOwnProperty(aProduct)) {
            //we've called the variable aProduct because IE6 bug if this variable is called product
            //if product has attributes
            if (jsonData.products[aProduct]['id'] == ids[0] && (!ids[1] || jsonData.products[aProduct]['idCombination'] == ids[1])) {
              stayInTheCart = true;
              // update the product customization display (when the product is still in the cart)
              ajaxCart.hideOldProductCustomizations(jsonData.products[aProduct], domIdProduct);
            }
          }
        }
        //remove product if it's no more in the cart
        if (!stayInTheCart) {
          removedProductId = $(this).data('id');
          if (removedProductId != null) {
            firstCut = removedProductId.replace('cart_block_product_', '');
            ids = firstCut.split('_');

            $('dt[data-id="' + removedProductId + '"]').addClass('strike').fadeTo('slow', 0, function() {
              $(this).slideUp('slow', function() {
                $(this).remove();
                // If the cart is now empty, show the 'no product in the cart' message and close detail
                if ($('.cart_block:first dl.products dt').length == 0) {
                  $('.ajax_cart_quantity').html('0');
                  $('#header .cart_block').stop(true, true).slideUp();
                  $('.cart_block_no_products:hidden').slideDown();
                  $('.cart_block dl.products').remove();
                }
              });
            });

            $('dd[data-id="cart_block_combination_of_' + ids[0] + (ids[1] ? '_' + ids[1] : '') + (ids[2] ? '_' + ids[2] : '') + '"]').fadeTo('fast', 0, function() {
              $(this).slideUp('fast', function() {
                $(this).remove();
              });
            });
          }
        }
      });
    }
  },

  /**
   * @param {{ id, idCombination, hasCustomizedDatas, is_gift }} product
   * @param domIdProduct
   */
  hideOldProductCustomizations: function(product, domIdProduct) {
    var $customizationList = $('ul[data-id="customization_' + product['id'] + '_' + product['idCombination'] + '"]');
    if ($customizationList.length > 0) {
      $($customizationList).find('li').each(function() {
        $(this).find('.deleteCustomizableProduct').each(function() {
          var customizationDiv = $(this).data('id');
          var tmp = customizationDiv.replace('deleteCustomizableProduct_', '');
          var ids = tmp.split('_');
          if ((parseInt(product.idCombination) == parseInt(ids[2])) && !ajaxCart.doesCustomizationStillExist(product, ids[0])) {
            $('div[data-id="' + customizationDiv + '"]').parent().fadeTo('slow', 0, function() {
              $(this).slideUp().remove();
            });
          }
        });
      });
    }

    var $removeLinks = $('.deleteCustomizableProduct[data-id="' + domIdProduct + '"]').find('.ajax_cart_block_remove_link');

    // @TODO This is never called
    if (!product.hasCustomizedDatas && !$removeLinks.length) {
      $('div[data-id="' + domIdProduct + '"] span.remove_link').html('<a class="ajax_cart_block_remove_link" rel="nofollow" href="' +
        baseUri + '?controller=cart&amp;delete=1&amp;id_product=' + product['id'] + '&amp;ipa=' + product['idCombination'] +
        '&amp;token=' + static_token + '"><i class="icon icon-times"></i></a>');
    }

    // @TODO This is never called
    if (product.is_gift) {
      $('div[data-id="' + domIdProduct + '"] span.remove_link').html('');
    }
  },

  /**
   * @param {{ customizedDatas }} product
   * @param customizationId
   * @returns {boolean}
   */
  doesCustomizationStillExist: function(product, customizationId) {
    var exists = false;

    $(product.customizedDatas).each(function() {
      if (this.customizationId == customizationId) {
        exists = true;
        // This return does not mean that we found nothing but simply break the loop
        return false;
      }
    });
    return exists;
  },

  /**
   * Refresh display of vouchers (needed for vouchers in % of the total)
   *
   * @param {{ discounts }} jsonData
   */
  refreshVouchers: function(jsonData) {

    var $vouchers      = $('.vouchers');
    var $vouchersTbody = $vouchers.find('tbody');

    if (typeof(jsonData.discounts) == 'undefined' || jsonData.discounts.length == 0) {
      $vouchers.hide();
    } else {
      $vouchersTbody.html('');

      for (var i = 0; i < jsonData.discounts.length; i++) {
        /** @var {{ price_float, code, link, description, name, price, id }} discount */
        var discount = jsonData.discounts[i];

        if (parseFloat(discount.price_float) > 0) {
          var delete_link = '';
          if (discount.code.length) {
            delete_link = '<a class="delete_voucher" href="' + discount.link + '" title="' + delete_txt + '"><i class="icon icon-times"></i></a>';
          }

          $vouchersTbody.append($(
            '<tr class="bloc_cart_voucher" data-id="bloc_cart_voucher_' + discount.id + '">' + ' <td class="quantity">1 x</td>' + ' <td class="name" title="' +
            discount.description + '">' + discount.name + '</td>' + ' <td class="price">-' + discount.price + '</td>' +
            ' <td class="delete">' + delete_link + '</td>' + '</tr>'
          ));
        }
      }
      $vouchers.show();
    }
  },

  /**
   * Update product quantity
   *
   * @param {{ id, idCombination, idAddressDelivery }} product
   * @param quantity
   */
  updateProductQuantity: function(product, quantity) {
    $('dt[data-id=cart_block_product_' + product.id + '_' + (product.idCombination ? product.idCombination : '0') + '_' +
      (product.idAddressDelivery ? product.idAddressDelivery : '0') + '] .quantity').fadeTo('fast', 0, function() {
      $(this).text(quantity);
      $(this).fadeTo('fast', 1, function() {
        $(this).fadeTo('fast', 0, function() {
          $(this).fadeTo('fast', 1, function() {
            $(this).fadeTo('fast', 0, function() {
              $(this).fadeTo('fast', 1);
            });
          });
        });
      });
    });
  },

  updateLayer: function(product) {

    var $attributes = $('#layer_cart_product_attributes');

    $('#layer_cart_product_title').text(product.name);
    $attributes.text('');
    if (product.hasAttributes && product.hasAttributes == true) {
      $attributes.html(product.attributes);
    }

    $('#layer_cart_product_price').text(product.price);
    $('#layer_cart_product_quantity').text(product.quantity);
    $('.layer_cart_img').html('<img class="layer_cart_img img-fluid" src="' + product.image + '" alt="' + product.name + '" title="' + product.name + '" />');

    var n = parseInt($(window).scrollTop()) + 'px';

    $('.layer_cart_overlay').css({'width': '100%', 'height': '100%'}).show();
    $('#layer_cart').css({'top': n}).fadeIn('fast');
  },

  // General update of the cart display
  updateCart: function(jsonData) {
    //user errors display
    if (jsonData.hasError) {
      PrestaShop.showError(jsonData.errors);
    } else {
      ajaxCart.updateCartEverywhere(jsonData);
      ajaxCart.refreshVouchers(jsonData);
    }
  },

  /**
   * Update general cart information everywhere in the page
   *
   * @param {{ productTotal, shippingCostFloat, shippingCost, free_ship, isVirtualCart, taxCost, wrappingCost,
    *          total, total_price_wt, freeShipping, freeShippingFloat, nbTotalProducts }} cart
   */
  updateCartEverywhere: function(cart) {

    var $total           = $('.ajax_cart_total');
    var $shippingCost    = $('.ajax_cart_shipping_cost');
    var $shippingCostRow = $shippingCost.closest('.cart-prices-line');
    var $freeShipping    = $('.freeshipping');
    var $quantity        = $('.ajax_cart_quantity');
    var $productTxt      = $('.ajax_cart_product_txt');
    var $productTxtS     = $('.ajax_cart_product_txt_s');
    var $noProduct       = $('.ajax_cart_no_product');

    $total.text($.trim(cart.productTotal));

    if (typeof hasDeliveryAddress == 'undefined') {
      window.hasDeliveryAddress = false;
    }

    if (parseFloat(cart.shippingCostFloat) > 0) {
      $shippingCost.text(cart.shippingCost);
      $shippingCostRow.show();
    } else if ((hasDeliveryAddress || typeof(orderProcess) !== 'undefined' && orderProcess == 'order-opc') && typeof(freeShippingTranslation) != 'undefined') {
      $shippingCost.html(freeShippingTranslation);
    } else if ((typeof toBeDetermined !== 'undefined') && !hasDeliveryAddress) {
      $shippingCost.html(toBeDetermined);
    }

    if (!cart.shippingCostFloat && !cart.free_ship) {
      $shippingCostRow.hide();
    } else if (hasDeliveryAddress && !cart.isVirtualCart) {
      $shippingCostRow.show();
    }

    $('.ajax_cart_tax_cost').text(cart.taxCost);
    $('.ajax_block_wrapping_cost').text(cart.wrappingCost);
    $('.ajax_block_cart_total').text(cart.total);
    $('.ajax_block_products_total').text(cart.productTotal);
    $('.ajax_total_price_wt').text(cart.total_price_wt);

    if (parseFloat(cart.freeShippingFloat) > 0) {
      $('.ajax_cart_free_shipping').html(cart.freeShipping);
      $freeShipping.fadeIn(0);
    } else if (parseFloat(cart.freeShippingFloat) == 0) {
      $freeShipping.fadeOut(0);
    }

    this.nb_total_products = cart.nbTotalProducts;

    if (parseInt(cart.nbTotalProducts) > 0) {

      var multipleProducts = parseInt(cart.nbTotalProducts) > 1;

      $noProduct.hide();
      $quantity.text(cart.nbTotalProducts).fadeIn();
      $total.fadeIn();
      $productTxt.toggle(!multipleProducts);
      $productTxtS.toggle(multipleProducts);

    } else {
      $total.hide();
      $quantity.hide();
      $productTxt.hide();
      $productTxtS.hide();
      $noProduct.show();
    }
  }
};

function HoverWatcher(selector) {
  this.hovering = false;
  var self = this;

  this.isHoveringOver = function() {
    return self.hovering;
  };

  $(selector).on({
    mouseenter: function() {
      self.hovering = true;
    },
    mouseleave: function() {
      self.hovering = false;
    }
  });
}
