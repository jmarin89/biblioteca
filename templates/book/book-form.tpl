
{extends file='layout.tpl'}

{assign var="book" value=$params['book']}

{assign var="categories" value=$params['categories']}
{assign var="authors" value=$params['authors']}

{block name=content}
    <div id="book" class="card">
        <div class="row">
            <div class="inner flex f-wrap full-width">
                <h2 class="full-width">Libro</h2>
                <form class="form-fields" action="?page=edit_book&id={$book->id_book}" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id_book" value="{$book->id_book}">
                    <input type="hidden" name="save" value="1">
                    <div class="form-group">
                        <label>Título</label>
                        <div>
                            <input class="form-control" name="title" type="text" value="{$book->title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Descripción</label>
                        <div>
                            <textarea class="form-control" name="description">{$book->description}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>ISBN</label>
                        <div>
                            <input class="form-control" name="ISBN" type="text" value="{$book->ISBN}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Categoría</label>
                        <div>
                            <select class="form-control" name="id_category">
                                <option value="0">-- Elige categoría --</option>
                                {foreach from=$categories item=category}
                                    <option value="{$category->id_category}" {if $category->id_category == $book->id_category}selected{/if}>{$category->name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Autor</label>
                        <div>
                            <select class="form-control" name="id_author">
                                <option value="0">-- Elige autor --</option>
                                {foreach from=$authors item=author}
                                    <option value="{$author->id_author}" {if $author->id_author == $book->id_author}selected{/if}>{$author->pseudonym}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Imagen</label>
                        <div class="flex">
                            <input class="form-control" type="file" name="fileToUpload" id="fileToUpload" onchange="this.style.color = 'black';">
                            <label for="fileToUpload"><span class="">Seleccionar</span></label>
                        </div>
                    </div>
                    <div class="form-buttons flex">
                        <div>
                            <input type="submit" class="btn" value="Guardar">
                        </div>
                        <a href="?page=list_book" id="cancel-me" class="btn btn-dark">
                            <svg class="svg_ico svg_ico_spinner">
                                <use href="#svg_ico_spinner" xlink:href="#svg_ico_spinner"></use>
                            </svg>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
{/block}