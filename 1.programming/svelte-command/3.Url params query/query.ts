import data from "$lib/data"

export function get(request){
    console.log(request.query)
    // example : request.query=== URLSearchParams{"Numberofwords":"4","startwith":"abc"}

    const numberOfWords= Number(request.query.get("numberofwords"))
    const startsWith= request.query.get("startwith")
    const result =data.filter((word)=>word.startsWith ) // filter data from a data dictionary

    return {
        body: result
    }
}


export function post(request){
    console.log(request.body)
    const {numberofwords,startswith} =request.body 
    const result = data.filter((word)=> word.startswith)
    return{
        body:result
    }
}

import fs from 'fs/promises'
import path from 'path'
import {fileURLPath} from 'url'
export async function get (request){
    return {
        body: JSON.parse(await fs.readFile(shopData,'utf-8'))
    }
}