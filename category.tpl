{$display_subcategories = (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories)}

{include file="$tpl_dir./errors.tpl"}

{if !empty($category) && $category->id}
    {if !$category->active}
        <div class="alert alert-warning">{l s='This category is currently unavailable.'}</div>
    {else}
        <main>
            
        <section id="category-info">
            {if $category->id_image}
                <div id="category-banner">
                    <img class="img-responsive"
                         src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')|escape:'html':'UTF-8'}"
                         alt="{$category->name|escape:'html':'UTF-8'}" title="{$category->name|escape:'html':'UTF-8'}">
                </div>
            {/if}
        </section>
        {if !empty($products)}
            <section id="category-products">
                <div class="content_sortPagiBar clearfix">
                    <div class="form-inline sortPagiBar clearfix">
                        {include file="./product-sort.tpl"}
                        {include file="./nbr-product-page.tpl"}
                    </div>
                    <div class="top-pagination-content form-inline clearfix">
                        {include file="./product-compare.tpl"}
                        {include file="$tpl_dir./pagination.tpl"}
                    </div>
                </div>
                {include file="./product-list.tpl" products=$products}

                <div class="content_sortPagiBar">
                    <div class="bottom-pagination-content form-inline clearfix">
                        {include file="./product-compare.tpl" paginationId='bottom'}
                        {include file="./pagination.tpl" paginationId='bottom'}
                    </div>
                </div>
            </section>
        {/if}

    {/if}
    </main>
{/if}
