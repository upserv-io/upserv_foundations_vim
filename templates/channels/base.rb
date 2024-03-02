def subscribed
  ensure_authenticated_and_authorized!

  # DeleteThis - NOTE the ? / = / & syntax is simply to help differentiate the
  # channel path from the variables... it mimics html query params BUT it's not
  # actually adding any functionality. I just decided to do it this way because
  # it clearly separates params vs. the initial path.
  # DeleteThis - Also, we use the path as the first part of the stream
  # so that we can have confidence that no other channel accidentally streams
  # from the same stream. This ensures all channels use distinct streams.
  stream_from "ChangePathToChannel?ChangeParam1=#{params[:ChangeParam1]}&ChangeParam2=#{params[:ChangeParam2]}"
end

def unsubscribed
  # Any cleanup needed when channel is unsubscribed
end

private

# DeleteThis - update authentication and authorization as needed
def ensure_authenticated_and_authorized!
  reject_unauthorized_connection unless current_user

  return if Ability.new(current_user).can? :ChangeAbility, ChangeObject

  reject_unauthorized_connection
end
