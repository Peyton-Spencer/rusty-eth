use bindings::counter::Counter;

use ethers::{prelude::Middleware, providers::test_provider::GOERLI, types::Address};

use eyre::Result;
use std::sync::Arc;

#[tokio::main]
async fn main() -> Result<()> {
    let provider = GOERLI.provider();
    let provider = Arc::new(provider);

    // deployed counter address
    let address = "0x2AB57b13a53A5aB77F9FA93519DB560B6293339C".parse::<Address>()?;

    let contract = Counter::new(address, provider);
    let blk = contract.client().get_block_number().await?;
    // contract.set_number(ethers::types::U256::from(867));
    let num = contract.number().call().await?;

    println!("Hello, world! {}", blk);
    println!("contract: {}; counter: {}", contract.address(), num);
    Ok(())
}
