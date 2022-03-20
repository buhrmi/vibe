<script>
  import { inertia, page } from '@inertiajs/inertia-svelte'
  export let current_user
  let footerHeight
</script>

<header>
  <div class="container">
    <h1>
      <a href="/" use:inertia><img class="h-12" src="~/images/logo.png" alt="VIBE"></a>
    </h1>
    <div class="user">
      {#if current_user}
        <a href="/{current_user.name}" use:inertia>{current_user.name}</a> | <a use:inertia={{method: 'DELETE'}} href="/session">Log out</a>
      {:else}
        <a use:inertia href="/login">Log in</a>
      {/if}
    </div>
  </div>
</header>

<div class="container">
  {#each ['notice', 'error'] as key}
    {#if $page.props.flash[key]}
      <strong>{ $page.props.flash[key] }</strong>
    {/if}
  {/each}
</div>

<slot />

<div style="height: {footerHeight}px"></div>
<footer bind:clientHeight={footerHeight}>
  <div class="container">
    <hr>
    <p>Copyright &copy; 2022 Vibe Tokyo | <a use:inertia href="/invest">Invest</a> </p>
  </div>
</footer>

<style>
  h1 a {
    text-decoration: none;
  }
  .user {
    text-align: right;
  }
  header {
    /* background: #f4f4f4; */
    padding: 10px 0;
  }
  header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .brand {
    width: 60px;
  }
</style>