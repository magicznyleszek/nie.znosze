<!DOCTYPE html>
<html lang="pl" xmlns="http://www.w3.org/1999/xhtml">
<head itemscope itemtype="http://schema.org/WebSite">
    <!-- META DATA -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="pl" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
    {snippet file="seo_meta_tags"}
    <!-- END META DATA -->

    <!-- FACEBOOK OG DATA -->
    {if $template == 'home'}
        <meta property="og:title" itemprop='name' content="{$shop->name}" />
        <meta property="og:type" content="website" />
        <meta property="og:url" itemprop="url" content="{$shop->domain}" />
        <meta property="og:image" content="{"logo.png"|asset_url}" alt="{$shop->name}" />
        <meta property="og:site_name" content="{$shop->name}" />
    {/if}
    {if $template == 'product'}
        <meta property="og:title" itemprop='name' content="{$product->name}" />
        <meta property="og:type" content="website" />
        <meta property="og:url" itemprop="url" content="{reverse_url name='shop_product' product_name=$product->url}" />
        <meta property="og:image" content="{$product->main_image|product_img_url:th160}" alt="{$product->name}" />
        <meta property="og:description" content="{$product->short_description|strip_tags|escape|strip}" />
        <meta property="og:site_name" content="{$shop->name}" />
        {if isset($category) || isset($collection) || isset($vendor)}
            <link rel="canonical" href="{reverse_url name=shop_product product_name=$product->url}" />
        {/if}
    {/if}
    {if $template == 'collection'}
        {assign prod $collection->products[0]}
        <meta property="og:title" itemprop='name' content="{$collection->title}" />
        <meta property="og:type" content="website" />
        <meta property="og:url" itemprop="url" content="{reverse_url name='shop_collection' collection_name=$collection->url}" />
        <meta property="og:image" content="{$collection->image|collection_img_url:th640}" />
        <meta property="og:description" content="{$collection->description|strip_tags|escape|strip}" />
        <meta property="og:site_name" content="{$shop->name}" />
    {/if}
    {if $template == 'category'}
        <meta property="og:title" itemprop='name' content="{$category->title}" />
        <meta property="og:type" content="website" />
        <meta property="og:url" itemprop="url" content="{reverse_url name='shop_category' category_name=$category->url}" />
        <meta property="og:image" content="{$category->image|category_img_url:th640}" />
        <meta property="og:description" content="{$category->description|strip_tags|escape|strip}" />
        <meta property="og:site_name" content="{$shop->name}" />
    {/if}
    <!-- END FACEBOOK OG DATA -->

    <link rel="apple-touch-icon" sizes="180x180" href='{"apple-touch-icon.png"|asset_url}'>
    <link rel="icon" type="image/png" sizes="32x32" href='{"favicon-32x32.png"|asset_url}'>
    <link rel="icon" type="image/png" sizes="16x16" href='{"favicon-16x16.png"|asset_url}'>
    <link rel="manifest" href='{"site.webmanifest"|asset_url}'>
    <link rel="mask-icon" href='{"safari-pinned-tab.svg"|asset_url}' color="#000000">
    <link rel="shortcut icon" href='{"favicon.ico"|asset_url}'>
    <meta name="msapplication-TileColor" content="#ffc40d">
    <meta name="msapplication-config" content='{"browserconfig.xml"|asset_url}'>
    <meta name="theme-color" content="#000000">

    {if $settings->set__font_headers == "'Lato', Helvetica, Arial, sans-serif" || $settings->set__font_default == "'Lato', Helvetica, Arial, sans-serif"}
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    {/if}
    {if $settings->set__font_headers == "'Roboto', Helvetica, Arial, sans-serif" || $settings->set__font_default == "'Roboto', Helvetica, Arial, sans-serif"}
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    {/if}
    {if $settings->set__font_headers == "'Open Sans', Helvetica, Arial, sans-serif" || $settings->set__font_default == "'Open Sans', Helvetica, Arial, sans-serif"}
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    {/if}
    {if $settings->set__font_headers == "'Slabo 13px', Helvetica, Arial, sans-serif" || $settings->set__font_default == "'Slabo 13px', Helvetica, Arial, sans-serif"}
    <link href='https://fonts.googleapis.com/css?family=Slabo+13px&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    {/if}
    {"styles.css"|asset_url:stylesheet_tag}
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    {head_content}
    {hook position="base_head_end"}
    {if $template == 'product'}
        {hook position="product_head_end"}
    {elseif $template == 'cart'}
        {hook position="cart_head_end"}
    {/if}
