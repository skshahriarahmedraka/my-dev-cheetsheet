<script lang="ts" context="module">
    
</script>
<script lang="ts">
    import {page,getStores} from "$app/stores"
    import {getContext} from 'svelte'

    const {page : page1}=getStores()
    getContext() // have to run in context initialization
    let url,params
    $: ({url,params}=$page)
</script>

<style>
    /* your styles go here */
</style>


<button class="" 
    on:click={
        ()=>{
            getContext()
            console.log(get(page1))
        console.log("current item #1 :",$page.params.itemname)
        console.log("current item #2 :",getItemName())
        }
    }
>
    click me
</button>

