def show
  load_ChangeModel
  # DeleteThis - use this for grouped permissions
  authorize! :ChangeAbility, @ChangeModel
  # DeleteThis - use this for granular controller action permissions
  authorize_controller_action! @ChangeModel
end

def edit
  load_ChangeModel
  # DeleteThis - use this for grouped permissions
  authorize! :ChangeAbility, @ChangeModel
  # DeleteThis - use this for granular controller action permissions
  authorize_controller_action! @ChangeModel
end

def update
  load_ChangeModel
  # DeleteThis - use this for grouped permissions
  authorize! :ChangeAbility, @ChangeModel
  # DeleteThis - use this for granular controller action permissions
  authorize_controller_action! @ChangeModel
  @ChangeModel.update(update_params) ? render_update : render_invalid_update
end

private

def render_update
  broadcast_flash_success 'ChangeModelDisplay updated', skip_render: true
  # DeleteThis - redirect to show
  redirect_to ChangePath(current_account, @ChangeModel)
  # DeleteThis - render other items as needed.
end

def render_invalid_update
  # DeleteThis - if not coming from modal
  broadcast_flash_danger @ChangeModel
  # DeleteThis - if coming from modal
  broadcast_flash_danger @ChangeModel,
                         target: "ChangeModel-#{@ChangeModel.id}-update-modal-flash"
  # DeleteThis - redirect to edit and show errors
  redirect_to ChangePath(current_account, @ChangeModel)
end

def update_params
  params.require(:changethis).permit(:changethis)
end
