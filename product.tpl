{include file="$tpl_dir./errors.tpl"}

{if empty($errors)}

{if !isset($priceDisplayPrecision)}
{assign var='priceDisplayPrecision' value=2}
{/if}
{if !$priceDisplay || $priceDisplay == 2}
{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, 6)}
{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
{elseif $priceDisplay == 1}
{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, 6)}
{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
{/if}

<div class="primary_block  d-flex flex-row">

  {if isset($adminActionDisplay) && $adminActionDisplay}
  <div id="admin-action" class="container">
    <div class="alert alert-info">{l s='This product is not visible to your customers.'}
      <input type="hidden" id="admin-action-product-id" value="{$product->id}" />
      <a id="publish_button" class="btn btn-success" href="#">{l s='Publish'}</a>
      <a id="lnk_view" class="btn btn-warning" href="#">{l s='Back'}</a>
    </div>
    <p id="admin-action-result"></p>
  </div>
  {/if}

  {if !empty($confirmation)}
  <div class="alert alert-warning">{$confirmation}</div>
  {/if}

  <div class="">
    {include file="$tpl_dir./partials/product/images-block.tpl"}
  </div>
  <div class="d-flex flex-column">
    <div class="">
      <div class="product-title d-flex flex-md-row flex-sm-column flex-row justify-content-between">
        <h1 class="h2" >{$product->name|escape:'html':'UTF-8'}</h1>
        {if (!$content_only && (($nbComments == 0 && $too_early == false && ($is_logged || $allow_guests)) || ($nbComments != 0)))}
          <div class="star_content">
            {section name="i" start=0 loop=5 step=1}
              {if $averageTotal <= $smarty.section.i.index}
                {* <div class="star"></div> *}
              {else}
                <div class="star star_on"></div>
              {/if}
            {/section}
          </div>
        {/if}
      </div>
    </div>
    <div class="d-flex flex-row">
      <div class="pb-center-column col-md-6">
        {include file="$tpl_dir./partials/product/center-column.tpl"}
      </div>

      <div class="pb-right-column col-md-6">
        {include file="$tpl_dir./partials/product/right-column.tpl"}
        {hook h='displayPaymentRequestButton'}test
      </div>
    </div>
    
  </div>
</div>



{if !$content_only}
{if !empty($quantity_discounts)}
<section id="product-volume-discounts" class="page-product-box">
  <h3 class="page-product-heading">{l s='Volume discounts'}</h3>
  <div id="quantityDiscount" class="table-responsive">
    <table class="table-product-discounts table table-condensed table-bordered table-hover">
      <thead>
        <tr>
          <th>{l s='Quantity'}</th>
          <th>{if $display_discount_price}{l s='Price'}{else}{l s='Discount'}{/if}</th>
          <th>{l s='You Save'}</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
        {if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
        {$realDiscountPrice=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
        {else}
        {$realDiscountPrice=$productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
        {/if}
        <tr id="quantityDiscount_{$quantity_discount.id_product_attribute}" class="quantityDiscount_{$quantity_discount.id_product_attribute}" data-real-discount-value="{convertPrice price = $realDiscountPrice}" data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value|floatval}" data-discount-quantity="{$quantity_discount.quantity|intval}">
          <td>
            {$quantity_discount.quantity|intval}
          </td>
          <td>
            {if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
            {if $display_discount_price}
            {if $quantity_discount.reduction_tax == 0 && !$quantity_discount.price}
            {convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction_with_tax)|floatval}
            {else}
            {convertPrice price=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
            {/if}
            {else}
            {convertPrice price=$quantity_discount.real_value|floatval}
            {/if}
            {else}
            {if $display_discount_price}
            {if $quantity_discount.reduction_tax == 0}
            {convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction_with_tax)|floatval}
            {else}
            {convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
            {/if}
            {else}
            {$quantity_discount.real_value|floatval}%
            {/if}
            {/if}
          </td>
          <td>
            <span>{l s='Up to'}</span>
            {if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
            {$discountPrice=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
            {else}
            {$discountPrice=$productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
            {/if}
            {$discountPrice=$discountPrice * $quantity_discount.quantity}
            {$qtyProductPrice=$productPriceWithoutReduction|floatval * $quantity_discount.quantity}
            {convertPrice price=$qtyProductPrice - $discountPrice}
          </td>
        </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
</section>
{/if}



{if isset($product) && $product->description}
<section id="product-description" class="page-product-box">
  <h3 class="page-product-heading">{l s='More info'}</h3>
  <div  class="rte">{$product->description}</div>
</section>
{/if}

{if isset($packItems) && $packItems|@count > 0}
<section id="blockpack" class="page-product-box">
  <h3 class="page-product-heading">{l s='Pack content'}</h3>
  {include file="$tpl_dir./product-list.tpl" products=$packItems}
</section>
{/if}

{if !empty($HOOK_PRODUCT_TAB_CONTENT) || !empty({$HOOK_PRODUCT_TAB})}
<section id="product-hook-tab" class="page-product-box">
  {if !empty($HOOK_PRODUCT_TAB)}{$HOOK_PRODUCT_TAB}{/if}
  {if !empty($HOOK_PRODUCT_TAB_CONTENT)}{$HOOK_PRODUCT_TAB_CONTENT}{/if}
</section>
{/if}

{if !empty($accessories)}
<section id="product-accessories" class="page-product-box">
  <h3 class="page-product-heading">{l s='Accessories'}</h3>
  <div class="accessories-block">
    {include file="$tpl_dir./product-list.tpl" products=$accessories}
  </div>
</section>
{/if}

{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if}

{if (isset($product) && $product->description) || (isset($features) && $features) || (isset($accessories) && $accessories) || (isset($HOOK_PRODUCT_TAB) && $HOOK_PRODUCT_TAB) || (isset($attachments) && $attachments) || isset($product) && $product->customizable}
{if isset($attachments) && $attachments}
<section id="product-attachments" class="page-product-box">
  <h3 class="page-product-heading">{l s='Download'}</h3>
  <div class="row">
    {foreach from=$attachments item=attachment}
    <div class="col-xs-12 col-sm-4 col-lg-3">
      <div class="card">
        <div class="card-header">
          <a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">
            {$attachment.name|escape:'html':'UTF-8'}
          </a>
        </div>
        <div class="card-body">
          {if !empty($attachment.description)}
          <p class="text-muted">{$attachment.description|escape:'html':'UTF-8'}</p>
          {/if}
          <a class="btn btn-default btn-block" href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">
            <i class="icon icon-download"></i> {l s="Download"} ({Tools::formatBytes($attachment.file_size, 2)})
          </a>
        </div>
      </div>
    </div>
    {/foreach}
  </div>
</section>
{/if}

{if isset($product) && $product->customizable}
<section id="product-customization" class="page-product-box">
  <h3 class="page-product-heading">{l s='Product customization'}</h3>
  <form method="post" action="{$customizationFormTarget}" enctype="multipart/form-data" id="customizationForm" class="clearfix">
    <p class="infoCustomizable">
      {l s='After saving your customized product, remember to add it to your cart.'}
      {if $product->uploadable_files}
      <br> {l s='Allowed file formats are: GIF, JPG, PNG'}
      {/if}
    </p>

    {if $product->uploadable_files|intval}
    <div class="customizableProductsFile">
      <h3>{l s='Pictures'}</h3>
      <ul id="uploadable_files" class="list-unstyled clearfix">
        {counter start=0 assign='customizationField'}
        {foreach from=$customizationFields item='field' name='customizationFields'}
        {if $field.type == 0}
        <li class="customizationUploadLine form-group{if $field.required} required{/if}">{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
          {if isset($pictures.$key)}
          <div class="customizationUploadBrowse">
            <img class="lozad"  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII=" data-src="{$pic_dir}{$pictures.$key}_small" alt="" />
            <a href="{$link->getProductDeletePictureLink($product, $field.id_customization_field)|escape:'html':'UTF-8'}" title="{l s='Delete'}" >
              <img src="{$img_dir}icon/delete.gif" alt="{l s='Delete'}" class="customization_delete_icon" width="11" height="13" />
            </a>
          </div>
          {/if}
          <div class="customizationUploadBrowse form-group">
            <label class="customizationUploadBrowseDescription">
              {if !empty($field.name)}
              {$field.name}
              {else}
              {l s='Please select an image file from your computer'}
              {/if}
              {if $field.required}<sup>*</sup>{/if}
            </label>
            <input type="file" name="file{$field.id_customization_field}" id="img{$customizationField}" class="form-control customization_block_input {if isset($pictures.$key)}filled{/if}" />
          </div>
        </li>
        {counter}
        {/if}
        {/foreach}
      </ul>
    </div>
    {/if}

    {if $product->text_fields|intval}
    <div class="customizableProductsText">
      <h3>{l s='Text'}</h3>
      <ul id="text_fields" class="list-unstyled">
        {counter start=0 assign='customizationField'}
        {foreach from=$customizationFields item='field' name='customizationFields'}
        {if $field.type == 1}
        <li class="customizationUploadLine form-group{if $field.required} required{/if}">
          <label for ="textField{$customizationField}">
            {assign var='key' value='textFields_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
            {if !empty($field.name)}
            {$field.name}
            {/if}
            {if $field.required}<sup>*</sup>{/if}
          </label>
          <textarea name="textField{$field.id_customization_field}" class="form-control customization_block_input" id="textField{$customizationField}" rows="3" cols="20">{strip}
            {if isset($textFields.$key)}
            {$textFields.$key|stripslashes}
            {/if}
          {/strip}</textarea>
        </li>
        {counter}
        {/if}
        {/foreach}
      </ul>
    </div>
    {/if}
    <div id="customizedDatas" class="form-group">
      <input type="hidden" name="quantityBackup" id="quantityBackup" value="" />
      <input type="hidden" name="submitCustomizedDatas" value="1" />
      <button class="btn btn-lg btn-success" name="saveCustomization">
        <span>{l s='Save'}</span>
      </button>
      <span id="ajax-loader" class="unvisible">
       <img src="{$img_ps_dir}loader.gif" alt="loader" />
     </span>
   </div>
 </form>
 <div class="form-group">
  <div class="help-block">
    <sup>*</sup> {l s='required fields'}
  </div>
</div>
</section>
{/if}

{/if}
{/if}
</div>

{strip}
{if isset($smarty.get.ad) && $smarty.get.ad}
{addJsDefL name=ad}{$base_dir|cat:$smarty.get.ad|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{if isset($smarty.get.adtoken) && $smarty.get.adtoken}
{addJsDefL name=adtoken}{$smarty.get.adtoken|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{addJsDef allowBuyWhenOutOfStock=$allow_oosp|boolval}
{addJsDef availableNowValue=$product->available_now|escape:'quotes':'UTF-8'}
{addJsDef availableLaterValue=$product->available_later|escape:'quotes':'UTF-8'}
{addJsDef attribute_anchor_separator=$attribute_anchor_separator|escape:'quotes':'UTF-8'}
{addJsDef attributesCombinations=$attributesCombinations}
{addJsDef currentDate=$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}
{if isset($combinations) && $combinations}
{addJsDef combinations=$combinations}
{addJsDef combinationsFromController=$combinations}
{addJsDef displayDiscountPrice=$display_discount_price}
{addJsDefL name='upToTxt'}{l s='Up to' js=1}{/addJsDefL}
{/if}
{if isset($combinationImages) && $combinationImages}
{addJsDef combinationImages=$combinationImages}
{/if}
{addJsDef customizationId=$id_customization}
{addJsDef customizationFields=$customizationFields}
{addJsDef default_eco_tax=$product->ecotax|floatval}
{addJsDef displayPrice=$priceDisplay|intval}
{addJsDef ecotaxTax_rate=$ecotaxTax_rate|floatval}
{if isset($cover.id_image_only)}
{addJsDef idDefaultImage=$cover.id_image_only|intval}
{else}
{addJsDef idDefaultImage=0}
{/if}
{addJsDef img_ps_dir=$img_ps_dir}
{addJsDef img_prod_dir=$img_prod_dir}
{addJsDef id_product=$product->id|intval}
{addJsDef jqZoomEnabled=$jqZoomEnabled|boolval}
{addJsDef maxQuantityToAllowDisplayOfLastQuantityMessage=$last_qties|intval}
{addJsDef minimalQuantity=$product->minimal_quantity|intval}
{addJsDef noTaxForThisProduct=$no_tax|boolval}
{if isset($customer_group_without_tax)}
{addJsDef customerGroupWithoutTax=$customer_group_without_tax|boolval}
{else}
{addJsDef customerGroupWithoutTax=false}
{/if}
{if isset($group_reduction)}
{addJsDef groupReduction=$group_reduction|floatval}
{else}
{addJsDef groupReduction=false}
{/if}
{addJsDef oosHookJsCodeFunctions=Array()}
{addJsDef productHasAttributes=isset($groups)|boolval}
{addJsDef productPriceTaxExcluded=($product->getPriceWithoutReduct(true)|default:'null' - $product->ecotax)|floatval}
{addJsDef productPriceTaxIncluded=($product->getPriceWithoutReduct(false)|default:'null' - $product->ecotax * (1 + $ecotaxTax_rate / 100))|floatval}
{addJsDef productBasePriceTaxExcluded=($product->getPrice(false, null, 6, null, false, false) - $product->ecotax)|floatval}
{addJsDef productBasePriceTaxExcl=($product->getPrice(false, null, 6, null, false, false)|floatval)}
{addJsDef productBasePriceTaxIncl=($product->getPrice(true, null, 6, null, false, false)|floatval)}
{addJsDef productReference=$product->reference|escape:'html':'UTF-8'}
{addJsDef productAvailableForOrder=$product->available_for_order|boolval}
{addJsDef productPriceWithoutReduction=$productPriceWithoutReduction|floatval}
{addJsDef productPrice=$productPrice|floatval}
{addJsDef productUnitPriceRatio=$product->unit_price_ratio|floatval}
{addJsDef productShowPrice=(!$PS_CATALOG_MODE && $product->show_price)|boolval}
{addJsDef PS_CATALOG_MODE=$PS_CATALOG_MODE}
{if $product->specificPrice && $product->specificPrice|@count}
{addJsDef product_specific_price=$product->specificPrice}
{else}
{addJsDef product_specific_price=array()}
{/if}
{if $display_qties == 1 && $product->quantity}
{addJsDef quantityAvailable=$product->quantity}
{else}
{addJsDef quantityAvailable=0}
{/if}
{addJsDef quantitiesDisplayAllowed=$display_qties|boolval}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'percentage'}
{addJsDef reduction_percent=$product->specificPrice.reduction*100|floatval}
{else}
{addJsDef reduction_percent=0}
{/if}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'amount'}
{addJsDef reduction_price=$product->specificPrice.reduction|floatval}
{else}
{addJsDef reduction_price=0}
{/if}
{if $product->specificPrice && $product->specificPrice.price}
{addJsDef specific_price=$product->specificPrice.price|floatval}
{else}
{addJsDef specific_price=0}
{/if}
{addJsDef specific_currency=($product->specificPrice && $product->specificPrice.id_currency)|boolval} {* TODO: remove if always false *}
{addJsDef stock_management=$PS_STOCK_MANAGEMENT|intval}
{addJsDef taxRate=$tax_rate|floatval}
{addJsDefL name=doesntExist}{l s='This combination does not exist for this product. Please select another combination.' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMore}{l s='This product is no longer in stock' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMoreBut}{l s='with those attributes but is available with others.' js=1}{/addJsDefL}
{addJsDefL name=fieldRequired}{l s='Please fill in all the required fields before saving your customization.' js=1}{/addJsDefL}
{addJsDefL name=uploading_in_progress}{l s='Uploading in progress, please be patient.' js=1}{/addJsDefL}
{addJsDefL name='product_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
{addJsDefL name='product_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
{/strip}
{/if}
