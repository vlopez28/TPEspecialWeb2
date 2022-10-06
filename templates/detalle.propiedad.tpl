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
        <li class="list-group-item list-group-item-light">Precio: {$detalle->moneda} {$detalle->precio}</li>
    {/foreach}
    </ul>
    <a href="listar">Volver</a>
</div>
{include file="templates/footer.tpl"}
