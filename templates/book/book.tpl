
{extends file='layout.tpl'}

{assign var="book" value=$params['book']}

{assign var="author_pseudonym" value=$book->getPseudonymAuthor()}
{assign var="cat_name" value=$book->getCategoryName()}

{block name=content}
    <div id="book" class="card">
        <div class="row">
            <div class="inner flex f-wrap">
                <div class="book-image">
                    <img src="img/b_{$book->id_book}.jpg?{rand()}" title="{$book->title}">
                </div>
                <div class="book-main">
                    {if ($book->id_category > 0 && $cat_name != null)}
                        <div class="book-category flex f-wrap">
                            <a href="?page=view_category&id={$book->id_category}" title="{$cat_name}" class="btn btn-medium">
                                {$cat_name}
                            </a>
                        </div>
                    {/if}
                    <div class="title">
                        <div>{$book->title}</div>
                        {if ($book->ISBN != null)}
                            <div class="isbn">ISBN: {$book->ISBN}</div>
                        {/if}
                    </div>
                    {if ($book->id_author > 0 && $author_pseudonym != null)}
                        <div class="book-author">Escrito por:
                            <a href="?page=view_author&id={$book->id_author}" title="{$author_pseudonym}">
                                {$author_pseudonym}
                            </a>
                        </div>
                    {/if}
                    {if ($book->description != null)}
                        <div class="description">{$book->description}</div>
                    {/if}
                    {block name='book_buttons'}
                        {include file='book/miniatures/book-buttons.tpl' book=$book}
                    {/block}
                </div>
            </div>
        </div>
    </div>
{/block}