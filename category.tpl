{extends file='catalog/listing/product-list.tpl'}
{$display_subcategories = (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories)}
{{assign var="listing.products" value=$products}}
{block name='product_list_header'}
{* {$products|@var_dump} *}
{* {assign var=listing value=arra} *}
{$listing.products = $products}
{* {assign var=listing value=$products} *}
    <h1>{$category->name}</h1>
    {if $category->id_image}
    <div id="category-banner">
        <img class="img-fluid"
             src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')|escape:'html':'UTF-8'}"
             alt="{$category->name|escape:'html':'UTF-8'}" title="{$category->name|escape:'html':'UTF-8'}">
    </div>
    {/if}

{/block}