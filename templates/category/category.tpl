
{extends file='layout.tpl'}

{assign var="category" value=$params['category']}

{assign var="books" value=$category->getBooksByCategory($category->id_category)}

{block name=content}
    <div id="category" class="card">
        <div class="row">
            <div class="inner f-wrap">
                <div class="title">
                    <div>{$category->name}</div>
                </div>
                {if ($category->description != null)}
                    <div class="description">{$category->description}</div>
                {/if}
                {block name='category_buttons'}
                    {include file='category/miniatures/category-buttons.tpl' category=$category}
                {/block}
            </div>
        </div>
    </div>
    {if (count($books) > 0)}
        <div id="books" class="books category-books">
            <div class="row">
                <div class="inner f-center f-wrap">
                    <h1 class="full-width">
                        <span>Libros en esta categoría</span>
                    </h1>
                    {foreach from=$books item=book}
                        {block name='book_miniature'}
                            {include file='book/miniatures/book-item.tpl' book=$book}
                        {/block}
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}
{/block}