<!DOCTYPE HTML>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7" {if isset($language_code) && $language_code}
      lang="{$language_code|escape:'html':'UTF-8'}" {/if}><![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8 ie7" {if isset($language_code) && $language_code}
      lang="{$language_code|escape:'html':'UTF-8'}" {/if}><![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9 ie8" {if isset($language_code) && $language_code}
      lang="{$language_code|escape:'html':'UTF-8'}" {/if}><![endif]-->
<!--[if gt IE 8]>
<html class="no-js ie9" {if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"
      {/if}><![endif]-->
<html{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}>
<head>
    {if isset($css_files)}
        {foreach from=$css_files key=css_uri item=media}
            {if $css_uri == 'lteIE9'}
                <!--[if lte IE 9]>
                {foreach from=$css_files[$css_uri] key=css_uriie9 item=mediaie9}
                <link rel="stylesheet" href="{$css_uriie9|escape:'html':'UTF-8'}" type="text/css"
                      media="{$mediaie9|escape:'html':'UTF-8'}"/>
                {/foreach}
                <![endif]-->
            {else}
                <link rel="preload" as="style"  href="{$css_uri|escape:'html':'UTF-8'}"/>
            {/if}
        {/foreach}
    {/if}
    <meta charset="utf-8"/>
    <title>{$meta_title|escape:'html':'UTF-8'}</title>
    {if isset($meta_description) AND $meta_description}
        <meta name="description" content="{$meta_description|escape:'html':'UTF-8'}"/>
    {/if}
    {if isset($meta_keywords) AND $meta_keywords}
        <meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}"/>
    {/if}
    <meta name="generator" content="thirty bees"/>
    <meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow"/>
    <meta name="viewport" content="width=device-width, minimum-scale=0.25, maximum-scale=5, initial-scale=1.0"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="theme-color" content="#4285f4">
    {* <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin> *}
    <link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}"/>
    <link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}"/>
    <link async="async"  rel="stylesheet" href="/themes/theme/css/global.css" type="text/css"
                      media="screen"/>
    {$HOOK_HEADER}
    <!--[if IE 8]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script async="async" type="text/javascript" src="https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js" async></script>
    {* <script src="{$tpl_uri}js/hello.all.js" defer></script> *}
    <script type="text/javascript" src="https://unpkg.com/headroom.js" async></script>
    {* <script src="https://cdn.jsdelivr.net/npm/vue"></script> *}
    {* <script src="https://vuejs.org/js/vue.js" async></script> *}
    {* <script src="https://unpkg.com/vuex@3.0.1/dist/vuex.js" async></script> *}
{*     <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet" lazyload> *}
<script async="async"  src="{$tpl_uri}js/partials/menu.js" defer></script>
{if isset($css_files)}
    {foreach from=$css_files key=css_uri item=media}
        {if $css_uri == 'lteIE9'}
            <!--[if lte IE 9]>
            {foreach from=$css_files[$css_uri] key=css_uriie9 item=mediaie9}
            <link rel="stylesheet" href="{$css_uriie9|escape:'html':'UTF-8'}" type="text/css"
                  media="{$mediaie9|escape:'html':'UTF-8'}"/>
            {/foreach}
            <![endif]-->
        {else}
            <link async="async"  rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}" type="text/css"
                  media="{$media|escape:'html':'UTF-8'}"/>
        {/if}
    {/foreach}
{/if}
{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
    {$js_def}
    {foreach from=$js_files item=js_uri}
        <script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}" ></script>
    {/foreach}
{/if}


</head>
<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if}
        class="{if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{else} show-left-column{/if}{if $hide_right_column} hide-right-column{else} show-right-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso}">
{if !isset($content_only) || !$content_only}

{if isset($restricted_country_mode) && $restricted_country_mode}
    <div id="restricted-country">
        <p>{l s='You cannot place a new order from your country.'}{if isset($geolocation_country) && $geolocation_country}
                <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span>{/if}</p>
    </div>
{/if}

