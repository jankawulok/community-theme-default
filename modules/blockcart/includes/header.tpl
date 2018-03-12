<a id="blockcart-header" href="{$link->getPageLink($order_process, true)|escape:'html':'UTF-8'}" title="{l s='View my shopping cart' mod='blockcart'}" rel="nofollow">
  <span class="ajax_cart_quantity"{if $cart_qties == 0} style="display: none;"{/if}>{$cart_qties}</span>

</a>
