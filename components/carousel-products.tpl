<div class="c-carousel-products">
    <div class="c-carousel-products_carousel">
        {foreach from=$component->products item=product}
            {include file='../product-list-item.tpl' product=$product}
        {/foreach}
    </div>
    {if isset($component->link)}
        <div class="c-carousel-products__btm-l-c">
            <a href="{$component->link}">{$component->link_title}</a>
        </div>
    {/if}
</div>