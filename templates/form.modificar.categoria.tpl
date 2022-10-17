{include file="templates/header.tpl"}


<div class="container mt-5">
    <form action='modificarCategoria/{$detalleTipoPropiedad->id}' method="POST"> 
        <div class="mb-3 d-flex m-2">
                <label class="form-label m-2">Tipo Propiedad: </label>
                <input type="text" class="form-control" name="tipo" value="{$detalleTipoPropiedad->tipo}">
        </div>
        <button type="submit" class="btn btn-dark m-3">Modificar</button>
    </form>
</div>

{include file="templates/footer.tpl"}
