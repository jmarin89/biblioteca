
{block name='book_miniature'}
    <article class="book-item">
        <div class="book-inner">
            {if ($book->id_category > 0 && $book->cat_name != null)}
                <div class="book-category">
                    <a href="?page=view_category&id={$book->id_category}" title="{$book->cat_name}" class="btn btn-little">
                        {$book->cat_name}
                    </a>
                </div>
            {/if}
            <div class="book-image">
                <a href="?page=view_book&id={$book->id_book}" title="{$book->title}">
                    <img src="img/b_{$book->id_book}.jpg?{rand()}" title="{$book->title}">
                    <div class="book-see"></div>
                </a>
            </div>
            <div class="book-texts">
                <div class="book-author">
                    {if ($book->id_author > 0 && $book->author_pseudonym != null)}
                        <a href="?page=view_author&id={$book->id_author}" title="{$book->author_pseudonym}">
                            {$book->author_pseudonym}
                        </a>
                    {/if}
                </div>
                <div class="book-title" title="{$book->title}">
                    <a href="?page=view_book&id={$book->id_book}" title="{$book->pseudonym}">
                        {$book->title}
                    </a>
                </div>
                {block name='book_buttons'}
                    {include file='book/miniatures/book-buttons.tpl' book=$book}
                {/block}
            </div>
        </div>
    </article>
{/block}