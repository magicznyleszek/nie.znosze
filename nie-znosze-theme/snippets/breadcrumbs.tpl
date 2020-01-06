<!-- BREADCRUMB -->
<nav class="breadcrumb {if $center}is-centered{/if}" aria-label="breadcrumbs">
    <ul class="breadcrumbs" {if $template != 'list_categories'}vocab="https://schema.org" typeOf="BreadcrumbList"{/if}>
        <li property="itemListElement" typeof="ListItem">
            <a property="item" typeof="WebPage" href="{reverse_url name=shop_home}">{trans}store_theme_translations.shop{/trans}</a>
            <meta property="position" content="1">
            <meta property="name" content="{trans}store_theme_translations.shop{/trans}">
        </li>
        {if isset($collection)}
        <li property="itemListElement" typeof="ListItem">
            <a {if $template == 'product'}property="item" typeOf="webPage"{/if} href="{reverse_url name=shop_collection collection_name=$collection->url}">{$collection->title|ucfirst}</a>
            <meta property="position" content="2">
            <meta property="name" content="{$collection->title|ucfirst}">
        </li>
        {elseif isset($category)}
        <li property="itemListElement" typeof="ListItem">
            <a {if $template == 'product'}property="item" typeOf="webPage"{/if} href="{reverse_url name=shop_category category_name=$category->url}">{$category->title|ucfirst}</a>
            <meta property="position" content="2" >
            <meta property="name" content="{$category->title|ucfirst}">
        </li>
        {elseif isset($vendor)}
        <li property="itemListElement" typeof="ListItem">
            <a property="nextItem" href="{reverse_url name=shop_vendor vendor_name=$vendor->url}">{$vendor->title|ucfirst}</a>
            <meta property="position" content="2" >
            <meta property="name" content="{$vendor->title|ucfirst}">
        </li>
        {elseif $template == 'article'}
        <li property="itemListElement" typeof="ListItem">
            <a property="nextItem" href="{reverse_url name=shop_blog blog_url=$blog->url}">{$blog->title|ucfirst}</a>
            <meta property="position" content="2">
            <meta property="name" content="{$blog->title|ucfirst}">
        </li>
        <li>
            <span>{$article->title}</span>
        </li>
    </ul>
    {elseif $template == 'article'}
    <li property="itemListElement" typeof="ListItem">
        <a property="nextItem" href="{reverse_url name=shop_blog blog_url=$blog->url}" aria-current="page">{$blog->title|ucfirst}</a>
        <meta property="position" content="2">
        <meta property="name" content="{$blog->title|ucfirst}">
    </li>
    {elseif $template == 'search'}
    <li property="itemListElement" typeof="ListItem">
        <a property="nextItem" href="{reverse_url name=shop_blog blog_url=$blog->url}">{trans}store_theme_translations.search_title{/trans}</a>
        <meta property="position" content="2">
        <meta property="name" content="{trans}store_theme_translations.search_title{/trans}">
    </li>
    {elseif $template == 'page'}
    <li property="itemListElement" typeof="ListItem">
        <a property="nextItem" href="{reverse_url name=shop_page page_url=$page->url}" aria-current="page">{$page->title|ucfirst}</a>
        <meta property="position" content="2">
        <meta property="name" content="{$page->title|ucfirst}">
    </li>
    {/if}
    {if $template=='product'}
        {if $page_type == 'search'}
            {assign var=productUrl value={reverse_url name=shop_product product_name=$p->url}}
        {elseif $page_type == 'category'}
            {assign var=productUrl value={reverse_url name=$productUrlName category_name=$page_set->url product_name=$p->url}}
        {elseif $page_type == 'vendor'}
            {assign var=productUrl value={reverse_url name=$productUrlName vendor_name=$page_set->url product_name=$p->url}}
        {elseif $page_type == 'collection'}
            {assign var=productUrl value={reverse_url name=$productUrlName collection_name=$page_set->url product_name=$p->url}}
        {/if}
        <li class="is-active" property="itemListElement" typeOf="listItem">
            <a href="{$productUrl}" aria-current="page">{$product->name|truncate:40}</a>
            <meta property="position" content="3">
            <meta property="name" content="{$product->name|truncate:40}">
        </li>
    {/if}
    </ul>
</nav>
