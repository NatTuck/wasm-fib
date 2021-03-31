
BIN := /opt/wasi-sdk/bin
CC  := $(BIN)/clang
CFLAGS := -g -O3 -nostartfiles -fvisibility=hidden -Wl,--allow-undefined\
	-Wl,--no-entry,--import-memory,--import-table,--demangle,--no-entry\
	-Wl,--export=fib,--export=hello

fib: fib.c
	$(CC) $(CFLAGS) -o fib.wasm fib.c

fib.wat: fib.wasm
	wasm2wat --ignore -o fib.wat fib.wasm

server:
	python3 -m http.server

clean:
	rm -f *.wasm

.PHONY: clean server
