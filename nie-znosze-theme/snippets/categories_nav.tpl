<nav class="categories-nav">
    <ul class="categories-nav__list">
    {foreach from=$categories->all item="category"}
    {if $category->top_category}
        <li class="categories-nav__item">
            {$category->title|link_to_category}

            {if $category->has_children}
            <ul class="categories-nav__sublist">
            {foreach from=$category->childs item="child_category"}
                <li class="categories-nav__subitem">
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
