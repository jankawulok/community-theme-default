{if ($product->show_price && !isset($restricted_country_mode)) || isset($groups) || $product->reference || (isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS)}

<form id="buy_block"{if $PS_CATALOG_MODE && !isset($groups) && $product->quantity > 0} class="hidden"{/if} action="{$link->getPageLink('cart')|escape:'html':'UTF-8'}" method="post">

  <input type="hidden" name="token" value="{$static_token}" />
  <input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
  <input type="hidden" name="add" value="1" />
  <input type="hidden" name="id_product_attribute" id="idCombination" value="" />

  <div class="box-info-product">
    <div class="box-info-product__top">
      <div class="content_prices clearfix">
        {if $product->show_price && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
        <div>
          <p class="our_price_display">{strip}
            {if $priceDisplay >= 0 && $priceDisplay <= 2}
            <span id="our_price_display" class="price" itemprop="price" content="{$productPrice}">{convertPrice price=$productPrice|floatval}</span>
            {if $tax_enabled  && ((isset($display_tax_label) && $display_tax_label == 1) || !isset($display_tax_label))}
            {if $priceDisplay == 1} {l s='tax excl.'}{else} {l s='tax incl.'}{/if}
            {/if}
            {hook h="displayProductPriceBlock" product=$product type="price"}
            {/if}
          {/strip}</p>
          <p id="reduction_percent" {if $productPriceWithoutReduction <= 0 || !$product->specificPrice || $product->specificPrice.reduction_type != 'percentage'} style="display:none;"{/if}>{strip}
            <span id="reduction_percent_display">
              {if $product->specificPrice && $product->specificPrice.reduction_type == 'percentage'}-{$product->specificPrice.reduction*100}%{/if}
            </span>
          {/strip}</p>
          <p id="reduction_amount" {if $productPriceWithoutReduction <= 0 || !$product->specificPrice || $product->specificPrice.reduction_type != 'amount' || $product->specificPrice.reduction|floatval ==0} style="display:none"{/if}>{strip}
            <span id="reduction_amount_display">
              {if $product->specificPrice && $product->specificPrice.reduction_type == 'amount' && $product->specificPrice.reduction|floatval !=0}
              -{convertPrice price=$productPriceWithoutReduction|floatval-$productPrice|floatval}
              {/if}
            </span>
          {/strip}</p>
          <p id="old_price"{if (!$product->specificPrice || !$product->specificPrice.reduction)} class="hidden"{/if}>{strip}
            {if $priceDisplay >= 0 && $priceDisplay <= 2}
            {hook h="displayProductPriceBlock" product=$product type="old_price"}
            <span id="old_price_display"><span class="price">{if $productPriceWithoutReduction > $productPrice}{convertPrice price=$productPriceWithoutReduction|floatval}{/if}</span>{if $productPriceWithoutReduction > $productPrice && $tax_enabled && $display_tax_label == 1} {if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}{/if}</span>
            {/if}
          {/strip}</p>
          {if $priceDisplay == 2}
          <br />
          <span id="pretaxe_price">{strip}
            <span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, $smarty.const.NULL)}</span> {l s='tax excl.'}
          {/strip}</span>
          {/if}
        </div>
        {if $packItems|@count && $productPrice < $product->getNoPackPrice()}
        <p class="pack_price">{l s='Instead of'} <span style="text-decoration: line-through;">{convertPrice price=$product->getNoPackPrice()}</span></p>
        {/if}
        {if $product->ecotax != 0}
        <p class="price-ecotax">{l s='Including'} <span id="ecotax_price_display">{if $priceDisplay == 2}{$ecotax_tax_exc|convertAndFormatPrice}{else}{$ecotax_tax_inc|convertAndFormatPrice}{/if}</span> {l s='for ecotax'}
          {if $product->specificPrice && $product->specificPrice.reduction}
          <br />{l s='(not impacted by the discount)'}
          {/if}
        </p>
        {/if}
        {if !empty($product->unity) && $product->unit_price_ratio > 0.000000}
        {math equation="pprice / punit_price" pprice=$productPrice  punit_price=$product->unit_price_ratio assign=unit_price}
        <p class="unit-price"><span id="unit_price_display">{convertPrice price=$unit_price}</span> {l s='per'} {$product->unity|escape:'html':'UTF-8'}</p>
        {hook h="displayProductPriceBlock" product=$product type="unit_price"}
        {/if}
        {/if} {*close if for show price*}
        {hook h="displayProductPriceBlock" product=$product type="weight" hook_origin='product_sheet'}
        {hook h="displayProductPriceBlock" product=$product type="after_price"}
      </div>

      <div class="product_attributes clearfix">

        {if !$PS_CATALOG_MODE}
        <div id="quantity_wanted_p"{if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
          <label for="quantity_wanted">{l s='Quantity'}</label>
          <div class="input-group">
            <div class="input-group-btn">
              <a href="#" data-field-qty="qty" class="btn btn-default button-minus product_quantity_down" title="Decrease" aria-label="Decrease">
                <i class="fas fa-minus"></i>
              </a>
            </div>
            <input type="number" min="1" name="qty" id="quantity_wanted" class="text text-center form-control" value="{if isset($quantityBackup)}{$quantityBackup|intval}{else}{if $product->minimal_quantity > 1}{$product->minimal_quantity}{else}1{/if}{/if}" />
            <div class="input-group-btn">
              <a href="#" data-field-qty="qty" class="btn btn-default button-plus product_quantity_up" title="Increase" aria-label="Increase">
                <i class="fas fa-plus"></i>
              </a>
            </div>
          </div>
        </div>
        {/if}

        <p id="minimal_quantity_wanted_p"{if $product->minimal_quantity <= 1 || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
          {l s='The minimum purchase order quantity for the product is'} <b id="minimal_quantity_label">{$product->minimal_quantity}</b>
        </p>

        {if isset($groups)}
        <div id="attributes">
          {foreach from=$groups key=id_attribute_group item=group}
          {if !empty($group.attributes)}
          <fieldset class="attribute_fieldset form-group">
            <label class="attribute_label" {if $group.group_type != 'color' && $group.group_type != 'radio'}for="group_{$id_attribute_group|intval}"{/if}>{$group.name|escape:'html':'UTF-8'}&nbsp;</label>
            {assign var="groupName" value="group_$id_attribute_group"}
            <div class="attribute_list">
              {if ($group.group_type == 'select')}
              <select name="{$groupName}" id="group_{$id_attribute_group|intval}" class="form-control attribute_select no-print">
                {foreach from=$group.attributes key=id_attribute item=group_attribute}
                <option value="{$id_attribute|intval}"{if (isset($smarty.get.$groupName) && $smarty.get.$groupName|intval == $id_attribute) || $group.default == $id_attribute} selected="selected"{/if} title="{$group_attribute|escape:'html':'UTF-8'}">{$group_attribute|escape:'html':'UTF-8'}</option>
                {/foreach}
              </select>
              {elseif ($group.group_type == 'color')}
              <ul id="color_to_pick_list">
                {assign var="default_colorpicker" value=""}
                {foreach from=$group.attributes key=id_attribute item=group_attribute}
                {assign var='img_color_exists' value=file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}
                <li{if $group.default == $id_attribute} class="selected"{/if}>
                <a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" id="color_{$id_attribute|intval}" name="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" class="color_pick{if ($group.default == $id_attribute)} selected{/if}"{if !$img_color_exists && isset($colors.$id_attribute.value) && $colors.$id_attribute.value} style="background:{$colors.$id_attribute.value|escape:'html':'UTF-8'};"{/if} title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}">
                  {if $img_color_exists}
                  <img class="lozad"  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=" data-src="{$img_col_dir}{$id_attribute|intval}.jpg" alt="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" width="20" height="20" />
                  {/if}
                </a>
              </li>
              {if ($group.default == $id_attribute)}
              {$default_colorpicker = $id_attribute}
              {/if}
              {/foreach}
            </ul>
            <input type="hidden" class="color_pick_hidden" name="{$groupName|escape:'html':'UTF-8'}" value="{$default_colorpicker|intval}" />
            {elseif ($group.group_type == 'radio')}
            <ul>
              {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li>
                <input type="radio" class="attribute_radio" name="{$groupName|escape:'html':'UTF-8'}" value="{$id_attribute}" {if ($group.default == $id_attribute)} checked="checked"{/if} />
                <span>{$group_attribute|escape:'html':'UTF-8'}</span>
              </li>
              {/foreach}
            </ul>
            {/if}
          </div>
        </fieldset>
        {/if}
        {/foreach}
      </div>
      {/if}
    </div>
  </div>


  <div class="box-cart-bottom">
    <div{if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || (isset($restricted_country_mode) && $restricted_country_mode) || $PS_CATALOG_MODE} class="unvisible"{/if}>
    <span id="add_to_cart" class="buttons_bottom_block no-print">
      <button type="submit" name="Submit" class="btn btn-block btn-lg btn-success btn-add-to-cart">
        <i class="icon"></i>
        <span>{if $content_only && (isset($product->customization_required) && $product->customization_required)}{l s='Customize'}{else}{l s='Add to cart'}{/if}</span>
      </button>
    </span>
  </div>
</div>
{if isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS}{$HOOK_PRODUCT_ACTIONS}{/if}

</div>
</form>
{/if}