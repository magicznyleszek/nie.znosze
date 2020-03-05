<nav class="categories-nav">
    <ul class="categories-nav__list categories-nav__list--vertical">
    {foreach from=$menulists->{$target_menu}->links item="link"}
        <li class="
            categories-nav__item
            {if isset($page) and $page->title == $link->title}categories-nav__item--active{/if}
        ">
            <a href="{$link->url}">{$link->title}</a>
        </li>
    {/foreach}
    </ul>
</nav>
