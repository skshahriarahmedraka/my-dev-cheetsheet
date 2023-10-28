import type {RequestHandler} from '@sveltejs/kit'

export const get:RequestHandler=async ({request,url})=>{
    console.log(url.searchParams.get("name"))
    console.log(url.searchParams.get("email_address"))

    return {
        body:{
            name:url.searchParams.get("name"),
            email_address:url.searchParams.get("")
        }
    }

}