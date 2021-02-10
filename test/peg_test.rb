#require 'minitest/autorun' 
require 'minitest/autorun'
#require 'minitest/pride' 
require 'minitest/pride'
require './lib/peg'


class PegTest < Minitest::Test

  def test_it_exists
    red_peg = Peg.new("r")
    assert_instance_of Peg, red_peg
  end

  def test_it_has_readable_atributes
    red_peg = Peg.new("r")

    assert_equal "r", red_peg.color
  end 

end
