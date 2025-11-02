fn main () {
    let future = my_func();
    futures::executor::block_on(future);
}


async fn my_func() {
    println!("Hello, sk shahriar ahmed raka!");
}

// this async function is implimented like this 

fn my_func() -> impl Future<Output = ()> {
    println!("Hello, sk shahriar ahmed raka!");
}

trait Future {
    type Output;
    fn poll(&mut self,wake: fn()) -> Poll<Self::Output>;
}

enum Poll<T> {
    Ready(T),
    Pending,
}

