{if $color_pallete->values}
{assign var='pallete' value=[]}
{foreach from=$color_pallete->values item="color" key="i"}
{append var='pallete' value=$color index=$i|lower}
{/foreach}
{/if}

{if $smarty.server.REQUEST_URI|strstr:'properties' || $smarty.server.REQUEST_URI|strstr:'sort' || $settings->show_sidebar_on_load}
{assign filters_active 1}
{else}
{assign filters_active 0}
{/if}

{assign var='all_products' value=$shop->all_products}

<div class="shb-product-list-2 shb-category">
    <div class="container">
        <div class="container shb-filters is-hidden-mobile">
            <div class="columns">
                {if $settings->category_2_show_categories_nav}
                <div class="column is-9">
                    <div class="shb-categories-list-inline shb-list-inline">
                        {$categories->createListView('wszystkie', 'categories', 'active')}
                    </div>
                </div>
                {/if}
                {if $settings->category_2_show_filters_sort}
                <div class="column">
                    <section class="shb-filters-filter-section shb-filters-filter-sort"  data-filter-type="filter-sort">
                        <span>
                            {trans}store_theme_translations.sort{/trans}:
                        </span>
                        <select class="select select-small" name="sort">
                            <option value="0">{trans}store_theme_translations.no_filters{/trans}</option>
                            <option value="sort=price">{trans}store_theme_translations.from_cheapest{/trans}</option>
                            <option value="sort=price&order=desc">{trans}store_theme_translations.from_most_expensive{/trans}</option>
                            <option value="sort=title">{trans}store_theme_translations.filter_by_name{/trans}</option>
                            <option value="sort=title&order=desc">{trans}store_theme_translations.filter_by_name_reverse{/trans}</option>
                        </select>
                    </section>
                </div>
                {/if}
            </div>
        </div>

        <div class="shb-mobile-filters-wrapper is-hidden-tablet">
            <a href="#filtersMobile" id="filtersMobileToggle" class="shb-btn shb-btn-dark shb-btn-large shb-btn-with-icon shb-btn-full-width">
                {trans}store_theme_translations.filter{/trans}
            </a>
            {snippet file="active_filters"}
        </div>

        <div class="container {$grid_class}">
            <div class="columns">
                <div class="column product-list">
                    {if !$all_products}
                    <p class="align-center">{trans}store_theme_translations.no_products{/trans}</p>
                    {else}
                    <div class="columns is-mobile">
                        {foreach from=$all_products item="p" name="list"}

                        {assign var=productUrlName value="shop_product_within_category"}

                        {assign var=productCategoryUrl value=""}
                        {foreach from=$p->categories item="product_category"}
                            {assign var=productCategoryUrl value={$product_category->url}}
                        {/foreach}
            
                        {assign var=productUrl value={reverse_url name=$productUrlName category_name=$productCategoryUrl product_name=$p->url}}

                        <div class="{$product_col_class}">
                            {snippet file="product_view_1" img_with_sidebar=$home_show_sidebar}
                        </div>
                        {/foreach}
                    </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>
