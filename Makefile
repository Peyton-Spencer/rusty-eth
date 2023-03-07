# Update the contract bindings
bind:
	forge build --root ./contracts
	forge bind --bindings-path ./bindings --root ./contracts --crate-name bindings
	@echo '# Ignore the bindgen files which may not match cargo fmt\nignore = [\n    "src"\n]' > bindings/.rustfmt.toml

# Force overwrite the contract bindings
overwritebind:
	forge build --root ./contracts
	forge bind --bindings-path ./bindings --root ./contracts --crate-name bindings --overwrite
	@echo '# Ignore the bindgen files which may not match cargo fmt\nignore = [\n    "src"\n]' > bindings/.rustfmt.toml

# Forge remappings for contract import convenience
remappings:
	(cd contracts; forge remappings > remappings.txt)

# Test all
test:
	@echo FORGE TEST:
	@(cd contracts; source .env; forge test)
	@echo
	@echo CARGO TEST:
	@cargo test

# Verbose test smart contracts
testcontracts:
	@(cd contracts; source .env; forge test -vvvv)