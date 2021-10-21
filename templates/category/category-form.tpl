
{extends file='layout.tpl'}

{assign var="category" value=$params['category']}

{block name=content}
    <div id="category" class="card">
        <div class="row">
            <div class="inner flex f-wrap full-width">
                <h2 class="full-width">Categoria</h2>
                <form class="form-fields" action="?page=edit_category&id={$category->id_category}" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id_category" value="{$category->id_category}">
                    <input type="hidden" name="save" value="1">
                    <div class="form-group">
                        <label>Nombre</label>
                        <div>
                            <input class="form-control" name="name" type="text" value="{$category->name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Descripción</label>
                        <div>
                            <textarea class="form-control" name="description">{$category->description}</textarea>
                        </div>
                    </div>
                    <div class="form-buttons flex">
                        <div>
                            <input type="submit" class="btn" value="Guardar">
                        </div>
                        <a href="?page=list_category" id="cancel-me" class="btn btn-dark">
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