<script>
  import { inertia } from '@inertiajs/inertia-svelte'
  export let clicked
</script>

<main class="container">
  <h1>Are you ready to VIBE?</h1>
  <p>
    You can use Bitcoin to invest in VIBE and become a part of our community. Make sure to send Bitcoin only from an address to which you hold the private keys, that is, do <strong>not</strong> send Bitcoin from an exchange.
  </p>
  {#if clicked}
    <p>Thank you. To invest, please make a deposit to the following address:</p>
    <p>
    <a class="text-xl bg-red/20 p-3 inline-block" href="bitcoin:bc1qccdh533ecmcfzk5uu2s2qy36lvv2s22n07qxlx">bc1qccdh533ecmcfzk5uu2s2qy36lvv2s22n07qxlx</a>
      <a target="_blank" href="https://www.blockchain.com/btc/address/bc1qccdh533ecmcfzk5uu2s2qy36lvv2s22n07qxlx">Check transactions on the Blockchain</a>
    </p>
    <p>Afterwards, please join our <a href="https://discord.gg/nrA8yDzSvf" target="_blank">Discord server</a> for further instructions and announcements.</p>
  {:else}
    <p>Please click the button below to reveal the address.</p>
    <p>
      <button on:click={() => clicked=true}>I will not send Bitcoin from an exchange.</button>
    </p>
    <p>
      <a use:inertia href="/users/new">Nah, fuck that, continue without investing</a>
    </p>
  {/if}
  
</main>
