<script>
  import Popup from '~/components/popup.svelte'
  export let item = {
    name: "Corporate Registration Certificate",
    quote: "Look at this certificate! We're legit as fuck! Wait, who issued this?",
    stats: {
      legitimacy: 2
    }
  }
  export let format = 'text'
  
  function sign(x) { return (x ? x < 0 ? '-' : '+' : '') + x; }
  function formatPrice (x) { return (x / 100).toFixed(2); }
  const stats = {
    legitimacy: (val) => `You gain <strong>${sign(val)} legitimacy</strong> while ${item.name} is in your portfolio.`,
  }
</script>

<Popup>
  {#if format == 'text'}
    <span class={item.rarity}><span class="info name">{item.name}</span></span>
  {/if}  
  <div class="content {item.rarity}" slot="content">
    <div class="name">
      {item.name}
    </div>
    <!-- <div class="price">
      Price: {formatPrice(item.price)}
    </div> -->
    <q>
      {item.quote}
    </q>
    <div class="stats">
      {#if item.stats}
        {#each Object.entries(item.stats) as [stat, value]}
          {@html stats[stat](value)}<br>
        {/each}
      {/if}
    </div>
  </div>

</Popup>



<style>
  .name {
    font-weight: bold;
  }
  .content {
    text-align: left;
  }
  q {
    font-style: italic;
  }
  .stats {
    margin-top: 10px;
  }
</style>