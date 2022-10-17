{include file="templates/header.tpl"}
<div class="container">
    <h3>{$itemsCategoria[0]->tipo}</h3>
    <table class='table table-bordered border-dark mt-3 text-center'>
        <thead>
            <th class='table-dark'>Direccion</th>
            <th class='table-dark'>Habitaciones</th>
            <th class='table-dark'>Baños</th>
            <th class='table-dark'>Patio</th>
            <th class='table-dark'>Tipo-Contrato</th>
            <th class='table-dark'>Moneda</th>
            <th class='table-dark'>Precio</th>
        </thead>
        <tbody class='table-group-divider'>
            {foreach from=$itemsCategoria item=item}
            <tr>
                <td>{$item->direccion}</td>
                <td>{$item->habitaciones}</td>
                <td>{$item->banios}</td>
                {if {$item->patio} == 1}
                    <td>Si</td>
                {else}
                    <td>No</td>
                {/if}
                <td>{$item->tipo_contrato}</td>
                <td>{$item->moneda}</td>
                <td>{$item->precio}</td>
            </tr>
            {/foreach}
        </tbody>
    </table>
    <a href="listarTiposPropiedad">Volver</a>
</div>
{include file="templates/footer.tpl"}