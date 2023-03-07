# Update the contract bindings
bind:
	forge build --root ./contracts
	forge bind --bindings-path ./bindings --root ./contracts --crate-name bindings

# Force overwrite the contract bindings
bindoverwrite:
	forge build --root ./contracts
	forge bind --bindings-path ./bindings --root ./contracts --crate-name bindings --overwrite