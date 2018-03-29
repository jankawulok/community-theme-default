<article class="section s-narrow">
    {if isset($component->title)}
        <h2 class="section-title">{$component->title}</h2>
    {/if}
    {foreach from=$component->slots item=item}
        {include file="$tpl_dir./components/{$item->type}.tpl" component=$item}
    {/foreach}

</article>

<div class="s-tabs">
    <div class="s-tabs__container-elements">
        {foreach from=$component->slots item=item}
            <div class="s-tabs__container-elements__element">
                <a href="#{$item->id}">{$item->title}</a>
            </div>
        {/foreach}
    </div>
    <div class="s-tabs__container-tabs">
        {foreach from=$component->slots item=item}
            {include file="$tpl_dir./components/{$item->type}.tpl" component=$item}
        {/foreach}
    </div>
</div>