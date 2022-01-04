<script>
  import { useForm, inertia } from '@inertiajs/inertia-svelte'
  import { onMount } from 'svelte';
  import sha256 from '~/utils/sha256';
  import Item from '~/components/item.svelte';


  window.sha256 = sha256
  let form = useForm('player', {email: '', password: '', name: '', salt: ''})
  onMount(function() {
    document.getElementById('username').focus();
  })
  function createUser() {
    let salt = 0
    let hash = ''
    while(!hash.startsWith('000')) {
      salt += 1
      hash = sha256($form.name + salt)
    }
    $form.salt = salt
    $form.post(`/users`, {preserveScroll: true})
  }
</script>

<main class="container">


  <h2>Create your profile</h2>
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
    border: 1px solid #ddd;
    border-radius: 0.25rem;
    display: inline-block;
  }


</style>