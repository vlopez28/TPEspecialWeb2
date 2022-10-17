{include file="templates/header.tpl"}

<div class="mt-5 w-50 mx-auto bg-light text-dark" >
    <h5 class="text-center">Acceso</h5>
    <form  action="verificar" method="POST">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" aria-describedby="emailHelp">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password">
        </div>
        {if $error}
            <div class="alert alert-danger">
                {$error}
            </div>
        {/if}
        
        <button type="submit" class="btn btn-primary mt-3">Entrar</button>
    </form>
</div>
    

{include file="templates/footer.tpl"}