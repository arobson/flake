REBAR=$(shell which rebar || ./rebar)
SYNC_PATH = $(ERL_LIBS)/sync
PROPER_PATH = $(ERL_LIBS)/proper

all: compile

compile:
		@$(REBAR) compile

clean:
		@$(REBAR) clean

distclean: clean
		@$(REBAR) delete-deps

test: app
		@$(REBAR) eunit skip_deps=true

start:
		if test -d $(SYNC_PATH); \
		then exec erl -name flake@127.0.0.1 -setcookie flake -pa $(PWD)/deps/*/ebin -pa $(PWD)/ebin -boot start_sasl -s crypto -run flake; \
		else exec erl -name flake@127.0.0.1 -setcookie flake -pa $(PWD)/deps/*/ebin -pa $(PWD)/ebin -boot start_sasl -s crypto -run flake; \
		fi
