
{extends file='layout.tpl'}

{assign var="author" value=$params['author']}

{assign var="books" value=$author->getBooksByAuthor($author->id_author)}

{block name=content}
    <div id="author" class="card">
        <div class="row">
            <div class="inner f-wrap">
                <div class="title">
                    <div class="author-pseudonym">{$author->pseudonym}</div>
                </div>
                <div class="description">
                    <p>Nombre completo: {$author->name}</p>
                    <p>Fecha de nacimiento: {$author->date_born}</p>
                    {if ($author->date_death != null)}
                        <p>Fecha de fallecimiento: {$author->date_death}</p>
                    {/if}
                </div>
                {block name='author_buttons'}
                    {include file='author/miniatures/author-buttons.tpl' author=$author}
                {/block}
            </div>
        </div>
    </div>
    {if (count($books) > 0)}
        <div id="books" class="books category-books">
            <div class="row">
                <div class="inner f-center f-wrap">
                    <h1 class="full-width">
                        <span>Libros de este autor</span>
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