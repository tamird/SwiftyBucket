extern crate cheddar;

fn main() {
	cheddar::Cheddar::new().unwrap().run_build("include/rusty.h");
}
