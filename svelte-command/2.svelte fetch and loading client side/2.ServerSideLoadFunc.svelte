<script lang="ts" context="module">
    export async function load({fetch}) {
        const response =await fetch("/api/data")
        const result = await response.json()
        return {
            props:{result}
        }
        
    }
</script>

<script lang="ts" >
    export let result 
</script>

<style>
    /* your styles go here */
</style>

<a href="/" class="">Home</a>

{JSON.stringify(result)}