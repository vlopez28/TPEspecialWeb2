{include file="templates/header.tpl"}
    <div class="container-detalle-propiedad">
        <div class="container">
            {foreach from=$detalles item=detalle}
                <img src="{$detalle->imagen}" class="imagen-detalle-propiedad rounded" >
            {{/foreach}}
        </div>
        <div class="container">
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
        </div>
    </div>
    <a href="listar">Volver</a>
{include file="templates/footer.tpl"}
