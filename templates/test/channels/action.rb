test '#some_action' do
  # DeleteThis - set current user and stub connection? IDK. If yes, then
  # make sure to update the vim mappings / .dotfiles template
  perform(:some_action, { param1: 'value1', param2: 'value2' })

  assert_broadcast_on('channel_name', { key: 'value' })
  assert_response :success
end
