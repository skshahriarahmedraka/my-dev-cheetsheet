<script lang="ts" context="module">
    async function load({fetch,params,stuff}){
        console.log("page load")
        const response =await fetch(`/${params.shop}/api/${params.itemname}`)
        const promotionResponse =await fetch(`/api/promotion`)
        const data = await response.json()
        const {promotion}=await promotionResponse.json()
        return {
            props:{
                ...data,
                ratings : stuff.ratings ,
                promotion 

            }
        }
    }
</script>
<script lang="ts">
    import { invalidate} from '$app/navigation'
    export let name
    export let price 
    export let ratings
    export let promotion
    async function refreshPromotion (){
        await invalidate("/api/promotion")
        // will be re run load function in clientside if url match with invalidate url
        console.log(promotion)
    }
</script>

<style>
    /* your styles go here */
</style>

{name} -$ {price} ({promotion}%off)
<div class="">shop Ratings {ratings}</div>

<button class="" on:click="{refreshPromotion}">refresh promotion</button>