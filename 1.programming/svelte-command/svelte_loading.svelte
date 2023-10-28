<script context="module">
  export async function load({fetch}){
    console.log("loading json data from remote server")
    const response = await fetch("/api/data")
    const result = await response.json()
    console.log("result : ",result)
    return {
      props:{result}
    }
  }
</script>


<script>
export let result 

</script>
