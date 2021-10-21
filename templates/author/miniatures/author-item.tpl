
{block name='author_miniature'}
    <article class="card-item author-item">
        <div class="card-inner">
            <div class="card-name author-pseudonym flex f-center" title="{$author->pseudonym}">
                <a href="?page=view_author&id={$author->id_author}" title="{$author->pseudonym}">
                    {$author->pseudonym}
                </a>
            </div>
            {block name='author_buttons'}
                {include file='author/miniatures/author-buttons.tpl' author=$author}
            {/block}
        </div>
    </article>
{/block}