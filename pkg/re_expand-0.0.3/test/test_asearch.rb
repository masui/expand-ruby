# -*- coding: utf-8 -*-

require 'Asearch'

class AsearchTest < Test::Unit::TestCase
  def setup
  end
  
  def teardown
  end

  def test_init
    a = Asearch.new('abc')
    state = a.initstate
    assert state[0] != 0
    assert state[1] == 0
    assert state[2] == 0
  end

  def test_match
    #
    # 状態を利用せず普通にマッチングを行なうメソッド
    #
    a = Asearch.new('abcde')
    assert a.match('abcde')
    assert a.match('abcde',1)
    assert !a.match('abcd')
    assert a.match('abcd',1)
  end

  def test_state
    #
    # "abcde"にマッチするかテスト
    #
    a = Asearch.new('abcde')
    initstate = a.initstate
    laststate = a.state(initstate,'abcde')
    assert((laststate[0] & a.acceptpat) != 0)
    laststate = a.state(initstate,'abcdf')   # 1文字置換
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) != 0)
    assert((laststate[2] & a.acceptpat) != 0)
    laststate = a.state(initstate,'abde')    # 1文字欠損
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) != 0)
    assert((laststate[2] & a.acceptpat) != 0)
    laststate = a.state(initstate,'abcfg')   # 2文字置換
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) == 0)
    assert((laststate[2] & a.acceptpat) != 0)
    laststate = a.state(initstate,'abe')     # 2文字欠損
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) == 0)
    assert((laststate[2] & a.acceptpat) != 0)
    laststate = a.state(initstate,'axbcde')  # 1文字追加
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) != 0)
    assert((laststate[2] & a.acceptpat) != 0)
    laststate = a.state(initstate,'axbcyde') # 2文字追加
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) == 0)
    assert((laststate[2] & a.acceptpat) != 0)
    laststate = a.state(initstate,'ABCDF')   # 大文字
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) != 0)
    assert((laststate[2] & a.acceptpat) != 0)

    #
    # ワイルドカード
    #
    a = Asearch.new(' abc def')
    initstate = a.initstate
    laststate = a.state(initstate,'abcdef')
    assert((laststate[0] & a.acceptpat) != 0)
    initstate = a.initstate
    laststate = a.state(initstate,'abcXXXXdef')
    assert((laststate[0] & a.acceptpat) != 0)
    initstate = a.initstate
    laststate = a.state(initstate,'abcXXXXYYY')
    assert((laststate[0] & a.acceptpat) == 0)
    initstate = a.initstate
    laststate = a.state(initstate,'abcXXXXde')
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) != 0)
    assert((laststate[2] & a.acceptpat) != 0)
    initstate = a.initstate
    laststate = a.state(initstate,'ZZZZZabcdef')
    assert((laststate[0] & a.acceptpat) != 0)

    #
    # 漢字
    #
    a = Asearch.new('漢字文字列')
    initstate = a.initstate
    laststate = a.state(initstate,'漢字文字列')
    assert((laststate[0] & a.acceptpat) != 0)
    laststate = a.state(initstate,'漢字文字')
    assert((laststate[0] & a.acceptpat) == 0)
    laststate = a.state(initstate,'漢字!文字列')
    assert((laststate[0] & a.acceptpat) == 0)
    assert((laststate[1] & a.acceptpat) != 0)
  end
  
end

