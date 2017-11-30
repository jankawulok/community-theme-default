{if isset($no_follow) && $no_follow}
  {assign var='no_follow_text' value=' rel="nofollow"'}
{else}
  {assign var='no_follow_text' value=''}
{/if}

{if !empty($p)}

  {if isset($smarty.get.id_category) && $smarty.get.id_category && isset($category)}
    {if !isset($current_url)}
      {assign var='requestPage' value=$link->getPaginationLink('category', $category, false, false, true, false)}
    {else}
      {assign var='requestPage' value=$current_url}
    {/if}
    {assign var='requestNb' value=$link->getPaginationLink('category', $category, true, false, false, true)}
  {elseif isset($smarty.get.id_manufacturer) && $smarty.get.id_manufacturer && isset($manufacturer)}
    {assign var='requestPage' value=$link->getPaginationLink('manufacturer', $manufacturer, false, false, true, false)}
    {assign var='requestNb' value=$link->getPaginationLink('manufacturer', $manufacturer, true, false, false, true)}
  {elseif isset($smarty.get.id_supplier) && $smarty.get.id_supplier && isset($supplier)}
    {assign var='requestPage' value=$link->getPaginationLink('supplier', $supplier, false, false, true, false)}
    {assign var='requestNb' value=$link->getPaginationLink('supplier', $supplier, true, false, false, true)}
  {else}
    {if !isset($current_url)}
      {assign var='requestPage' value=$link->getPaginationLink(false, false, false, false, true, false)}
    {else}
      {assign var='requestPage' value=$current_url}
    {/if}
    {assign var='requestNb' value=$link->getPaginationLink(false, false, true, false, false, true)}
  {/if}

  <nav id="pagination{if isset($paginationId)}_{$paginationId}{/if}" class="form-group clearfix">
    {if $start!=$stop}
      <ul class="pagination">
        {if $p != 1}
          {assign var='p_previous' value=$p-1}
          <li id="pagination_previous{if isset($paginationId)}_{$paginationId}{/if}" class="pagination_previous" title="{l s='Previous'}">
            <a{$no_follow_text} href="{$link->goPage($requestPage, $p_previous)}" rel="prev" class="page-link">
              <span>&laquo;</span>
            </a>
          </li>
        {else}
          <li id="pagination_previous{if isset($paginationId)}_{$paginationId}{/if}" class="page-item disabled pagination_previous" title="{l s='Previous'}">
            <span class="page-link">&laquo;</span>
          </li>
        {/if}
        {if $start==3}
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, 1)}" class="page-link">
              <span>1</span>
            </a>
          </li>
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, 2)}" class="page-link">
              <span>2</span>
            </a>
          </li>
        {/if}
        {if $start==2}
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, 1)}" class="page-link">
              <span>1</span>
            </a>
          </li>
        {/if}
        {if $start>3}
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, 1)}" class="page-link">
              <span>1</span>
            </a>
          </li>
          <li class="truncate">
            <span>
              <span>...</span>
            </span>
          </li>
        {/if}
        {section name=pagination start=$start loop=$stop+1 step=1}
          {if $p == $smarty.section.pagination.index}
            <li class="page-item active">
              <a class="page-link" href="#">
                <span>{$p|escape:'html':'UTF-8'}</span>
              </a>
              
            </li>
          {else}
            <li class="page-item">
              <a{$no_follow_text} href="{$link->goPage($requestPage, $smarty.section.pagination.index)}" class="page-link">
                <span>{$smarty.section.pagination.index|escape:'html':'UTF-8'}</span>
              </a>
            </li>
          {/if}
        {/section}
        {if $pages_nb>$stop+2}
          <li class="truncate">
            <span>
              <span>...</span>
            </span>
          </li>
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, $pages_nb)}" class="page-link">
              <span>{$pages_nb|intval}</span>
            </a>
          </li>
        {/if}
        {if $pages_nb==$stop+1}
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, $pages_nb)}" class="page-link">
              <span>{$pages_nb|intval}</span>
            </a>
          </li>
        {/if}
        {if $pages_nb==$stop+2}
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, $pages_nb-1)}" class="page-link">
              <span>{$pages_nb-1|intval}</span>
            </a>
          </li>
          <li class="page-item">
            <a{$no_follow_text} href="{$link->goPage($requestPage, $pages_nb)}" class="page-link">
              <span>{$pages_nb|intval}</span>
            </a>
          </li>
        {/if}
        {if $pages_nb > 1 AND $p != $pages_nb}
          {assign var='p_next' value=$p+1}
          <li id="pagination_next{if isset($paginationId)}_{$paginationId}{/if}" class="pagination_next" title="{l s='Next'}">
            <a{$no_follow_text} href="{$link->goPage($requestPage, $p_next)}" rel="next" class="page-link">
              &raquo;
            </a>
          </li>
        {else}
          <li id="pagination_next{if isset($paginationId)}_{$paginationId}{/if}" class="disabled page-item pagination_next" title="{l s='Next'}">
            <span class="page-link">&raquo;</span>
          </li>
        {/if}
      </ul>

    {/if}
  </nav>

  <div class="form-group product-count">
    {if ($n*$p) < $nb_products }
      {assign var='productShowing' value=$n*$p}
    {else}
      {assign var='productShowing' value=($n*$p-$nb_products-$n*$p)*-1}
    {/if}
    {if $p==1}
      {assign var='productShowingStart' value=1}
    {else}
      {assign var='productShowingStart' value=$n*$p-$n+1}
    {/if}
    <p class="form-control-static">
      {if $nb_products > 1}
        {l s='Showing %1$d - %2$d of %3$d items' sprintf=[$productShowingStart, $productShowing, $nb_products]}
      {else}
        {l s='Showing %1$d - %2$d of 1 item' sprintf=[$productShowingStart, $productShowing]}
      {/if}
    </p>
  </div>

{/if}
