require 'minitest/autorun'
require 'minitest/pride'
require './lib/timer'

class TimerTest < Minitest::Test

  def test_that_it_exists
    timer = Timer.new

    assert_instance_of Timer, timer
  end

  def test_it_has_atributes
    timer = Timer.new

    assert_instance_of Time, timer.start_time
    assert_equal "", timer.total_seconds
    assert_equal 0, timer.minutes
    assert_equal 0, timer.seconds
  end

  def test_stop_timer
    timer = Timer.new
    timer.end_time
    assert_instance_of Integer, timer.total_seconds
  end

  def test_elapsed_minutes
    timer = Timer.new

    time_test1 = 5
    time_test2 = 59
    time_test3 = 95
    time_test4 = 137

    assert_equal 0, timer.elapsed_minutes(time_test1)
    assert_equal 0, timer.elapsed_minutes(time_test2)
    assert_equal 1, timer.elapsed_minutes(time_test3)
    assert_equal 2, timer.elapsed_minutes(time_test4)
  end

  def test_elapsed_seconds
    timer = Timer.new

    time_test1 = 5
    time_test2 = 59
    time_test3 = 95
    time_test4 = 137

    assert_equal 5, timer.elapsed_seconds(time_test1)
    assert_equal 59, timer.elapsed_seconds(time_test2)
    assert_equal 35, timer.elapsed_seconds(time_test3)
    assert_equal 17, timer.elapsed_seconds(time_test4)
  end
end
