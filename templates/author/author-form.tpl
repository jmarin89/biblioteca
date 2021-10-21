
{extends file='layout.tpl'}

{assign var="author" value=$params['author']}

{block name=content}
    <div id="author" class="card">
        <div class="row">
            <div class="inner flex f-wrap full-width">
                <h2 class="full-width">Autor</h2>
                <form class="form-fields" action="?page=edit_author&id={$author->id_author}" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id_author" value="{$author->id_author}">
                    <input type="hidden" name="save" value="1">
                    <div class="form-group">
                        <label>Nombre</label>
                        <div>
                            <input class="form-control" name="name" type="text" value="{$author->name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Pseudónimo</label>
                        <div>
                            <input class="form-control" name="pseudonym" type="text" value="{$author->pseudonym}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Fecha de nacimiento</label>
                        <div>
                            <input class="form-control" name="date_born" type="text" value="{$author->date_born}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Fecha de fallecimiento</label>
                        <div>
                            <input class="form-control" name="date_death" type="text" value="{$author->date_death}">
                        </div>
                    </div>
                    <div class="form-buttons flex">
                        <div>
                            <input type="submit" class="btn" value="Guardar">
                        </div>
                        <a href="?page=list_author" id="cancel-me" class="btn btn-dark">
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