<script lang="ts">
    import {session } from "$app/stores"
</script>

<style>
    /* your styles go here */
</style>

<!-- markup (zero or more items) goes here -->

{$session.user}


<button class="" on:click={()=>{
    document.cookie='user=aaa;path=/'
    $session= {user:'aaa'}
}} >
Switch User
</button>



<button class="" on:click={()=>{
    document.cookie=`user=aaa;path=/;expires=${Date.now()}`
    $session= null
}} >
Log out
</button>