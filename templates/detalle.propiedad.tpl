{include file="templates/header.tpl"}
<div class="container">
    <h3>Detalles Propiedad</h3>
    <ul class="list-group">
    {foreach from=$detalles item=detalle}
        <li class="list-group-item list-group-item-light">Tipo Propiedad: {$detalle->tipo}</li>
        <li class="list-group-item list-group-item-light">Direccion: {$detalle->direccion}</li>
        <li class="list-group-item list-group-item-light">Habitaciones: {$detalle->habitaciones}</li>
        <li class="list-group-item list-group-item-light">Baños: {$detalle->banios}</li>
        <li class="list-group-item list-group-item-light">Patio: {$detalle->patio}</li>
        <li class="list-group-item list-group-item-light">Tipo contrato: {$detalle->tipo_contrato}</li>
        {if $detalle->tipo_contrato == 'Alquiler'}
            <li class="list-group-item list-group-item-light">Precio Alquiler $: {$detalle->precio_alq_pesos}</li>
       
        {elseif $detalle->tipo_contrato == 'Venta'}
            <li class="list-group-item list-group-item-light">Precio Venta usd: {$detalle->precio_vta_usd}</li>
        {/if}
    {/foreach}
    </ul>
    <a href="listar">Volver</a>
</div>
{include file="templates/footer.tpl"}
