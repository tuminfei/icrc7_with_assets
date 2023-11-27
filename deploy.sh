#!!/bin/bash

# create candid file
cargo test

# gzip wasm
gzip -c wasm/icrc7_with_assets.wasm > wasm/icrc7_with_assets.wasm.gz

# deploy

dfx deploy icrc7_with_assets --argument '(record {
  tx_window=24;
  permitted_drift=2;
  name="Space";
  symbol="Space";
  minting_authority=opt principal"3yyxm-t5fpe-v32em-ac6lr-xyort-wuscb-dvl4x-3wnwi-hqkyj-xortw-oqe";
  royalties=null;
  royalties_recipient=null;    
  description=opt "ICRC7 Standard Token";
  image=null;    
  supply_cap=null;    
})' --mode reinstall

# mint

dfx canister call icrc7_with_assets icrc7_mint '(record{
  id=100;
  name="Icrc7 100";
  description=opt "100th token of the collection";
  image=null;
  to=record{
  owner=principal"3yyxm-t5fpe-v32em-ac6lr-xyort-wuscb-dvl4x-3wnwi-hqkyj-xortw-oqe";
  subaccount=null;
  };
})'



