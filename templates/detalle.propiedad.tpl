{include file="templates/header.tpl"}
    <ul class="list-group">
    {foreach from=$detalles item=detalle}
        <li class="list-group-item list-group-item-light">Tipo Propiedad: {$detalle->tipo}</li>
        <li class="list-group-item list-group-item-light">Direccion: {$detalle->direccion}</li>
        <li class="list-group-item list-group-item-light">Habitaciones: {$detalle->habitaciones}</li>
        <li class="list-group-item list-group-item-light">Baños: {$detalle->banios}</li>
        {if {$detalle->patio}== 1}
            <li class="list-group-item list-group-item-light">Patio: Si</li>
        {else}
            <li class="list-group-item list-group-item-light">Patio: No</li>
        {/if}
        <li class="list-group-item list-group-item-light">Tipo contrato: {$detalle->tipo_contrato}</li>
        <li class="list-group-item list-group-item-light">Precio: {$detalle->moneda} {$detalle->precio}</li>
    {/foreach}
    </ul>
    <a href="listar">Volver</a>
{include file="templates/footer.tpl"}
