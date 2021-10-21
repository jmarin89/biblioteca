
{block name='author_buttons'}
    <div class="buttons">
        <a class="author-edit" href="?page=edit_author&id={$author->id_author}">
            <svg class="svg_ico svg_ico_pencil">
                <use href="#svg_ico_pencil" xlink:href="#svg_ico_pencil"></use>
            </svg>
            <span>Editar</span>
        </a>
        <a class="author-delete" href="?page=delete_author&id={$author->id_author}">
            <svg class="svg_ico svg_ico_bin">
                <use href="#svg_ico_bin" xlink:href="#svg_ico_bin"></use>
            </svg>
            <span>Eliminar</span>
        </a>
    </div>
{/block}