<div class="box-sheet">
    
    <div class="box-slider">
        
    </div>
</div>

<div class="box-sheet">
    
    <div class="tiles-carousel">
        
    </div>
</div>



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
