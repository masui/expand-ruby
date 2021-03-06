# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/test_helper.rb'

module ReExpand
  class TestReExpand < Test::Unit::TestCase
    
    def setup
    end
    
    def test_truth
      assert true
    end

    def test_array
      e = "(月|火|水|木|金)曜(1|2|3|4|5|6)限".expand
      assert_equal e.class, Array
      assert_equal e.length, 30
    end

    def test_2
      count = 0
      "(月|火|水|木|金)曜(1|2|3|4|5|6)限".expand { |a|
        assert_equal a.length, 3
        count += 1
      }
      assert_equal count, 30

      e = "(月|火|水|木|金)曜(1|2|3|4|5|6)限".expand(' 1 ')
      assert_equal e.length, 5
    end

    def test_e
      '(ab|cd)*'.expand { |a|
        if a[0] =~ /bc/ then
          assert_equal a.length, 2
          assert a[0] =~ /abcd/
        end
      }
    end

  end
end
