<script context="module" lang="ts">
    export async function load({fetch,params,stuff,session}) {
        const response = await fetch (`/${params.shop}/api/${params.itemname}`)
        console.log("session.user",session.user)
        const data = await response.json()
        return {
            props:{
                ...data ,
                ratings:stuff.ratings
            }
        } 
        
    }
    
</script>

<script>
    
</script>

<style>
    /* your styles go here */
</style>

<!-- markup (zero or more items) goes here -->