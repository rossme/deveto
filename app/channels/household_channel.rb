class HouseholdChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    household = Household.find(params[:id])
    stream_for household
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
