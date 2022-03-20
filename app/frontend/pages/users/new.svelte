<script>
  import { useForm, inertia } from '@inertiajs/inertia-svelte'
  import { onMount } from 'svelte';

  let form = useForm('player', {email: '', password: '', name: ''})
  onMount(function() {
    document.getElementById('username').focus();
  })
  function createUser() {
    $form.post(`/users`, {preserveScroll: true})
  }
</script>

<main class="container">


  <h2>Are you ready to vibe?</h2>
  <form on:submit|preventDefault={createUser}>
    <p>
      <span class="username">
        <span class="prefix">vibe.tokyo/</span><input id="username" type="text" placeholder="yourname" bind:value={$form.name}>
      </span>
      {$form.errors.name?.[0] || ''}
    </p>
    <p>
      <label for="email" class:error={$form.errors.email}>Email {$form.errors.email || ''}</label><br>
      <input name="email" type="email" placeholder="Email Address" bind:value={$form.email} >
    </p>
    <p>
      <label for="password" class:error={$form.errors.password}>Password {$form.errors.password  || ''}</label><br>
      <input name="password" type="password" placeholder="Password" bind:value={$form.password} >
    </p>
    <p>
      <button>Sign up</button>
    </p>
    <p>
      Already signed up? <a href="/login" use:inertia>Log in here</a>
    </p>
  </form>
</main>

<style>
  #username {
    border: none;
    padding: 0;
  }
  .username {
    padding: 0.5rem;
    border-bottom: 1px solid rgb(212, 56, 129);;
    border-radius: 0.25rem;
    display: inline-block;
  }
</style>