{if !empty($products)}
  {if $page_name == 'index' || $page_name == 'product'}
    {$product_block_size_class = 'col-xs-12 col-sm-4 col-md-3'}
  {else}
    {$product_block_size_class = 'col-xs-6 col-sm-4 col-md-3'}
  {/if}

  {$show_functional_buttons = $page_name != 'index'}

  <section{if !empty($id)} id="{$id}"{/if} class="products{if !empty($class)} {$class}{/if} product_list">
    <div class="products-container">
      {foreach from=$products item=product}
        {include file='./product-list-item.tpl' product=$product}
      {/foreach}
    </div>
    <!-- It's likely you'll need to link the card somewhere. You could add a button in the info, link the titles, or even wrap the entire card in an <a href="..."> -->
    
    

    <!-- more products -->

  </section>


  {addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
  {addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
  {addJsDef comparator_max_item=$comparator_max_item}
  {addJsDef comparedProductsIds=$compared_products}
{/if}
