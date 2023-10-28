

export function get ({params,headers}){
console.log("🚀 ~ file: [item].ts ~ line 4 ~ get ~ headers", headers)
console.log("🚀 ~ file: [item].ts ~ line 4 ~ get ~ headers", headers.cookie)
const user=parseCookie(headers.cookie).user

        return {
            body: data[params.shop][params.item]
        }
}


export function parseCookie(str=""){
    const result ={}
    for (const cookie of str.split(";")){
        const [name,value]= cookie.trim().split("=")
        result[name]=value
    }
    return result
}

const favourite ={ aaa:"waf",bbb:"sfdf"}

export function isFavourite(id,itemname){
    return favourite[id]===itemname
} 