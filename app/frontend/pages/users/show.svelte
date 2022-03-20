<script>
  import { inertia } from '@inertiajs/inertia-svelte'
  export let user
  
</script>

<svelte:head>
  <title>{user.name} - Vibe Tokyo</title>
</svelte:head>

<main class="container">
  <h2>{user.name}</h2>
  <a use:inertia href="/invest">Invest</a>
</main>

<style>
  h3 {
    margin-top: 1rem;
  }
</style>