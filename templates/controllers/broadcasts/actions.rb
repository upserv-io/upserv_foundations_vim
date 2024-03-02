# DeleteThis - options are: append prepend before after replace (we don't use the update option)
# DeleteThis - see docs: https://turbo.hotwired.dev/reference/streams#the-seven-actions
# DeleteThis - to run in a background job, add "_later" to broadcast_ChangeTurboAction_to
def ChangeAction_ChangeTarget(ChangeArgs)
  broadcast_ChangeTurboAction_to(
    # DeleteThis - resource is the main resource for show templates. Remove this for index templates
    stream_for(:ChangeTemplate, file: __FILE__, resource: ChangeResource),
    target: 'ChangeHmtlId', # or possibly dom_id(ChangeResource),
    partial: 'ChangePartialPath',
    # DeleteThis - add locals or remove this
    locals: {}
  )
end
