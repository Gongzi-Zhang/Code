use std::io;

fn main() {     // starting point: main function
    println!("Hello, world!");  // calling a macro (with !), rather than calling a funciton (without !)
}

{
    // In rust, variables are immutable by default
    let var;
    let mut string = String::new();
}


{
    io::stdin().read_line(&mut line)
        .expect("Failed to read line");
}
