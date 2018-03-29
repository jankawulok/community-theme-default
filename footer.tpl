{if !isset($content_only) || !$content_only}
      </main>{* #center_column *}
    {if isset($right_column_size) && !empty($right_column_size)}
      <aside id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval}" role="navigation complementary">{$HOOK_RIGHT_COLUMN}</aside>
    {/if}
    </div>{* .row *}
  </div>{* #columns*}
<div class="newsletter-footer container">
  <h2>Zapisz się do newslettera</h2>
  <a class="btn btn-success" href="#">Zapisz się do newslettera</a>
</div>
  <footer id="footer">
    <div class="footer-links d-flex pt30 pb60 px40">
      <div class="container">
        <div class="row center-xs">
          <div class="row col-lg-7 col-md-8 col-xs-12 start-md between-md between-xs no-mobile">
            <div>
              <h3>Kategorie</h3>
              <div class="mt15">
                <a href="">Kuchnia</a>
              </div>
            </div>
            <div>
              <h3>Zakupy</h3>
              <div class="mt15">
                <a href="">Kuchnia</a>
              </div>
            </div>
            <div>
              <h3>Pomoc</h3>
              <div class="mt15">
                <a href="">Kuchnia</a>
              </div>
            </div>
            <div>
              <h3>Firma</h3>
              <div class="mt15">
                <a href="">Kuchnia</a>
              </div>
            </div>
          </div>
        </div>
       </div>
      
    </div>

   {*  {if isset($HOOK_FOOTER)}
      <div class="container">
        <div class="row">{$HOOK_FOOTER}</div>
      </div>
    {/if}

    {if !empty($ctheme.footer.copyright.display)}
      <div id="copyright-footer" role="contentinfo">
        {$ctheme.footer.copyright.html}
      </div>
    {/if} *}

  </footer>
{/if}
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
                <link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}"/>
            {/if}
        {/foreach}
    {/if}


{include file="$tpl_dir./global.tpl"}
{literal}
<script>
  
</script>

<script>
//   hello.on('auth.login', function(auth) {

//   // Call user information, for the given network
//   hello(auth.network).api('me').then(function(r) {
//     // Inject it into the container
//     var label = document.getElementById('profile_' + auth.network);
//     if (!label) {
//       label = document.createElement('div');
//       label.id = 'profile_' + auth.network;
//       document.getElementById('profile').appendChild(label);
//     }
//     label.innerHTML = '<img src="' + r.thumbnail + '" /> Hey ' + r.name;
//   });
// });
  
//   hello.init({
//   google: '778410064992-hktfsik59323pdkhionmoam09nshqggl.apps.googleusercontent.com'
// }, {redirect_uri: 'http://jack.dev.kawulok.com.pl:8088/modules/oauth/google.php', response_type: 'code'});
</script>
{/literal}
{* , response_type: 'code' *}

<script>
  window.addEventListener('load', function(){
  if (Cookies.get('cookiePolicyDismissed') === undefined) {
      document.body.className += " cookie-policy-not-dismissed";
      Cookies.set('cookiePolicyDismissed', '1', { expires: 1 });
  }
    // grab an element
    var myElement = document.querySelector("#nav-header");
    // construct an instance of Headroom, passing the element
    var headroom  = new Headroom(myElement);
    // initialise
    // headroom.init();
  });
    

</script>
</body>
</html>
