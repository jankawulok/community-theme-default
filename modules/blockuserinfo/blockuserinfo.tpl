
<div class="blockuserinfo-header dropdown show">

    <a class="dropdown-toggle btn btn-link" href="#" role="button" id="blockuserinfo-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="d-none d-sm-inline-flex">
        {if $is_logged}
            {$cookie->customer_firstname} {$cookie->customer_lastname}
        {else}
            {l s="Moje konto"}
        {/if}
        </span>
    
    <img  class="d-inline-flex d-sm-none" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMS4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDQ4Mi45IDQ4Mi45IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA0ODIuOSA0ODIuOTsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIzMnB4IiBoZWlnaHQ9IjMycHgiPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik0yMzkuNywyNjAuMmMwLjUsMCwxLDAsMS42LDBjMC4yLDAsMC40LDAsMC42LDBjMC4zLDAsMC43LDAsMSwwYzI5LjMtMC41LDUzLTEwLjgsNzAuNS0zMC41ICAgIGMzOC41LTQzLjQsMzIuMS0xMTcuOCwzMS40LTEyNC45Yy0yLjUtNTMuMy0yNy43LTc4LjgtNDguNS05MC43QzI4MC44LDUuMiwyNjIuNywwLjQsMjQyLjUsMGgtMC43Yy0wLjEsMC0wLjMsMC0wLjQsMGgtMC42ICAgIGMtMTEuMSwwLTMyLjksMS44LTUzLjgsMTMuN2MtMjEsMTEuOS00Ni42LDM3LjQtNDkuMSw5MS4xYy0wLjcsNy4xLTcuMSw4MS41LDMxLjQsMTI0LjlDMTg2LjcsMjQ5LjQsMjEwLjQsMjU5LjcsMjM5LjcsMjYwLjJ6ICAgICBNMTY0LjYsMTA3LjNjMC0wLjMsMC4xLTAuNiwwLjEtMC44YzMuMy03MS43LDU0LjItNzkuNCw3Ni03OS40aDAuNGMwLjIsMCwwLjUsMCwwLjgsMGMyNywwLjYsNzIuOSwxMS42LDc2LDc5LjQgICAgYzAsMC4zLDAsMC42LDAuMSwwLjhjMC4xLDAuNyw3LjEsNjguNy0yNC43LDEwNC41Yy0xMi42LDE0LjItMjkuNCwyMS4yLTUxLjUsMjEuNGMtMC4yLDAtMC4zLDAtMC41LDBsMCwwYy0wLjIsMC0wLjMsMC0wLjUsMCAgICBjLTIyLTAuMi0zOC45LTcuMi01MS40LTIxLjRDMTU3LjcsMTc2LjIsMTY0LjUsMTA3LjksMTY0LjYsMTA3LjN6IiBmaWxsPSIjNDA0MDQwIi8+CgkJPHBhdGggZD0iTTQ0Ni44LDM4My42YzAtMC4xLDAtMC4yLDAtMC4zYzAtMC44LTAuMS0xLjYtMC4xLTIuNWMtMC42LTE5LjgtMS45LTY2LjEtNDUuMy04MC45Yy0wLjMtMC4xLTAuNy0wLjItMS0wLjMgICAgYy00NS4xLTExLjUtODIuNi0zNy41LTgzLTM3LjhjLTYuMS00LjMtMTQuNS0yLjgtMTguOCwzLjNjLTQuMyw2LjEtMi44LDE0LjUsMy4zLDE4LjhjMS43LDEuMiw0MS41LDI4LjksOTEuMyw0MS43ICAgIGMyMy4zLDguMywyNS45LDMzLjIsMjYuNiw1NmMwLDAuOSwwLDEuNywwLjEsMi41YzAuMSw5LTAuNSwyMi45LTIuMSwzMC45Yy0xNi4yLDkuMi03OS43LDQxLTE3Ni4zLDQxICAgIGMtOTYuMiwwLTE2MC4xLTMxLjktMTc2LjQtNDEuMWMtMS42LTgtMi4zLTIxLjktMi4xLTMwLjljMC0wLjgsMC4xLTEuNiwwLjEtMi41YzAuNy0yMi44LDMuMy00Ny43LDI2LjYtNTYgICAgYzQ5LjgtMTIuOCw4OS42LTQwLjYsOTEuMy00MS43YzYuMS00LjMsNy42LTEyLjcsMy4zLTE4LjhjLTQuMy02LjEtMTIuNy03LjYtMTguOC0zLjNjLTAuNCwwLjMtMzcuNywyNi4zLTgzLDM3LjggICAgYy0wLjQsMC4xLTAuNywwLjItMSwwLjNjLTQzLjQsMTQuOS00NC43LDYxLjItNDUuMyw4MC45YzAsMC45LDAsMS43LTAuMSwyLjVjMCwwLjEsMCwwLjIsMCwwLjNjLTAuMSw1LjItMC4yLDMxLjksNS4xLDQ1LjMgICAgYzEsMi42LDIuOCw0LjgsNS4yLDYuM2MzLDIsNzQuOSw0Ny44LDE5NS4yLDQ3LjhzMTkyLjItNDUuOSwxOTUuMi00Ny44YzIuMy0xLjUsNC4yLTMuNyw1LjItNi4zICAgIEM0NDcsNDE1LjUsNDQ2LjksMzg4LjgsNDQ2LjgsMzgzLjZ6IiBmaWxsPSIjNDA0MDQwIi8+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
    </a>

        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="blockuserinfo-dropdown">

            <a class="dropdown-item" href="{$link->getPageLink('history', true)|escape:'html':'UTF-8'}"
                       title="{l s='My orders' mod='blockmyaccount'}">
                {l s='My orders' mod='blockmyaccount'}
            </a>
            <a class="dropdown-item" href="{$link->getPageLink('order-follow', true)|escape:'html':'UTF-8'}"
               title="{l s='My merchandise returns' mod='blockmyaccount'}">
                {l s='My merchandise returns' mod='blockmyaccount'}
            </a>
            <a class="dropdown-item" href="{$link->getPageLink('order-slip', true)|escape:'html':'UTF-8'}"
               title="{l s='My credit slips' mod='blockmyaccount'}">
                {l s='My credit slips' mod='blockmyaccount'}
            </a>
            <a class="dropdown-item" href="{$link->getPageLink('addresses', true)|escape:'html':'UTF-8'}"
               title="{l s='My addresses' mod='blockmyaccount'}">
                {l s='My addresses' mod='blockmyaccount'}
            </a>
            <a class="dropdown-item" href="{$link->getPageLink('identity', true)|escape:'html':'UTF-8'}"
               title="{l s='My personal info' mod='blockmyaccount'}">
                {l s='My personal info' mod='blockmyaccount'}
            </a>
            <a class="dropdown-item" href="{$link->getPageLink('discount', true)|escape:'html':'UTF-8'}"
               title="{l s='My vouchers' mod='blockmyaccount'}">
                {l s='My vouchers' mod='blockmyaccount'}
            </a>


        <div class="dropdown-divider"></div>
        
        <a class="dropdown-item dropdown-item__big" href="{$link->getPageLink('authentication', true)|escape:'html':'UTF-8'}">Zaloguj</a>
        <a class="dropdown-item dropdown-item__big" href="{$link->getPageLink('authentication', true)|escape:'html':'UTF-8'}">Załóż konto</a>
        <div class="dropdown-item dropdown-item__social-container">
           <a class="dropdown-item__social-element dropdown-item__social-facebook" href="http://jack.dev.kawulok.com.pl:8088/modules/oauth/google.php"><i class="fab fa-facebook-f"></i><span>Facebook</span></a> 
           <a class="dropdown-item__social-element dropdown-item__social-google" onclick="hello('google').login({
    scope: 'email'
}).then(function() {
    alert('You are signed in to Facebook');
    // location.reload();
}, function(e) {
    console.log(e);
    alert('Signin error: ' + e.error.message);
    // location.reload();
});" href="#"><i class="fab fa-google"></i><span>Google</span></a>
        </div>
    </div>

{*      *}
</div>

</div> {* end .nav-header__nav *}