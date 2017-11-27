extern crate cheddar;

fn main() {
	cheddar::Builder::c99().expect("could not read cargo manifest")
            .name("rusty.h").output_directory("include").run_build();
}
