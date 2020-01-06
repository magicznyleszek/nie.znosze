<script type="application/ld+json" product-structured-data="{$product->id}">
{literal}
    {
  "@context": "https://schema.org/",
  "@type": "Product",
  "name": "{/literal}{$product->title}{literal}",
  "image": "{/literal}{$product->main_image|product_img_url:th160}{literal}",
  "description": "{/literal}{$product->description|strip_tags|escape|strip}{literal}",
  "productID": "{/literal}{$product->id}{literal}",
  "mpn": "{/literal}{$product->variants[0]->barcode}{literal}",
  {/literal}
  {if isset($category)}
  {literal}"url": "{/literal}{reverse_url name=shop_product_within_category category_name=$category->url product_name=$product->url}{literal}",
  {/literal}
  {elseif isset($collection)}
  {literal}"url": "{/literal}{reverse_url name=shop_product_within_collection collection_name=$collection->url product_name=$product->url}{literal}",
  {/literal}
  {elseif isset($vendor)}
  {literal}"url": "{/literal}{reverse_url name=shop_product_within_vendor vendor_name=$vendor->url product_name=$product->url}{literal}",
  {/literal}
  {else}
  {literal}"url": "{/literal}{reverse_url name=shop_product product_name=$product->url}{literal}",
  {/literal}
  {/if}
  {literal}
  "sku": "{/literal}{$product->variants['0']->sku}{literal}",
  "brand": {
    "@type": "Brand",
    "name": "{/literal}{$product->vendor->title}{literal}",
	"logo": "{/literal}{$product->vendor->logo|vendor_logo_url:th60}{literal}",
	"url": "{/literal}{$product->vendor->url}{literal}"
  },
  "offers": {
    "@type": "Offer",
	  "url": "{/literal}{reverse_url name=shop_product product_name=$product->url}?id={$product->id}{literal}",
    "priceCurrency": "{/literal}{$shop->currency}{literal}",
    "priceValidUntil": "{/literal}{if $product->on_sale}{$product->promotion->finish_at}{else}2100-01-01{/if}{literal}",
    "price": "{/literal}{$product->price_min|money_without_currency}{literal}",
    {/literal}
	{if $product->available}
	{literal}
	"availability": "http://schema.org/InStock"
	{/literal}
	{else}
	{literal}
	"availability": "http://schema.org/OutOfStock"
	{/literal}
	{/if}
	{literal}
  }
}
{/literal}
</script>
