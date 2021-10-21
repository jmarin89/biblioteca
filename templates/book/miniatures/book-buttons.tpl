
{block name='book_buttons'}
    <div class="buttons">
        <a class="book-edit" href="?page=edit_book&id={$book->id_book}">
            <svg class="svg_ico svg_ico_pencil">
                <use href="#svg_ico_pencil" xlink:href="#svg_ico_pencil"></use>
            </svg>
            <span>Editar</span>
        </a>
        <a class="book-delete" href="?page=delete_book&id={$book->id_book}">
            <svg class="svg_ico svg_ico_bin">
                <use href="#svg_ico_bin" xlink:href="#svg_ico_bin"></use>
            </svg>
            <span>Eliminar</span>
        </a>
    </div>
{/block}