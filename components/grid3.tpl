<div class="grid g-3">
    <div class="g-3_1">
        {include file="$tpl_dir./components/{$component->slots[0]->type}.tpl" component=$component->slots[0]}
    </div>
    <div class="g-3_2">
        {include file="$tpl_dir./components/{$component->slots[1]->type}.tpl" component=$component->slots[1]}
    </div>
    <div class="g-3_3">
        {include file="$tpl_dir./components/{$component->slots[2]->type}.tpl" component=$component->slots[2]}
    </div>

</div>