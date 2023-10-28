
// query selector 
const form = document.querySelector(".new-item-form") as HTMLFormElement


// imput
const type = document.querySelector("#tyoe") as HTMLSelectElement 
const toform = document.querySelector("#toform") as HTMLInputElement 
const details = document.querySelector("#details") as HTMLInputElement 
const amount = document.querySelector("#amount") as HTMLInputElement 

form.addEventListener('submit', (e: Event) => {
    e.preventDefault()

    console.log(
        type.value,
        toform.value,
        details.value, 
        amount.value 
    )
    
})

//  class 
class Invoice {
    client: string 
    detail: string 
    amount: number  
    constructor(a:string ,b:string ,c:number ) {
        this.client = a 
        this.detail = b
        this.amount = c
        
    }
    format() {
        return `${this.client} owes me $${this.amount} for ${this.detail}`
    }
}

let anotherVoice = new Invoice("raka", "books", 234.45)

let MultiVoice: Invoice[]
MultiVoice.push(anotherVoice)
MultiVoice.push(anotherVoice)
MultiVoice.push(anotherVoice)
console.log(MultiVoice)

// public , private & readonly 


class Myvoice {
    readonly client: string  // constant variable
    private detail: string // private variable can only read & modify in side class 
    public amount: number  //
    constructor(a:string ,b:string ,c:number ) {
        this.client = a 
        this.detail = b
        this.amount = c
        
    }
    format() {
        return `${this.client} owes me $${this.amount} for ${this.detail}`
    }
}
////////////////

class Myvoice2 {
    
    constructor(readonly client: string , private detail: string, public amount: number ) {
    }
    format() {
        return `${this.client} owes me $${this.amount} for ${this.detail}`
    }
}

// generics

const outObj = (obj: object) => {
    let UID = Math.floor(Math.random() * 100)
    return {...obj , UID}
}

let myObj = outObj({ name: "raka", age: "23" })

console.log(myObj)
console.log(myObj.name) //this is a error , cos outObj dont know what property passed as obj 

////////////
const outObj2 = <T>(obj: T) => {
    let UID = Math.floor(Math.random() * 100)
    return {...obj , UID}
}

let myObj2 = outObj2({ name: "raka", age: "23" })

console.log(myObj2)
console.log(myObj2.name) //this is not an error ,cos here obj in outObj2 knows the type passed in
////////////
const outObj3 = <T extends object>(obj: T) => {
    let UID = Math.floor(Math.random() * 100)
    return {...obj , UID}
}

let myObj3 = outObj3({ name: "raka", age: "23" })
let myObjj= outObj3("name") // only take a object 
console.log(myObj3)
console.log(myObj3.name) //this is not an error ,cos here obj in outObj2 knows the type passed in
////////////
const outObj4 = <T extends {name:string}>(obj: T) => {
    let UID = Math.floor(Math.random() * 100)
    return {...obj , UID}
}

let myObj4 = outObj4({ name: "raka", age: "23" })

console.log(myObj4)
console.log(myObj4.name) //this is not an error ,cos here obj in outObj2 knows the type passed in

// tuples
let arr = ["raka", 25, true]
let arr2: [string, number, boolean] = ["ssar", 3423, false]
arr2[0]=1243//error




