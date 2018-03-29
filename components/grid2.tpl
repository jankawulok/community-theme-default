<div class="grid g-2">
    <div class="g-2_1">
        {include file="$tpl_dir./components/{$component->slots[0]->type}.tpl" component=$component->slots[0]}
    </div>
    <div class="g-2_2">
        {include file="$tpl_dir./components/{$component->slots[1]->type}.tpl" component=$component->slots[1]}
    </div>

</div>