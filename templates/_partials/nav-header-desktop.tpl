<nav id="nav-header" class="nav-header container-fluid d-flex" data-headroom>
    <a href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}"
        title="{$shop_name|escape:'html':'UTF-8'}">
        <h2 class="nav-header__logo">
            <img class="center-block" src="{$img_dir}logo.svg" alt="{$shop_name|escape:'html':'UTF-8'}"
                title="{$shop_name|escape:'html':'UTF-8'}"/>
        </h2>
    </a>
    {if !empty($HOOK_TOP)}{$HOOK_TOP}{/if}
</nav>
<nav class="d-flex nav-menu-container">
        <div class="container-wide">
            <div class="nav-menu">
                <div class="nav-menu-categories">
                    <a href="#" id="nav-menu-categories__link" class="nav-menu-categories__link" data-dropdown-id="categories-dropdown">{l s="Kategorie"}</a>
                    {include file="_partials/menu-dropdown.tpl"}
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