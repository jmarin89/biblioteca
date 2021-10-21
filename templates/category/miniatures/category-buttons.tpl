
{block name='category_buttons'}
    <div class="buttons">
        <a class="category-edit" href="?page=edit_category&id={$category->id_category}">
            <svg class="svg_ico svg_ico_pencil">
                <use href="#svg_ico_pencil" xlink:href="#svg_ico_pencil"></use>
            </svg>
            <span>Editar</span>
        </a>
        <a class="category-delete" href="?page=delete_category&id={$category->id_category}">
            <svg class="svg_ico svg_ico_bin">
                <use href="#svg_ico_bin" xlink:href="#svg_ico_bin"></use>
            </svg>
            <span>Eliminar</span>
        </a>
    </div>
{/block}