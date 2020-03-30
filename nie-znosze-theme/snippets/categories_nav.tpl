<nav class="categories-nav">
    <ul class="categories-nav__list">
        <li class="
            categories-nav__item
            categories-nav__item--important
            {if isset($collection) and $collection->id == 'glowna'}categories-nav__item--active{/if}
        ">
            {"nowości"|link_to_collection:"glowna":"Nowości"}
        </li>

    {foreach from=$categories->all item="main_category"}
    {if $main_category->top_category}
        <li class="
            categories-nav__item
            {if isset($category) and $category->id == $main_category->id}categories-nav__item--active{/if}
            {if $main_category->products_count == 0}categories-nav__item--no-products{/if}
        ">
            {$main_category->title|link_to_category}

            {if $main_category->has_children}
            <ul class="categories-nav__sublist">
            {foreach from=$main_category->childs item="child_category"}
                <li class="
                    categories-nav__item
                    {if isset($category) and $category->id == $child_category->id}categories-nav__item--active{/if}
                    {if $child_category->products_count == 0}categories-nav__item--no-products{/if}
                ">
                    {$child_category->title|link_to_category}
                </li>
            {/foreach}
            </ul>
            {/if}
        </li>
    {/if}
    {/foreach}
    </ul>
</nav>
