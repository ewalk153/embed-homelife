require 'test_helper'

class ObservationTest < ActiveSupport::TestCase
  test "temp parses a float data value" do
    assert_equal 23.2, Observation.new(data: "23.2").temperature
  end

  test "temp return null for empty data values" do
    assert_nil Observation.new(data: "").temperature
  end

  test "temp support numbers ending in 0" do
    assert_equal 21.2, Observation.new(data: "21.20").temperature
    assert_equal 0, Observation.new(data: "0").temperature
  end

  test "temp return temp attribute if data is a json structure" do
    struct = JSON.generate(
      {temperature: 11.1}
    )
    assert_equal 11.1, Observation.new(data: struct).temperature
  end

  test "local time is parse" do
    assert_equal "03 Dec 19:00", Observation.new(created_at: DateTime.civil(2007, 12, 4, 0, 0, 0, 0)).local_time
  end
end
