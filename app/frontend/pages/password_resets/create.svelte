<script>
  import { inertia } from '@inertiajs/inertia-svelte'
</script>

<main class="container">
  <h2>Email sent</h2>

  <p>
    You should receive an email shortly with a link to change your password.
  </p>

  <a href="/session/new" use:inertia>Back to log in</a>
</main>