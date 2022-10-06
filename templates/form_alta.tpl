<h4>Formulario de alta</h4>
<form action="insertar" method="POST"> <!--DEBO HACER UN SELECT PARA EL ID TIPO DE PROPIEDAD -->
    <div class="mb-3 d-flex m-2">
            <label class="form-label m-2">Direccion</label>
            <input type="text" class="form-control" name="direccion">
    </div>
    <div class="d-flex">
        <div class="mb-3 d-flex">
            <label class="form-label m-2">Habitaciones</label>
            <input type="number" class="form-control" name="habitaciones" min="0">
        </div>
        <div class="mb-3 d-flex">
            <label class="form-label m-2">Baños</label>
            <input type="number" class="form-control" name="banios" min="0">
        </div>
    </div>
    <div class="d-flex">
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="tipo_propiedad">
        <option selected>Tipo Propiedad</option>
        {foreach from=$tiposPropiedad item=tipo}
            <option value={$tipo->id}>{$tipo->tipo}</option>
        {/foreach}
        </select>

        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="patio">
            <option selected>Patio</option>
            <option value="Si">Si</option>
            <option value="No">No</option>
        </select>
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="contrato">
            <option selected>Tipo Contrato</option>
            <option value="Alquiler">Alquiler</option>
            <option value="Venta">Venta</option>
        </select>
    </div>
    <div class="d-flex">
        <div class="input-group mb-3">
            <label class="m-2">Precio alquiler</label>
            <span class="input-group-text">$</span>
            <input type="text" class="form-control" name="precio_alq">
            <span class="input-group-text">.00</span>
        </div>
        <div class="input-group mb-3">
            <label class="m-2">Precio venta</label>
            <span class="input-group-text">USD</span>
            <input type="text" class="form-control" name="precio_vta">
            <span class="input-group-text">.00</span>
        </div>
    </div>
    <button type="submit" class="btn btn-primary m-3">Insertar</button>
</form>
{include file="templates/footer.tpl"}
