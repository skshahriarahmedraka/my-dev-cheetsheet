<script context="module">
    async function load({fetch,params,url}){
        console.log("params : ",params.shop)
        const query = url.searchParams.get('a')
        console.log("🚀 ~ file: [shop].svelte ~ line 5 ~ load ~ query", query)
        const response = await fetch(`./api/sport`)
        const data =response.json()
        return {
            props: data
        }
    }
</script>
<script>
    
</script>

<style>
    /* your styles go here */
</style>

<!-- markup (zero or more items) goes here -->