
{block name='category_miniature'}
    <article class="card-item cat-item">
        <div class="card-inner">
            <div class="card-name cat-name flex f-center" title="{$category->name}">
                <a href="?page=view_category&id={$category->id_category}" title="{$category->name}">
                    {$category->name}
                </a>
            </div>
            {block name='category_buttons'}
                {include file='category/miniatures/category-buttons.tpl' category=$category}
            {/block}
        </div>
    </article>
{/block}