<script>
  export let clicked
</script>

<main class="container">
  <h1>Are you ready to VIBE?</h1>
  <p>
    We now accept Bitcoin to invest in VIBE. Send Bitcoin only from an address to which you hold the private keys. Do not send Bitcoin from an exchange.
  </p>
  {#if clicked}
    <p>Thank you. Please send Bitcoin to the following address:</p>
    <p>
    <a class="text-xl bg-red/20 p-3 inline-block" href="bitcoin:bc1qccdh533ecmcfzk5uu2s2qy36lvv2s22n07qxlx">bc1qccdh533ecmcfzk5uu2s2qy36lvv2s22n07qxlx</a>
    
      <a target="_blank" href="https://www.blockchain.com/btc/address/bc1qccdh533ecmcfzk5uu2s2qy36lvv2s22n07qxlx">Check transactions on the Blockchain</a>
    </p>
    <p>Afterwards, please join our Discord and wait for further announcements</p>
  {:else}
    <p>Please click the button below to reveal the address.</p>
    <button on:click={() => clicked=true}>I will not send Bitcoin from an exchange.</button>
  {/if}
  
</main>