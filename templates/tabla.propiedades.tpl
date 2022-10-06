    {include file="templates/header.tpl"}
       <table class='table table-bordered border-dark mt-3 text-center'>
            <thead>
                <th class='table-dark'>Tipo</th>
                <th class='table-dark'>Direccion</th>
                <th class='table-dark'>Habitaciones</th>
                <th class='table-dark'>Baños</th>
                <th class='table-dark'>Patio</th>
                <th class='table-dark'>Tipo-Contrato</th>
                <th class='table-dark'>Moneda</th>
                <th class='table-dark'>Precio</th>
                <th class='table-dark'>Ver</th>
                <th class='table-dark'>Modificar</th>
                <th class='table-dark'>Borrar</th>
            </thead>
            <tbody class='table-group-divider'>
                {foreach from=$propiedades item=propiedad}
                <tr>
                    <td>{$propiedad->tipo}</td>
                    <td>{$propiedad->direccion}</td>
                    <td>{$propiedad->habitaciones}</td>
                    <td>{$propiedad->banios}</td>
                    <td>{$propiedad->patio}</td>
                    <td>{$propiedad->tipo_contrato}</td>
                    <td>{$propiedad->moneda}</td>
                    <td>{$propiedad->precio}</td>
                    <td><button class='btn btn-info'><a class="text-black" href='verItem/{$propiedad->id}'>Ver</a></button></td>    
                    <td><button class='btn btn-secondary'><a class="text-white" href='modificar/{$propiedad->id}'>Modificar</a></button></td>    
                    <td><button class='btn btn-danger'><a class="text-white" href='borrar/{$propiedad->id}'>Borrar</a></button></td>    
                </tr>
                {/foreach}
            </tbody>
        </table>
       
        