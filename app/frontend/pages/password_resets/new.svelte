<script>
  import { useForm } from '@inertiajs/inertia-svelte';
  let form = useForm('reset', {email: ''})
</script>

<main class="container">
  <h2>Reset password</h2>
  <p>
    Need a new password? Coming right up! Enter your email address and we'll send you a link with further instructions.
  </p>

  <form on:submit|preventDefault={() => $form.post(`/password_resets`)}>
    <p>
      <input name="email" type="email" bind:value={$form.email} placeholder="Email Address"/>
    </p>
    <p>
      <button>Send reset link</button>
    </p>
  </form>
</main>