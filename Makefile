VERSION=0.0.7
push:
	echo 'make gempush/gitpush'
local:
	rake package
	sudo gem install pkg/re_expand-$(VERSION).gem
gempush:
	rake package
	gem push pkg/re_expand-$(VERSION).gem
gitpush:
	git push pitecan.com:/home/masui/git/expand-ruby.git
	git push git@github.com:masui/expand-ruby.git
always:	
test: always
	rake test
