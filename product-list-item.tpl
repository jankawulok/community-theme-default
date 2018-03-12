<article  class="product-card">
  <div class="product-image">
    <img class="replace-2x lozad" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=" data-src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" data-srcset="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default_smallest')|escape:'html':'UTF-8'} 211w, {$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default_smaller')|escape:'html':'UTF-8'} 218w, {$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'} 250w" sizes="(min-width: 1200px) 250px, (min-width: 992px) 218px, (min-width: 768px) 211px, 250px" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" />
  </div>
  <div class="product-info">
    {capture name='displayProductListReviews'}{hook h='displayProductListReviews' product=$product}{/capture}
    {if $smarty.capture.displayProductListReviews}
      <div class="hook-reviews">
          {hook h='displayProductListReviews' product=$product}
      </div>
    {/if}
    {if isset($product.color_list)}
                <div class="color-list-container">{$product.color_list}</div>
            {/if}
    <h5 class="product-info__name">
      {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
      <a class="product-name" href="{$product.link|escape:'html':'UTF-8'}"
         title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
          {$product.name|escape:'html':'UTF-8'}
      </a>
    </h5>

    <h6>
      {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
            <div class="">
                {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                    {hook h="displayProductPriceBlock" product=$product type='before_price'}
                    <span class="price product-price">
      {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
    </span>
                    {if $product.price_without_reduction > 0 && isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
                        {hook h="displayProductPriceBlock" product=$product type="old_price"}
                        <span class="old-price product-price">
        {displayWtPrice p=$product.price_without_reduction}
      </span>
                        {hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
                        {if $product.specific_prices.reduction_type == 'percentage'}
                            <span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}
                                %</span>
                        {/if}
                    {/if}
                    {hook h="displayProductPriceBlock" product=$product type="price"}
                    {hook h="displayProductPriceBlock" product=$product type="unit_price"}
                    {hook h="displayProductPriceBlock" product=$product type='after_price'}
                {/if}
            </div>
        {/if}
    </h6>

  </div>
</article>