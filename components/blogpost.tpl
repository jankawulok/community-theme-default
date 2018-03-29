{assign var=imagePath value=Media::getMediaPath(BeesBlog::getPostImagePath($component->id, 'original'))}
{assign var=postPath value=BeesBlog::GetBeesBlogLink('beesblog_post', ['blog_rewrite' => $component->link_rewrite])}
<div class="c-blogpost">
    
    <a title="{$component->title|escape:'htmlall':'UTF-8'}" href="{$postPath|escape:'htmlall':'UTF-8'}" id="beesblog-post-{$component->id|intval}" class="blog-category-list__item">

    <div class="blog-post-list__cover" style="background-image:url('{$imagePath|escape:'htmlall':'UTF-8'}')">
    </div>

    <div class="blog-post-list__summary">
        <div class="blog-post-list__summary-category">
            {$component->category->title|escape:'htmlall':'UTF-8'}

        </div>
        <h4 class="blog-post-list__summary-title">
            {$component->title|escape:'htmlall':'UTF-8'}
        </h4>
        <div class="blog-post-list__summary-content">
            {$component->getSummary()|escape:'htmlall':'UTF-8'}
        </div>
        
    </div>

</a>
</div>