</head>
<body
    id="page-{$template}"
    class="{if isset($collection)}{$collection->url}{/if}{if isset($category)}{$category->url}{/if}"
>

{if $template == 'home' && $settings->use_bg_image}
<div id="page-background" style="background-image: url('{{{$settings->bg_image_url}|asset_url}}')"></div>
{/if}

{if $settings->use_sliding_mobile_menu == '1'}
{snippet file="mobile_menu"}
{/if}
{if $template == 'category' || $template == 'collection' || $template == 'vendor' || $template == 'home'}
{snippet file="mobile_list_nav"}
{snippet file="mobile_filters"}
{/if}

{if $template != 'cart' && $settings->show_sliding_cart_widget}
    <div class="shb-curtain"></div>
{/if}
{if $settings->use_sliding_mobile_menu == '1'}
<div id="page">
{/if}
<div id="shbNotification"  class="{if $messages.success} success{elseif $messages.error} error{/if}">
    <div class="container">
        <div id="shopMessage">
            {if isset($messages) && $messages.success || isset($messages) && $messages.error}
                {if $messages.success}
                    <p class="success">{$messages.success}</p>
                {elseif $messages.error}
                    <p class="error">{$messages.error}</p>
                {/if}
            {/if}
        </div>
    </div>
</div>

{if $settings->show_info_bar}
    <div class="shb-info-bar align-center" data-autoclose="{$settings->info_bar_autoclose}" data-autoclose-time="{$settings->info_bar_autoclose_time}">
        <div class="container">
            <p>{trans}store_theme_translations.info_bar_text{/trans}</p>
        </div>
        {if $settings->info_bar_show_close_button}<span class="shb-info-bar-close"><i class="shb-icon shb-icon-close-thin"></i></span>{/if}
    </div>
{/if}

<!-- ### HEADER ### -->

