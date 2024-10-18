

fetch:
	wsl -e scripts/git_pull_remote.sh

clean:
	rm -rf */*~ ||:
	rm -rf *~ ||:
	rm -rf */*.bak ||:
	rm -rf *bak ||:
	rm -rf *.log ||:
	rm -rf */*.log ||:
	rm -rf \#* ||:
	rm -rf */\#* ||:
	rm -rf */*/*~ ||:
	rm -rf */*~ ||:
	rm -rf */*/*.bak ||:
	rm -rf */*bak ||:
	rm -rf */*.log ||:
	rm -rf */*/*.log ||:
	rm -rf \#* ||:
	rm -rf */*/\#* ||:
	echo "removing files"
