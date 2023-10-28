import {page} from '$app/stores'
import {get} from 'svelte/store'

export function getItemName(){
    return get(page).params.itemname 
}