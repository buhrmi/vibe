<script>
  import { useForm } from '@inertiajs/inertia-svelte';
  let form = useForm('reset', {password: ''})
  
  $: if ($form.password && $form.password !== $form.password_confirmation) {
    $form.errors.password_confirmation = 'does not match'
  }
  else {
    delete $form.errors.password_confirmation 
  }
</script>

<main class="container">
  <h2>Set new password</h2>
  <p>
    Please choose a new password.
  </p>
    
  <form on:submit|preventDefault={() => $form.delete(document.location)}>
    <p>
      <label for="password" class:error={$form.errors.password}>Password {$form.errors.password  || ''}</label><br>
      <input name="password" type="password" bind:value={$form.password} placeholder="New password"/>
    </p>

    <p>
      <label for="password_confirmation" class:error={$form.errors.password_confirmation}>Password confirmation {$form.errors.password_confirmation  || ''}</label><br>
      <input name="password_confirmation" type="password" bind:value={$form.password_confirmation} placeholder="Confirm password"/>
    </p>
    
    <button disabled={$form.errors.password_confirmation}>Save password</button>
  </form>
</main>