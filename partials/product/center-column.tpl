<div class="table-responsive">
<table class="table table-sm">
  {if !empty($product->reference) || !$product->reference}
  <tr id="product_reference class="">
    <td>{l s='Reference:'}</td>
    <td class="editable" itemprop="sku">{$product->reference|escape:'html':'UTF-8'}</td>
  </tr>
  {/if}
  {if $product->id_manufacturer > 0}
  <tr>
    <td>{l s='Manufacturer:'}</td>
    <td>
      <a href="{$link->getManufacturerLink($product->id_manufacturer)}" title="{$product->manufacturer_name}">
        <span>{$product->manufacturer_name}</span>
      </a>
    </td>
  </tr>
  {/if}
  {if !empty($features)}
  {foreach from=$features item=feature}
  <tr class="{cycle values="odd,even"}">
    {if isset($feature.value)}
    <td>{$feature.name|escape:'html':'UTF-8'}:</td>
    <td>{$feature.value|escape:'html':'UTF-8'}</td>
    {/if}
  </tr>
  {/foreach}
  {/if}
</table>
</div>


{if !$product->is_virtual && $product->condition && $show_condition}
<p id="product_condition">
<b>{l s='Condition:'}</b>
{if $product->condition == 'new'}
<span class="editable">{l s='New product'}</span>
{elseif $product->condition == 'used'}
<span class="editable">{l s='Used'}</span>
{elseif $product->condition == 'refurbished'}
<span class="editable">{l s='Refurbished'}</span>
{/if}
</p>
{/if}

{if $product->description_short}
<div id="short_description_block">
<div id="short_description_content" class="rte" itemprop="description">{$product->description_short}</div>
</div>
{/if}

<p id="product-availability">
{if ($display_qties == 1 && !$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && $product->available_for_order)}
<span id="pQuantityAvailable"{if $product->quantity <= 0} style="display: none;"{/if}>
  <span id="quantityAvailable">{$product->quantity|intval}</span>
  <span {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='Item'}</span>
  <span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple">{l s='Items'}</span>
</span>
{/if}

<span id="availability_statut"{if !$PS_STOCK_MANAGEMENT || ($product->quantity <= 0 && !$product->available_later && $allow_oosp) || ($product->quantity > 0 && !$product->available_now) || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
  {*<span id="availability_label"><b>{l s='Availability:'}<b></span>*}
    <span id="availability_value" class="label{if $product->quantity <= 0 && !$allow_oosp} label-danger{elseif $product->quantity <= 0} label-warning{else} label-success{/if}">{if $product->quantity <= 0}{if $PS_STOCK_MANAGEMENT && $allow_oosp}{$product->available_later}{else}{l s='This product is no longer in stock'}{/if}{elseif $PS_STOCK_MANAGEMENT}{$product->available_now}{/if}</span>
  </span>

  {if $PS_STOCK_MANAGEMENT}
  <span class="label label-warning" id="last_quantities"{if ($product->quantity > $last_qties || $product->quantity <= 0) || $allow_oosp || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none"{/if} >{l s='Warning: Last items in stock!'}</span>
  {/if}
</p>

{if $PS_STOCK_MANAGEMENT}
{if !$product->is_virtual}{hook h="displayProductDeliveryTime" product=$product}{/if}
{/if}

<p id="availability_date"{if ($product->quantity > 0) || !$product->available_for_order || $PS_CATALOG_MODE || !isset($product->available_date) || $product->available_date < $smarty.now|date_format:'%Y-%m-%d'} style="display: none;"{/if}>
  <span id="availability_date_label"><b>{l s='Availability date:'}</b></span>
  <span id="availability_date_value">{if Validate::isDate($product->available_date)}{dateFormat date=$product->available_date full=false}{/if}</span>
</p>

<div id="oosHook"{if $product->quantity > 0} style="display: none;"{/if}>
  {$HOOK_PRODUCT_OOS}
</div>

{if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}

{if !$content_only}
<ul id="usefull_link_block" class="list-unstyled hidden-print">
  {if !empty($HOOK_EXTRA_LEFT)}{$HOOK_EXTRA_LEFT}{/if}
  <li>
    <a href="javascript:print();" title="{l s='Print this page'}">
      <i class="icon icon-fw icon-print"></i> {l s='Print'}
    </a>
  </li>
</ul>
{/if}