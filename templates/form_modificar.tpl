{include file="templates/header.tpl"}

<form class="mt-5" action='modificarItem/{$detalleForm->id}' method="POST"> 
    <div class="mb-3 d-flex m-2">
            <label class="form-label m-2">Direccion</label>
            <input type="text" class="form-control" name="direccion" value="{$detalleForm->direccion}" required>
    </div>
    <div class="d-flex">
        <div class="mb-3 d-flex">
            <label class="form-label m-2">Habitaciones</label>
            <input type="number" class="form-control" name="habitaciones" min="0"  value="{$detalleForm->habitaciones}" required>
        </div>
        <div class="mb-3 d-flex">
            <label class="form-label m-2">Baños</label>
            <input type="number" class="form-control" name="banios" min="0"  value="{$detalleForm->banios}" required>
        </div>
        <div>
            <label>Patio</label>
        </div>
        {if $detalleForm->patio == "1"}
            <div class="form-check">
                <input class="form-check-input" type="radio" name="patio" value="1" checked>
                <label class="form-check-label" for="flexRadioDefault1">Si</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="patio" value="0">
                <label class="form-check-label" for="flexRadioDefault2">No</label>
            </div>
        {else}
            <div class="form-check">
                <input class="form-check-input" type="radio" name="patio" value="1">
                <label class="form-check-label" for="flexRadioDefault1">Si</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="patio" value="0" checked>
                <label class="form-check-label" for="flexRadioDefault2">No</label>
            </div>

        {/if}
    </div>
    <div class="d-flex">
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="tipo_propiedad">
        
        {foreach from=$tiposPropiedad item=tipo}
            {if $tipo->id == $detalleForm->tipo_propiedad_id}
            <option selected value="{$detalleForm->tipo_propiedad_id}">{$detalleForm->tipo}</option>
            {else}
            <option value={$tipo->id}>{$tipo->tipo}</option>
            {/if}
        {/foreach}
        </select>
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="contrato">
            {if $detalleForm->tipo_contrato == "Alquiler"}    
                <option value="Alquiler" selected>{$detalleForm->tipo_contrato}</option>
                <option value="Venta">Venta</option>
            {else if $detalleForm->tipo_contrato == "Venta"}
                <option value="Alquiler">Alquiler</option>
                <option selected value="Venta">{$detalleForm->tipo_contrato}</option>
            {/if}
        </select>
    </div>
    <div class="d-flex">
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="moneda">
            {if $detalleForm->moneda == "$"}  
                <option value="$" selected><span class="input-group-text">{$detalleForm->moneda}</span></option>  
                <option value="USD">USD</option>
            {else if $detalleForm->moneda == "USD"}
                <option value="$"><span class="input-group-text">$</span></option> 
                <option value="USD" selected>{$detalleForm->moneda}</option> 
            {/if}    
        </select>
        <div class="input-group mb-3">
            <label class="m-2">Precio</label>
            <input type="text" class="form-control" name="precio" value="{$detalleForm->precio}" required>
            <span class="input-group-text">.00</span>
        </div>
    </div>
    <button type="submit" class="btn btn-dark m-3">Modificar</button>
</form>
{include file="templates/footer.tpl"}
