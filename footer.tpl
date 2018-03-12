{if !isset($content_only) || !$content_only}
      </main>{* #center_column *}
    {if isset($right_column_size) && !empty($right_column_size)}
      <aside id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval}" role="navigation complementary">{$HOOK_RIGHT_COLUMN}</aside>
    {/if}
    </div>{* .row *}
  </div>{* #columns*}

  <footer id="footer">

    {if isset($HOOK_FOOTER)}
      <div class="container">
        <div class="row">{$HOOK_FOOTER}</div>
      </div>
    {/if}

    {if !empty($ctheme.footer.copyright.display)}
      <div id="copyright-footer" role="contentinfo">
        {$ctheme.footer.copyright.html}
      </div>
    {/if}

  </footer>
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
    headroom.init();
  });
});
    

</script>
</body>
</html>
