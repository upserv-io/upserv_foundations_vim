def index
  # DeleteThis - use this for grouped permissions
  authorize! :ChangeAbility, current_account
  # DeleteThis - use this for granular controller action permissions
  authorize_controller_action! current_account
  @pagy, @ChangeResources = pagy(ChangeQuery)
end
