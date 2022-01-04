<script>
  export let opened = false
  let x, y, clientWidth, clientHeight;
  function updateCoords(ev) {
    x = ev.clientX + 6;
    y = ev.clientY + 9;
    if (x + clientWidth > window.innerWidth) {
      x = window.innerWidth - clientWidth;
    }
    if (y + clientHeight > window.innerHeight) {
      y = window.innerHeight - clientHeight;
    }
  }
  
</script>

<svelte:body on:mousemove={updateCoords} />

<span on:mouseenter={() => opened = true} on:mouseleave={() => opened = false}>
  <slot />
</span>

{#if opened}
  <div class="popup" bind:clientWidth bind:clientHeight style="top: {y}px; left: {x}px;">
    <slot name="content"/>
  </div>
{/if}

<style>
  .popup {
    position: fixed;
    pointer-events: none;
    background: white;
    max-width: 400px;
    min-width: 300px;
    padding: 12px;
    z-index: 100;
    box-shadow: 0 0 16px -5px rgba(0,0,0,0.5);
  }
</style>
