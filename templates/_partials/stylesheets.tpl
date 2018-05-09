{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 <link async="async"  rel="stylesheet" href="/themes/theme/css/global.css" type="text/css"
                      media="screen"/>
{* {foreach $stylesheets.external as $stylesheet}
  <link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="{$stylesheet.media}">
{/foreach} *}

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
            <link async="async"  rel="stylesheet" type="text/css"  href="{$css_uri|escape:'html':'UTF-8'}"  media="screen"/>
        {/if}
    {/foreach}
{/if}
{foreach $stylesheets.inline as $stylesheet}
  <style>
    {$stylesheet.content}
  </style>
{/foreach}
