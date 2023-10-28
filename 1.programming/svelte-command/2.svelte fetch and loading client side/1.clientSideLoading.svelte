<script lang="ts">
    import {onMount} from "svelte"
    let promise 
    async function fetchData(){
        const response  = await fetch("/api/data")
        return await response.json()
    }
    onMount(()=>{
        promise=fetchData()
    })
</script>

<style>
    /* your styles go here */
</style>

<a href="/" class="">Home</a>

{#await promise}
    Loading
{:then result}
    {JSON.stringify(result)}
{/await}