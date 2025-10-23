

fetch:
	wsl -e scripts/git_pull_remote.sh

clean2:
	find . -type f -name "*.unv" -delete
	find . -type f -name "*.FCBak" -delete
	find . -type f -name "*.msh" -delete



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
