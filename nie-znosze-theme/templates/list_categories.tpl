{assign category_list $categories->all()}

{if $category_list}
  {snippet
    file="product_list_view_2_all_products"
    page_type="all_products"
    grid_class="shb-grid-col-3"
    set_image_ratio={$settings->product_image_ratio}
    product_col_class="column is-12-mobile is-4-tablet"
    product_list_show_add_to_cart = {$settings->category_product_list_show_add_to_cart}
    product_list_show_title = {$settings->category_product_list_show_title}
    product_list_title_limit = {$settings->category_product_list_title_limit}
    product_list_show_variants = {$settings->category_product_list_show_variants}
    product_list_show_variants_on_hover = {$settings->category_product_list_show_variants_on_hover}
  }
{else}
  <div class="container">
    <div class="columns">
      <div class="column">
        <h4>{trans}store_theme_translations.msg_no_categories{/trans}</h4>
      </div>
    </div>
  </div>
{/if}
