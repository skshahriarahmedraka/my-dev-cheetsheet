import data from "$lib/data"

export function get (request){
    console.log("Request.query", request.query)
    const numberOfWords= Number(request.params.numberOfWords)
    const startsWith = request.params.startsWith;
    const result = data.filer((word)=>word.startsWith)
    return {
        body : result 
    }
}