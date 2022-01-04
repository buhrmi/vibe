<script>
  import { inertia, useForm } from '@inertiajs/inertia-svelte';

  let form = useForm('user', {email: '', password: ''})
</script>

<main class="container">
  <h2>Welcome back</h2>

  <form on:submit|preventDefault={() => $form.post(`/session`)}>
    <p>
      <label for="email" class:error={$form.errors.email}>Email {$form.errors.email || ''}</label><br>
      <input name="email" type="email" placeholder="Email Address" bind:value={$form.email}>
    </p>
    <p>
      <label for="password" class:error={$form.errors.password}>Password {$form.errors.password  || ''}</label><br>
      <input name="password" type="password" placeholder="Password" bind:value={$form.password}>
      <a use:inertia href="/password_resets/new">Forgot your password?</a>
    </p>
    <p>
      <button name="login">Log in</button>
    </p>
  </form>
  <p>
    Don't have an account? <a href="/signup" use:inertia>Sign up here</a>
  </p>
</main>

<style>

</style>