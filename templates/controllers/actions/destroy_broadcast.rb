def destroy
  load_ChangeModel
  # DeleteThis - use this for grouped permissions
  authorize! :ChangeAbility, @ChangeModel
  # DeleteThis - use this for granular controller action permissions
  authorize_controller_action! @ChangeModel
  @ChangeModel.destroy ? render_destroy : render_invalid_destroy
end

private

def render_destroy
  # DeleteThis - If coming from a modal, remove it first, which will
  #              close the modal. It's important to call this first otherwise
  #              it looks bad for the page to start changing before the
  #              modal is closed
  # DeleteThis - NOTE: ALWAYS close the modal using current_user_stream_for
  #              and NOT stream_for because you don't want user A to interrupt
  #              user B's experience. Closing modal should only close the current
  #              user's modal, not others
  remove_ChangeControllerName_destroy_modal
  broadcast_flash_success 'ChangeModelDisplay deleted'
  # DeleteThis - render other items as needed.
end

def render_invalid_destroy
  # DeleteThis - if not coming from modal
  broadcast_flash_danger @ChangeModel
  # DeleteThis - if coming from modal
  broadcast_flash_danger @ChangeModel,
                         target: "ChangeModel-#{@ChangeModel.id}-destroy-modal-flash"
  # DeleteThis - render other items as needed.
end
