push:
	echo 'make gempush/gitpush'
gempush:
	rake package
	gem push pkg/re_expand-0.0.2.gem
gitpush:
	git push pitecan.com:/home/masui/git/expand-ruby.git
	git push git@github.com:masui/expand-ruby.git
