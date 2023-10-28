<script context="module" lang="ts">
    export async function load({params,fetch,stuff}){
        console.log("🚀 ~ file: __layout.svelte  shop load")
        const response = await fetch(`/${params.shop}`)
        const data =await response.json()
        return {
            props:{
                ...data ,
                rstings:stuff.ratings
            }
        }
    }
    
</script>
<script lang="ts" >
    
</script>

<style>
    /* your styles go here */
</style>

<!-- markup (zero or more items) goes here -->