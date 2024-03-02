# DeleteThis - see docs: https://turbo.hotwired.dev/reference/streams#the-seven-actions
# DeleteThis - to run in a background job, add "_later" to broadcast_remove_to
def remove_ChangeTarget(ChangeArgs)
  broadcast_remove_to(
    # DeleteThis - resource is the main resource for show templates. Remove this for index templates
    stream_for(:ChangeTemplate, file: __FILE__, resource: ChangeResource),
    target: 'ChangeHmtlId' # or possibly dom_id(ChangeResource),
  )
end
