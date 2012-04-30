push:
	echo 'make gempush/gitpush'
local:
	rake package
	sudo gem install pkg/re_expand-0.0.3.gem
gempush:
	rake package
	gem push pkg/re_expand-0.0.3.gem
gitpush:
	git push pitecan.com:/home/masui/git/expand-ruby.git
	git push git@github.com:masui/expand-ruby.git
always:	
test: always
	rake test
