fn main() {
    let crate_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();

    let config = cbindgen::Config {
        include_version: true,
        language: cbindgen::Language::C,
        cpp_compat: true,
        ..Default::default()
    };

    let _wrote: bool = cbindgen::generate_with_config(crate_dir, config)
        .unwrap()
        .write_to_file("include/rusty.h");
}
