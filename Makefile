default:
	: No default  try make install or make diff

install:
	cat INSTALL.md

install-local:
	install bin/* /usr/local/bin

install-home:
	install bin/* ${HOME}/bin

install-os:
	install bin/* /usr/bin

diff:
	cat Docs/Diff.md


bump:
	: rcs-id -b [....]

diff-local:
	for i in bin/* ; do echo ========== $$i ============= ; diff $$i /usr/local/bin/ ; done

diff-home:
	for i in bin/* ; do echo ========== $$i ============= ; diff $$i ${HOME}/bin/ ; done

diff-os:
	for i in bin/* ; do echo ========== $$i ============= ; diff $$i /usr/bin/ ; done

git-tag:
	git tag v`cat VERSION`
	git push origin --tags

test-rcs:
	cp bin/rcs-id rcs-id 
	rm -f rcs-id.bak 
	bin/rcs-id  rcs-id
	diff bin/rcs-id rcs-id