<header id="header">
    <div id="header-cookie-policy" class="header-cookie-policy container-fluid">
        <div class="alert alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        {l s="Strona korzysta z plików cookies. Jeżeli nie zmienisz ustawień przeglądarki, będą one zapisywane w pamięci Twojego urządzenia."}
        </div>
    </div>

    {capture name='displayBanner'}{hook h='displayBanner'}{/capture}
    {if $smarty.capture.displayBanner}
        <div id="header-banners">
            {$smarty.capture.displayBanner}
        </div>
    {/if}

    <nav class="navbar" style="display: none;">
        <div class="container">
            <div class="collapse navbar-collapse" id="header-navbar">
                {capture name='displayHeaderNavbarLeftNav'}{hook h='displayHeaderNavbarLeftNav'}{/capture}
                {if $smarty.capture.displayHeaderNavbarLeftNav}
                  <ul id="header-navbar-left-nav" class="nav navbar-nav">
                    {$smarty.capture.displayHeaderNavbarLeftNav}
                  </ul>
                {/if}
                {* hook h='displayHeaderNavbar' *}
                {capture name='displayNav'}{hook h='displayNav'}{/capture}
                {if $smarty.capture.displayNav}
                    <ul id="header-navbar-right-nav" class="nav navbar-nav navbar-right">
                        {$smarty.capture.displayNav}
                    </ul>
                {/if}
            </div>
        </div>
    </nav>
    <nav id="nav-header" class="nav-header container-fluid d-flex" data-headroom>
        <a href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}"
            title="{$shop_name|escape:'html':'UTF-8'}">
            <h2 itemscope itemtype="http://schema.org/Organization" class="nav-header__logo">
                <img class="center-block" src="https://maleomi.pl/themes/theme/img/logo.svg" alt="{$shop_name|escape:'html':'UTF-8'}"
                    title="{$shop_name|escape:'html':'UTF-8'}"/>
            </h2>
        </a>
        {if !empty($HOOK_TOP)}{$HOOK_TOP}{/if}
                
{*         <div class="container-fluid nav-header-navbar">
            {hook h='displayVerticalMenu'}
        </div> *}
    </nav>
    <nav class="d-flex nav-menu-container">
        <div class="container-wide">
            <div class="nav-menu">
                <div class="nav-menu-categories">
                    <a href="#" id="nav-menu-categories__link" class="nav-menu-categories__link" data-dropdown-id="categories-dropdown">{l s="Kategorie"}</a>
                    {include file="$tpl_dir./partials/menu-categories/dropdown.tpl"}
                </div>
                <div class="nav-header-menu">
                    <div class="nav-header-menu__bar">
                        <div class="nav-header-menu__links">
                            <a href="#" class="nav-header-menu__link">Promocje</a>
                            <a href="#" class="nav-header-menu__link">Marki</a>
                            <a href="#" class="nav-header-menu__link">Strefa okazji</a>
                            <a href="#" class="nav-header-menu__link">Polecamy</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
    </nav>
</header>

{* {$categorymenu|@var_dump} *}
{if $page_name !='index' && $page_name !='pagenotfound'}
    <div class="container-fluid container-wide">
        {include file="$tpl_dir./breadcrumb.tpl"}
    </div>
    
{/if}

<div id="columns" class="container-wide">
    {if isset($page_name) && $page_name == 'category'}
        <h1 class="page-heading">
            <span class="cat-name">
                {$category->name|escape:'html':'UTF-8'}
                {if isset($categoryNameComplement)}&nbsp;{$categoryNameComplement|escape:'html':'UTF-8'}{/if}
            </span>
        </h1>
    {/if}
    {hook h='displayTopCategory'}
    {capture name='displayTopColumn'}{hook h='displayTopColumn'}{/capture}
    {if !empty($smarty.capture.displayTopColumn)}
        <div id="top_column" class="row">{$smarty.capture.displayTopColumn}</div>
    {/if}
    <div class="d-flex flex-row justify-content-md-center">
        {if isset($left_column_size) && !empty($left_column_size)}
            <aside id="left_column" class="col">{$HOOK_LEFT_COLUMN}
                {if !empty($category->description)}
                    <div id="category-description" class="rte">{$category->description}</div>
                {/if}
            </aside>
        {/if}
        {if isset($left_column_size) && isset($right_column_size)}{assign var='cols' value=(12 - $left_column_size - $right_column_size)}{else}{assign var='cols' value=12}{/if}
        <main id="center_column" class="col">
            {/if}
