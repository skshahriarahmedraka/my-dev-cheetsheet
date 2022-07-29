import { parseCookie } from "$lib/cookie";

export function getSession({headers}){
    const user = parseCookie(headers.cookie).user

    return {
        user 
    }
}