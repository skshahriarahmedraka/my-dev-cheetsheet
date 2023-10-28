<script context="module" lang="ts">

    export async function load({params,fetch}){
    console.log("🚀 ~ file: root layout load")
        
        const response = await fetch(`/${params.shop}`)
        const data =await response.json()
        return {
            props:data,
            stuff:{
                ratings:data.ratings
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