<div id="menuCategories" class="menu-categories menu-categories__closed">
    <div class="menu-categories-list d-flex flex-column">
        {foreach from=$categorymenu.children item=category}
            <div class="menu-categories-list__item"  data-layer-id="{$category.id}">
                <img src="{$img_dir}icon.svg" class="menu-categories-list__item-icon lozad">
                <a href="{$category.link}" id="menu-categories-list__item-{$category.id}" class="menu-categories-list__item-link"></a>{$category.name}
            </div>
        {/foreach}
    </div>
    <div class="menu-categories-left-container">
        {foreach from=$categorymenu.children item=category}
            <div id="menu-categories-left-container__item-{$category.id}" class="menu-categories-left-container__item flex-row" data-layer-id="{$category.id}">
                <div class="menu-categories-description">
                    <h6 class="menu-categories-description__title">Kategorie w dziale {$category.name}</h6>
                    <ul class="menu-categories-left-container__subcategories">
                    {foreach from=$category.children item=subcategory}
                        <li class="menu-categories-left-container__subcategories-item">
                            <a href="{$subcategory.link}" >{$subcategory.name}</a> 
                        </li>
                    {/foreach}
                    </ul>
                </div>
                
                <div class="menu-categories-left-container__banner align-self-center">
                    <img data-src="/img/aa.png" class="lozad">
                </div>
            </div>
        {/foreach}
    </div>
</div>