<!-- header_2_1577566042244 -->
{snippet file="search_widget"}
<header class="shb-header-2">
    <div class="container is-short">
        <div class="columns unsticky-after-this shb-header-top is-vertical-center is-vertical-marginless">
            {if $settings->header_show_social}
                <div class="column is-hidden-mobile">
                    <ul class="shb-list-inline shb-header-social">
                        {if $settings->show_facebook}
                        <li>
                            <a href="{$settings->facebook_url}" aria-label="Facebook" target="_blank" rel="noopener nofolow"
                                 class="shb-icon shb-icon-facebook"></a>
                        </li>
                        {/if}
                        {if $settings->show_twitter}
                        <li>
                            <a href="{$settings->twitter_url}" aria-label="Twitter" target="_blank" rel="noopener nofolow"
                                 class="shb-icon shb-icon-twitter"></a>
                        </li>
                        {/if}
                        {if $settings->show_instagram}
                        <li>
                            <a href="{$settings->instagram_url}" aria-label="Instagram" target="_blank" rel="noopener nofolow"
                                 class="shb-icon shb-icon-instagram-circle"></a>
                        </li>
                        {/if}
                        {if $settings->show_pinterest}
                        <li>
                            <a href="{$settings->pinterest_url}" aria-label="Pinterest" target="_blank" rel="noopener nofolow"
                                 class="shb-icon shb-icon-pinterest"></a>
                        </li>
                        {/if}
                        {if $settings->show_youtube}
                            <li>
                                <a href="{$settings->youtube_url}" aria-label="YouTube" target="_blank" rel="noopener nofolow"
                                     class="shb-icon shb-icon-youtube-circle"></a>
                            </li>
                        {/if}
                    </ul>
                </div>
            {/if}
            <div id="logo"
                 class="column align-center">
                {if $settings->use_logo_image}
                    <a href="{$ROOT}/"><img class="shb-logo_img" src="{$settings->content_logo|asset_url}"/></a>
                {else}
                    <a href="{$ROOT}/">{$shop->name|ucfirst}</a>
                {/if}
            </div>
            <div class="column shb-right-header is-hidden-mobile align-right">
                <ul class="shb-list-inline">
                    {if $shop->customer_accounts_enabled}
                        <li class="shb-user-widget">
                            {if $customer}
                                <a href="{reverse_url name=shop_client_orders}"><i class="shb-icon shb-icon-account"></i></a>
                            {else}
                                <a href="{reverse_url name=shop_client_login}">{trans}store_theme_translations.log_in{/trans}</a>
                            {/if}
                        </li>
                    {/if}
                    {if $settings->lang_switcher}
                        <li class="shb-lang-widget">
                            <select class="select select-small transparent-label" name="lang" tabindex="0">
                                <option value="{$settings->lang_switcher_1_url}">{$settings->lang_switcher_1_title}</option>
                                <option value="{$settings->lang_switcher_2_url}">{$settings->lang_switcher_2_title}</option>
                            </select>
                        </li>
                    {/if}
                    {if $shop->currencies && ($shop->currencies|count > 1)}
                        <li class="shb-currency-widget">
                            <select class="select select-small transparent-label" name="currency" tabindex="0">
                                {foreach from=$shop->currencies item=currency}
                                    <option value="{$currency->currency_code}"
                                            {if $currency->currency_code == $shop->currency_code}selected="selected"{/if}>{$currency->currency}</option>
                                {/foreach}
                            </select>
                        </li>
                    {/if}
                    <li placeholder-header>
                        <div app-wishlist-show-widget-button></div>
                    </li>
                    <li class="shb-search-widget">
                        <a href="#" search-widget-trigger class="shb-search-widget-trigger"><i class="shb-icon shb-icon-search"></i></a>
                    </li>
                    <li class="shb-cart-widget">
                        <a {if $settings->show_sliding_cart_widget && $template != 'cart'}cart-widget-trigger{/if} href="{reverse_url name='shop_cart'}" class="shb-cart-icon-wrapper">
                            <span cart-widget-total-count class="shb-cart-widget-total-count">{$cart->item_count}</span>
                            <i class="shb-icon shb-icon-cart-with-items"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="shb-navbar nav-bar-top-border nav-bar-bottom-border align-center {if $settings->fixed_header == 1}sticky-bar sticky-after-this{/if}">
        <div class="container is-short">
            {snippet file="main_nav"}
        </div>
    </div>
</header>
<!-- END header_2_1577566042244 -->







{$page_content}

<!-- ### FOOTER ### --><!-- footer_2_1572469632926 -->
<footer class="shb-footer-2">
  <div class="container">
    <div class="columns is-vertical-center">
      {if $settings->footer_show_social}
      <div class="column is-12-mobile is-3-desktop">
        <div class="shb-footer-social">
          {if $settings->show_facebook}
          <a href="{$settings->facebook_url}" aria-label="Facebook" target="_blank" rel="noopener nofolow" class="shb-icon shb-icon-facebook"></a>
          {/if}
          {if $settings->show_twitter}
          <a href="{$settings->twitter_url}" aria-label="Twitter" target="_blank" rel="noopener nofolow" class="shb-icon shb-icon-twitter"></a>
          {/if}
          {if $settings->show_instagram}
          <a href="{$settings->instagram_url}" aria-label="Instagram" target="_blank" rel="noopener nofolow" class="shb-icon shb-icon-instagram-circle"></a>
          {/if}
          {if $settings->show_pinterest}
          <a href="{$settings->pinterest_url}" aria-label="Pinterest" target="_blank" rel="noopener nofolow" class="shb-icon shb-icon-pinterest"></a>
          {/if}
          {if $settings->show_youtube}
            <a href="{$settings->youtube_url}" aria-label="YouTube" target="_blank" rel="noopener nofolow" class="shb-icon shb-icon-youtube-circle"></a>
          {/if}
        </div>
      </div>
      {/if}
      {if $settings->show_ft_menu_1 && $settings->ft_menu_1 != ""}
      <div class="column is-12-mobile is-6-desktop {if !$settings->footer_show_social}is-offset-3-desktop{/if}">
        <ul class="shb-footer-nav">
          {foreach from=$menulists->{$settings->ft_menu_1}->links item="menu"}
          <li><a href="{$menu->url}">{$menu->title}</a></li>
          {/foreach}
        </ul>
      </div>
      {/if}
      <div class="column is-12-mobile is-3-desktop {if !$settings->show_ft_menu_1}is-9-desktop{/if} {if !$settings->show_ft_menu_1 && !$settings->footer_show_social}is-12-desktop{/if}">
        <p class="shb-footer-copyright">
            Copyright &copy; {$smarty.now|date_format:"%Y"} {$shop->name}
            &hearts;
            <a
                title="Sprawdź najprostszy sposób sprzedaży w internecie"
                href="https://www.shoplo.pl/?utm_source={$shop->permanent_domain}&utm_medium=referral&utm_campaign=shoplo-store-footer"
				rel="noopener"
                target="_blank"
            >
                Shoplo
            </a>
        </p>
      </div>
    </div>
  </div>
