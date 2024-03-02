include FactoryBot::Syntax::Methods

test 'ChangeJob' do
  # DeleteThis - set up for job
  # DeleteThis - typically when testing we use perform_now
  #   however if for some reason you need to use perform_later
  #   you can do it like this:
  #   ChangeJobClass.perform_later(ChangeArgs)
  #   perform_enqueued_jobs
  ChangeJobClass.perform_now(ChangeArgs)
  # Deletethis - make assertions
end
