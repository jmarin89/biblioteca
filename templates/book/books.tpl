
{extends file='layout.tpl'}

{assign var="books" value=$params['books']}

{block name=content}
    {if (count($books) > 0)}
        <div id="books" class="books">
            <div class="row">
                <div class="inner f-center f-wrap">
                    <h1 class="full-width">
                        <span>Biblioteca</span>
                        <div class="main-button full-width flex f-center">
                            <a class="book-add btn" href="?page=add_book">
                                <svg class="svg_ico svg_ico_plus">
                                    <use href="#svg_ico_plus" xlink:href="#svg_ico_plus"></use>
                                </svg>
                                <span>Añadir</span>
                            </a>
                        </div>
                    </h1>
                    {foreach from=$books item=book}
                        {block name='book_miniature'}
                            {include file='book/miniatures/book-item.tpl' book=$book}
                        {/block}
                    {/foreach}
                </div>
            </div>
        </div>
    {else}
        <p>No hay libros disponibles.</p>
    {/if}
{/block}