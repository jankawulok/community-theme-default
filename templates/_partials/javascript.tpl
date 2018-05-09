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
{foreach $javascript.external as $js}
  <script type="text/javascript" src="{$js.uri}" {$js.attribute}></script>
{/foreach}

{foreach $javascript.inline as $js}
  <script type="text/javascript">
    {$js.content nofilter}
  </script>
{/foreach}
<script async="async" type="text/javascript" src="https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js" async></script>
<script type="text/javascript" src="/themes/theme/js/turbolinks.js" ></script>
    {* <script src="{$tpl_uri}js/hello.all.js" defer></script> *}
    {* <script type="text/javascript" src="https://unpkg.com/headroom.js" async></script> *}
    {* <script src="https://cdn.jsdelivr.net/npm/vue"></script> *}
    {* <script src="https://vuejs.org/js/vue.js" async></script> *}
    {* <script src="https://unpkg.com/vuex@3.0.1/dist/vuex.js" async></script> *}
{*     <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet" lazyload> *}
<script async="async"  src="{$tpl_uri}js/partials/menu.js" defer></script>

{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
    {$js_def}
    {foreach from=$js_files item=js_uri}
        <script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}" async></script>
    {/foreach}
{/if}
{if isset($vars) && $vars|@count}
  <script type="text/javascript">
    {foreach from=$vars key=var_name item=var_value}
    var {$var_name} = {$var_value|json_encode nofilter};
    {/foreach}
  </script>
{/if}
<script type="text/javascript">
    Turbolinks.start();
</script>
