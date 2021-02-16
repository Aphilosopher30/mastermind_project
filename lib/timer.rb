class Timer
  attr_reader :start_time, :total_seconds, :minutes, :seconds

  def initialize
    @start_time = Time.new
    @total_seconds = ""
    @minutes = 0
    @seconds = 0
  end
  
  def end_time
    end_time = Time.new
    @total_seconds = (end_time - @start_time).round
  end

  def elapsed_minutes(seconds = @total_seconds)
     seconds/60
  end

  def elapsed_seconds(seconds = @total_seconds)
    seconds%60
  end

end
