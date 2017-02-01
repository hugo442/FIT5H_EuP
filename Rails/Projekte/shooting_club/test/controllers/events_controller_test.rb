require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { date: @event.date, marksmen: @event.marksmen, name: @event.name, shoot_number: @event.shoot_number, shooting_range: @event.shooting_range, time: @event.time, unknown0: @event.unknown0, unknown10: @event.unknown10, unknown11: @event.unknown11, unknown1: @event.unknown1, unknown2: @event.unknown2, unknown3: @event.unknown3, unknown4: @event.unknown4, unknown5: @event.unknown5, unknown6: @event.unknown6, unknown7: @event.unknown7, unknown8: @event.unknown8, unknown9: @event.unknown9, value: @event.value } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { date: @event.date, marksmen: @event.marksmen, name: @event.name, shoot_number: @event.shoot_number, shooting_range: @event.shooting_range, time: @event.time, unknown0: @event.unknown0, unknown10: @event.unknown10, unknown11: @event.unknown11, unknown1: @event.unknown1, unknown2: @event.unknown2, unknown3: @event.unknown3, unknown4: @event.unknown4, unknown5: @event.unknown5, unknown6: @event.unknown6, unknown7: @event.unknown7, unknown8: @event.unknown8, unknown9: @event.unknown9, value: @event.value } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
