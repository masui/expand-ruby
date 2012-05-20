# -*- coding: utf-8 -*-
require 'rubygems'
require 're_expand'

def station
  "鎌倉|逗子|藤沢|戸塚|横浜|渋谷|新宿|東京|品川|湘南台"
end

"(#{station})駅から(#{station})駅までの電車(の(時刻|時間))を調べる".expand { |a|
  puts a[0]
}


