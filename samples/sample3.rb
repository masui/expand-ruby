# -*- coding: utf-8 -*-
require 'rubygems'
require 're_expand'

'(時計|時間|時刻)を(0|1|2|3|4|5|6|7|8|9|10|11|12)時に(セットする|設定する|あわせる)'.expand { |s,a|
  puts s
}
