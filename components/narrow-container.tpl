<article class="section s-narrow">
    
    {if isset($component->title)}
        <h2 class="section-title">{$component->title}</h2>
    {/if}

    {foreach from=$component->slots item=item}
        {include file="$tpl_dir./components/{$component->name}.tpl" component=$item}
    {/foreach}

</article>