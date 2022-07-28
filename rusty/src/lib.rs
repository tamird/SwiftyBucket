extern crate libc;
extern crate rand;

use rand::Rng;

#[no_mangle]
pub extern "C" fn call_setter_with_random(
    setter: extern "C" fn(u32, *const libc::c_void),
    context: *const libc::c_void,
) {
    setter(rand::thread_rng().gen(), context);
}