</footer>
<!-- END footer_2_1572469632926 -->




{if $settings->use_sliding_mobile_menu == '1'}
</div>
{/if}

{if $template != 'cart' && $settings->show_sliding_cart_widget}
    {if $settings->cart_widget_type == 'right'}
        {snippet file="cart_widget_right"}
    {elseif $settings->cart_widget_type == 'top'}
        {snippet file="cart_widget_top"}
    {elseif $settings->cart_widget_type == 'bottom'}
        {snippet file="cart_widget_bottom"}
    {/if}
{/if}

<script type="text/javascript">
    /*<![CDATA[*/
    {if !$is_https}
    var ROOT = "{$ROOT}";
    {else}
    var ROOT = "{$ROOT|replace:'http':'https'}";
    {/if};
    var AUTH = "{$token}";
    /*]]>*/
</script>
<script type="text/javascript" src="/js/storefront!currency-4363199.js"></script>

<script>
var useDynamicCart = '{$settings->show_sliding_cart_widget}',
    dynamicCartType = '{$settings->cart_widget_type}',
    cart_free_delivery_info = '{trans}store_theme_translations.cart_free_delivery_info{/trans}',
    cart_free_delivery_price = '{$settings->cart_free_delivery_price_form}',
                cart_currency = '{$shop->currency}',
    {if $settings->show_cart_free_delivery}
    cart_free_delivery_show = true,
    {else}
    cart_free_delivery_show = false,
    {/if}
    {if $settings->show_cart_default_delivery_cost}
    cart_delivery_cost_show = true,
    {else}
    cart_delivery_cost_show = false,
    {/if}
    cart_delivery_info_show = '{$settings->show_cart_default_delivery_info}',
    cart_delivery_cost = '{$settings->cart_default_delivery_cost|floatval}';
</script>
{"plugins.js"|asset_url:script_tag}
{if $settings->show_search_autocompleter && $shop->hasAccessToLivesearch()}
    {"autocompleter.js"|asset_url:script_tag}
{/if}
{"main.js"|asset_url:script_tag}
{"sliding-menu.js"|asset_url:script_tag}
{"cart.js"|asset_url:script_tag}
{"shoploAJAX.js"|asset_url:script_tag}

{if $template == 'product'}
    {"variants.js"|asset_url:script_tag}
{elseif $template == 'category' || $template == 'collection' || $template == 'vendor' || $template == 'search'}
    {"filters.js"|asset_url:script_tag}
{/if}

<!--modern-layout-v2-->

<!-- Place this tag in your head or just before your close body tag. -->
{if $template == 'product'}
    {hook position="product_body_end"}
{elseif $template == 'cart'}
    {hook position="cart_body_end"}
{/if}
{hook position="base_body_end"}
{"product_3.js"|asset_url:script_tag}
</body>
</html>
