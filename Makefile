# Update the contract bindings
bind:
	forge build --root ./contracts
	forge bind --bindings-path ./bindings --root ./contracts --crate-name bindings

# Force overwrite the contract bindings
bindoverwrite:
	forge build --root ./contracts
	forge bind --bindings-path ./bindings --root ./contracts --crate-name bindings --overwrite

# Forge remappings for contract import convenience
remappings:
	(cd contracts; forge remappings > remappings.txt)

# Test all
test:
	forge test --root ./contracts
	cargo test

# Verbose test smart contracts
testcontracts:
	forge test --root ./contracts -vvvv