require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'
require './lib/secret_code'

class SecretCodeTest < Minitest::Test

  def test_it_exists
    secret_code = SecretCode.new("rrgb")

    assert_instance_of SecretCode, secret_code
  end

  def test_it_has_readable_attributes
    secret_code = SecretCode.new("rrgb")

    assert_equal "rrgb", secret_code.peg_code
  end

  def test_create_random_peg_color
    secret_code = SecretCode.new("rrgb")
    require 'pry'; binding.pry

    assert_equal 4, secret_code.create_random_peg_color.length
  end

end
