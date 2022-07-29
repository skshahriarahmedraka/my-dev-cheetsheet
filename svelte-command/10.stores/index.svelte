<script lang="ts">
    import {page,getStores } from '$app/stores'

    let url,params
    $:  ({url , params} = $page) 
    console.log("🚀 ~ file: index.svelte ~ line 6 ~ params", params)
    console.log("🚀 ~ file: index.svelte ~ line 6 ~ url", url)
    // URL : {origin:"http://localhost:3000".protocol:'http:',username:"",password:'',host:"localhost:3000"}
    // params: {shop:"sony",itemname:"wf"}
    
</script>

<style>
    /* your styles go here */
</style>

<!-- markup (zero or more items) goes here -->