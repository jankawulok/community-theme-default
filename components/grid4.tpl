<div class="grid g-4">
    <div class="g-4_1">
        {include file="$tpl_dir./components/{$component->slots[0]->type}.tpl" component=$component->slots[0]}
    </div>
    <div class="g-4_2">
        {include file="$tpl_dir./components/{$component->slots[1]->type}.tpl" component=$component->slots[1]}
    </div>
    <div class="g-4_3">
        {include file="$tpl_dir./components/{$component->slots[2]->type}.tpl" component=$component->slots[2]}
    </div>
    <div class="g-4_4">
        {include file="$tpl_dir./components/{$component->slots[3]->type}.tpl" component=$component->slots[3]}
    </div>
</div>