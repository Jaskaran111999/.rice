SHELL = /usr/bin/env bash

SCRIPTS_DIR = /usr/local/bin
SHELL_CONFIG = ~/.zshrc

install:
	@echo "Checking if SCRIPT_NAME and SCRIPT_ALIAS are set"
	test -n "$${SCRIPT_NAME}" && test -n "$${SCRIPT_ALIAS}"

	@echo "Checking if script already exists"
	test -f $(SCRIPTS_DIR)/$(SCRIPT_NAME) && rm $(SCRIPTS_DIR)/$(SCRIPT_NAME) || true
	ln -s $$(pwd)/$(SCRIPT_NAME) $(SCRIPTS_DIR)/$(SCRIPT_NAME)
	echo "alias $${SCRIPT_ALIAS}='$${SCRIPT_NAME}'" >> $(SHELL_CONFIG)
	source $(SHELL_CONFIG)
