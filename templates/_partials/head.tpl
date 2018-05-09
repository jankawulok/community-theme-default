
{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="x-ua-compatible" content="ie=edge">
{/block}
{block name='head_manifest'}
  <link rel="manifest" href="/manifest.json">
{/block}
{block name='head_seo'}
  <title>{block name='head_seo_title'}{$meta_title|escape:'html':'UTF-8'}{/block}</title>
  <meta name="description" content="{block name='head_seo_description'}{$meta_description|escape:'html':'UTF-8'}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$meta_keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
{/block}

{block name='head_hreflang'}
 {*  {assign "alternative_langs" $urls.alternative_langs|default:[]}
  {foreach from=$alternative_langs item=pageUrl key=code}
    <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
  {/foreach} *}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
{/block}

{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
{/block}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}{/block}
