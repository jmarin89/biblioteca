
{extends file='layout.tpl'}

{assign var="authors" value=$params['authors']}

{block name=content}
    {if (count($authors) > 0)}
        <div id="authors" class="card-container">
            <div class="row">
                <div class="inner f-wrap f-center">
                    <h1 class="full-width">
                        <span>Autores</span>
                        <div class="main-button full-width flex f-center">
                            <a class="book-author btn" href="?page=add_author">
                                <svg class="svg_ico svg_ico_plus">
                                    <use href="#svg_ico_plus" xlink:href="#svg_ico_plus"></use>
                                </svg>
                                <span>Añadir</span>
                            </a>
                        </div>
                    </h1>
                    {foreach from=$authors item=author}
                        {block name='author_miniature'}
                            {include file='author/miniatures/author-item.tpl' author=$author}
                        {/block}
                    {/foreach}
                </div>
            </div>
        </div>
    {else}
        <p>No hay autores disponibles.</p>
    {/if}
{/block}