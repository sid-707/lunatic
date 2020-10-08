use super::creator::{spawn, FunctionLookup, MemoryChoice};
use super::ProcessEnvironment;

use smol::future::yield_now;
use wasmtime::Linker;
use anyhow::Result;

/// Add all imports provided by the Lunatic runtime to this instance.
pub fn create_lunatic_imports(linker: &mut Linker, environment: &ProcessEnvironment) -> Result<()> {
    // Lunatic stdlib

    // Yield this process allowing other to be scheduled on same thread.
    let env = environment.clone();
    linker.func("lunatic", "yield", move || env.async_(yield_now()))?;

    // Spawn new process and call a fuction from the function table under the `index` and pass one i32 argument.
    let env = environment.clone();
    linker.func(
        "lunatic",
        "spawn",
        move |index: i32, argument: i32| -> i32 {
            spawn(
                env.engine(),
                env.module(),
                FunctionLookup::TableIndex((index, argument)),
                MemoryChoice::New(18),
            ).detach();
            0
        },
    )?;

    // Create a buffer and send it to the process with the `pid`
    linker.func(
        "lunatic",
        "send",
        |pid: i32, buffer: i32, len: i32| -> i32 { 0 },
    )?;

    // Receive buffer
    linker.func("lunatic", "receive", |buffer: i32, len: i32| -> i32 { 0 })?;

    Ok(())
}