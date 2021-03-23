init:
	./init_geth.sh
	./init_lighthouse_testnet.sh

clean:
	./clean.sh

refresh: clean init
