
{extends file='layout.tpl'}

{assign var="categories" value=$params['categories']}

{block name=content}
    {if (count($categories) > 0)}
        <div id="categories"class="card-container">
            <div class="row">
                <div class="inner f-wrap f-center">
                    <h1 class="full-width">
                        <span>Categorias</span>
                        <div class="main-button full-width flex f-center">
                            <a class="category-add btn" href="?page=add_category">
                                <svg class="svg_ico svg_ico_plus">
                                    <use href="#svg_ico_plus" xlink:href="#svg_ico_plus"></use>
                                </svg>
                                <span>Añadir</span>
                            </a>
                        </div>
                    </h1>
                    {foreach from=$categories item=category}
                        {block name='category_miniature'}
                            {include file='category/miniatures/category-item.tpl' category=$category}
                        {/block}
                    {/foreach}
                    </div>
                </div>
            </div>
        </div>
    {else}
        <p>No hay categorias disponibles.</p>
    {/if}
{/block}