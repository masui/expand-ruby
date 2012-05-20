# -*- coding: utf-8 -*-
#
# 指定したパタンに曖昧マッチするものをリストする
# 「1,2,3,4からなる数字のうち"222"と曖昧度1でマッチするもの」
#
require 'rubygems'
require 're_expand'

'(1|2|3|4)*'.expand(' 222 ',1) { |a|
  puts a[0]
}

