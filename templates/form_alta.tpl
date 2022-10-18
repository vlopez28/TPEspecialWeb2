{include file="templates/header.tpl"}
<form class="container mt-5" action="insertar" method="POST" enctype="multipart/form-data"> 
    <div class="mb-3 d-flex m-2">
            <label class="form-label m-2">Direccion</label>
            <input type="text" class="form-control" name="direccion" required>
    </div>
    <div class="d-flex">
        <div class="mb-3 d-flex">
            <label class="form-label m-2">Habitaciones</label>
            <input type="number" class="form-control" name="habitaciones" min="0" required>
        </div>
        <div class="mb-3 d-flex">
            <label class="form-label m-2">Baños</label>
            <input type="number" class="form-control" name="banios" min="0" required>
        </div>
        <div class="container-input-patio">
            <div>
                <label>Patio</label>
            </div>
            <div>
                <input type="radio" name="patio" value="1"><label for="Si">Si</label>   
                <input type="radio"  name="patio" value="0"><label for="No">No</label>
            </div>
        </div>
    </div>
    
    <div class="d-flex">
        <label>Tipo Propiedad</label>
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="tipo_propiedad"> 
        {foreach from=$tiposPropiedad item=tipo}
            <option value={$tipo->id}>{$tipo->tipo}</option>
        {/foreach}
        </select>
        
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="contrato">  
            <option value="Alquiler">Alquiler</option>
            <option value="Venta">Venta</option>
        </select>
    </div>
    <div class="d-flex">
        <select class="form-select form-select-sm m-2" aria-label=".form-select-sm example" name="moneda">     
            <option value="$"> <span class="input-group-text">$</span></option>
            <option value="USD">USD</option>
        </select>
        <div class="input-group mb-3">
            <label class="m-2">Precio</label>
            <input type="text" class="form-control" name="precio" required>
            <span class="input-group-text">.00</span>
        </div>
    </div>
    <div>
        <input type="file" name="imagen" class="form-control">
    </div>
    <button type="submit" class="btn btn-dark m-3">Insertar</button>
</form>
<div>
    {if $error}   
        <div class="alert alert-danger">
            {$error}
        </div>
    {/if}
</div>
{include file="templates/footer.tpl"}
