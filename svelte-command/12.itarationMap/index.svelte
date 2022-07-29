<script lang="ts">
import Iphone13a from "../11.NameLayout/iphone13/iphone13@a.svelte"
import Iphone14root from "../11.NameLayout/iphone13/iphone14@root.svelte"
import Index from "../Invalidating/index.svelte"

    let map = new Map()
    map.set('a',2)
    map.set('b',45)
</script>

<style>
    /* your styles go here */
</style>


{#each [...map] as [key,value]}
    <p class="">
        {key} {value}
    </p>
{/each}