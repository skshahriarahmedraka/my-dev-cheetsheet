<script lang="ts">
    let value = ""
    let count =1 
    let dataPromise

    async function fetchData() {
        // REQUEST WITH QUERY
         const query = new URLSearchParams()
        if (count) {query.set("numberofwords",String(count))}   
        if (value) {query.set("startwith",value)}
        const res = await fetch(`/api/listofwords/${query.toString()}`,{})
        // /api/listofwords/[numberofwords]/[startswith]
        // SAMPLE GET REQUEST 
        const response = await fetch(`/api/listofwords/${count}/${value}`,{})
        return await response.json()

        // POST 
        const response2 = await fetch(`/api/listofwords/`,{
            method:"POST",
            body:JSON.stringify({
                numberofword:count,
                startswith:value,
            })
        })
        return await response2.json()

        // POST 
        const response3 = await fetch(`/api/listofwords/`,{
            method:"POST",
            headers:{
                'Content-Type':'application/json'
            },
            body:JSON.stringify({
                numberofword:count,
                startswith:value,
            })
        })
        return await response3.json()
        //here in response we dont have to JSON.parse(request.body)
        // only request.body will return json object



    }
    
</script>

<style>
    /* your styles go here */
</style>


<label for="">
    starts with
    <input name="first_char" bind:value type="text" class="" />
</label>

<label for="">
    number of words: 
    <input name="count" type="number" class="" bind:value="{count}">
</label>

<button class="" on:click={()=>{dataPromise=fetchData()}}>
    Fetch the list of words 
</button>

{#await dataPromise}
    Loading
{:then data}
    <ul class="">
        {#each data as item}
             <li class="">{item}</li>
        {/each}
    </ul>
{/await}

<hr />
value: { value} <br>
count : {count} <br>