
NIM_CPU := arm
NIMBLE := _nimble
NIMLIB := $(shell nim dump file.json 2>&1 | grep lib | sort | head -n1 )
NIMCACHE := _nimcache

all: nim

nim: clean
	nim c \
		--gc:arc \
		-d:debug \
		--no_main \
		--nim_cache:"$(NIMCACHE)32" \
		--nimble_path:"$(NIMBLE)/pkgs" \
		--compile_only \
		--gen_script \
		--cpu:arm \
		libwidgetlords_nifs.nim

	cp -v $(NIMLIB)/nimbase.h  $(NIMCACHE)32/nimbase.h

	nim c \
		--gc:arc \
		-d:debug \
		--no_main \
		--nim_cache:"$(NIMCACHE)64" \
		--nimble_path:"$(NIMBLE)/pkgs" \
		--compile_only \
		--gen_script \
		--cpu:amd64 \
		libwidgetlords_nifs.nim

	cp -v $(NIMLIB)/nimbase.h  $(NIMCACHE)64/nimbase.h

# test-local: clean
# 	nim c \
# 		--nim_cache:"$(NIMCACHE)" \
# 		--nimble_path:"$(NIMBLE)/pkgs" \
# 		itsy_tcp_server.nim

# 	cp -v $(NIMLIB)/nimbase.h  $(NIMCACHE)/nimbase.h

clean:
	rm -Rf $(NIMCACHE)32
	rm -Rf $(NIMCACHE)64
	rm -Rf $(NIMCACHE)
