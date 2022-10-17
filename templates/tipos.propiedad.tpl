{include file="templates/header.tpl"}
    <div>
        {if $error}   
            <div class="alert alert-danger">
                {$error}
            </div>
        {/if}
    </div>
    <table class='table table-bordered border-dark mt-3 text-center'>
        <thead>
            <th class='table-primary'>Tipos Propiedad</th>
            <th class='table-primary'>Ver</th>
            {if isset($smarty.session.IS_LOGGED)}
                <th class='table-primary'>Modificar</th>
                <th class='table-primary'>Borrar</th>
            {/if}
        </thead>
        <tbody class='table-group-divider'>
            {foreach from=$tiposPropiedad item=tipo}
            <tr>
                <td>{$tipo->tipo}</td>
                <td><a class="text-black" href="verItemsSegunTipoPropiedad/{$tipo->id}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                        </svg>
                    </a>
                </td>
                {if isset($smarty.session.IS_LOGGED)}
                    <td><button class='btn btn-dark'>
                        <a class="text-white" href="formModificarCategoria/{$tipo->id}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                            <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
                        </svg>
                        </a>
                    </button></td>
                    <td><button class='btn btn-danger'>
                        <a class="text-white" href="borrarCategoria/{$tipo->id}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                            </svg>
                        </a>
                    </button></td>
                {/if}
            </tr>
            {/foreach}
        </tbody>
    </table>
    {if isset($smarty.session.IS_LOGGED)}
        <h3>Agregar tipo propiedad</h3>
        <form action='insertarCategoria' method="POST"> 
            <div class="mb-3 d-flex m-2">
                <label class="form-label m-2">Tipo Propiedad</label>
                <input type="text" class="form-control" name="tipo" required>
            </div>
            <button type="submit" class="btn btn-dark m-3">Insertar</button>
        </form>
    {/if}
   
{include file="templates/footer.tpl"}