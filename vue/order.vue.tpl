{*
* Copyright (C) 2017 thirty bees
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.md
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to contact@thirtybees.com so we can send you a copy immediately.
*
* @author    thirty bees <contact@thirtybees.com>
* @copyright 2017 thirty bees
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}
{* Vue store *}
{* {include file=ElasticSearch::tpl('hook/vue/store.vue.tpl')} *}


{* Components *}
{* {include file='$tpl_dir./hook/vue/column.vue.tpl'} *}
{* {include file='$tpl_dir./hook/vue/results/results.vue.tpl')} *}


{* Template file *}
{* {capture name="template"}{include file='$tpl_dir./hook/vue/main-search.html.tpl')}{/capture} *}

<script type="text/javascript">
  var app = new Vue({
    el: '#order-main',
    store: window.store,
    data: {
      message: 'Hello Vue!'
    }
  })
</script>
