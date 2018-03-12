<div id="image-block" class="thumbnail">

  <div class="product-label-container">
    {if $product->online_only}
    <span class="product-label product-label-online">{l s='Online only'}</span>
    {/if}
    {if $product->new}
    <span class="product-label product-label-new">{l s='New'}</span>
    {/if}
    {if $product->on_sale}
    <span class="product-label product-label-sale">{l s='Sale!'}</span>
    {elseif $product->specificPrice && $product->specificPrice.reduction && $productPriceWithoutReduction > $productPrice}
    <span class="product-label product-label-discount">{l s='Reduced price!'}</span>
    {/if}
  </div>

  {if $have_image}
  <span id="view_full_size">
    <img id="bigpic" class="img-fluid center-block lozad" itemprop="image"  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=" data-src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" width="{$largeSize.width}" height="{$largeSize.height}"/>
    {if !$jqZoomEnabled && !$content_only}
    <span class="span_link" title="{l s='Zoom in'}">
      <i class="fas fa-search-plus"></i>
    </span>
    {/if}
  </span>
  {else}
  <span id="view_full_size">
    <img id="bigpic" class="img-fluid center-block lozad" itemprop="image"  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=" data-src="{$img_prod_dir}{$lang_iso}-default-large_default.jpg" title="{$product->name|escape:'html':'UTF-8'}" width="{$largeSize.width}" height="{$largeSize.height}"/>
  </span>
  {/if}
</div>

{if !empty($images)}
<div id="views_block" class="clearfix {if isset($images) && count($images) < 2}hidden{/if}">
  <div id="thumbs_list">
    <ul id="thumbs_list_frame" class="list-unstyled row d-flex justify-content-around">
      {if isset($images)}
      {foreach from=$images item=image name=thumbnails}

      {assign var=imageIds value="`$product->id`-`$image.id_image`"}
      {if !empty($image.legend)}
      {assign var=imageTitle value=$image.legend|escape:'html':'UTF-8'}
      {else}
      {assign var=imageTitle value=$product->name|escape:'html':'UTF-8'}
      {/if}

      <li data-slide-num="{$smarty.foreach.thumbnails.iteration|intval}" id="thumbnail_{$image.id_image}" class="">
        {if $jqZoomEnabled && $have_image && !$content_only}
        <a href="{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}" class="thumbnail {if $image.id_image == $cover.id_image} shown{/if}" title="{$imageTitle}">
          <img class="img-fluid lozad" id="thumb_{$image.id_image}"  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=" data-src="{$link->getImageLink($product->link_rewrite, $imageIds, 'cart_default')|escape:'html':'UTF-8'}" alt="{$imageTitle}" title="{$imageTitle}"{if isset($cartSize)} height="{$cartSize.height}" width="{$cartSize.width}"{/if} itemprop="image" />
        </a>
        {else}
        <a href="{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}" data-fancybox="other-views" class="thumbnail fancybox{if $image.id_image == $cover.id_image} shown{/if}" title="{$imageTitle}">
          <img class="img-fluid lozad" id="thumb_{$image.id_image}"  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=" data-src="{$link->getImageLink($product->link_rewrite, $imageIds, 'cart_default')|escape:'html':'UTF-8'}" alt="{$imageTitle}" title="{$imageTitle}"{if isset($cartSize)} height="{$cartSize.height}" width="{$cartSize.width}"{/if} itemprop="image" />
        </a>
        {/if}
      </li>
      {/foreach}
      {/if}
    </ul>
  </div>
</div>
{/if}