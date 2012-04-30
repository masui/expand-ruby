# -*- coding: utf-8 -*-

require 'Scanner'

class ScannerTest < Test::Unit::TestCase
  def setup
  end
  
  def teardown
  end

  def test_1
    s = Scanner.new('abc*def')
    assert_equal s.gettoken, 'abc'
    assert_equal s.gettoken, '*'
    assert_equal s.gettoken, 'def'
  end

  def test_2
    s = Scanner.new("(a\tb|c\td)")
    assert_equal s.gettoken, "("
    assert_equal s.gettoken, "a\tb"
    assert_equal s.gettoken, '|'
    assert_equal s.gettoken, "c\td"
    assert_equal s.gettoken, ')'
  end
end
