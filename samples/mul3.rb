# -*- coding: utf-8 -*-
# 3の倍数にマッチする正規表現
require 'rubygems'
require 're_expand'
pat = "(0|1(0|1(0)*2)*(2|1(0)*1)|2(0|2(0)*1)*(1|2(0)*2))+"
pat.gsub!(/0/,'(0|3|6|9)')
pat.gsub!(/1/,'(1|4|7)')
pat.gsub!(/2/,'(2|5|8)')
pat.expand { |a|
  puts a[0]
}

