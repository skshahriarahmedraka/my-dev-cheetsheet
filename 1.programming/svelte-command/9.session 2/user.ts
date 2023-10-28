export function changeUser(user){
    document.cookie=-`user=;path=/;expires=${Date.now()}`
    session.set(null) 
}