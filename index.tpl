<div id="vuecomponents" v-cloak></div>


{if isset($pageComponents)}
  {foreach from=$pageComponents item=component}

    {include file="$tpl_dir./components/{$component->type}.tpl" component=$component}
  {/foreach}
{/if}


{if !empty($HOOK_HOME_TAB)}
  <ul id="home-page-tabs" class="nav nav-tabs">
    {$HOOK_HOME_TAB}
  </ul>
{/if}

{if !empty($HOOK_HOME_TAB_CONTENT)}
  <div class="tab-content">
    {$HOOK_HOME_TAB_CONTENT}
  </div>
{/if}

{if !empty($HOOK_HOME)}
  <div class="row">
    {$HOOK_HOME}
  </div>
{/if}
