include FactoryBot::Syntax::Methods

# DeleteThis - we typically do not test:
#   constants
#   attributes
#   associations (see note on destroy though...)
#   scopes
#   anything in the private section (should be tested by testing association)
# we typically do test:
#   validations
#   destroy (this will take into account dependent destroy on has_many / has_one)
#   basically everything else

# ---- Class Methods ---- #

# ---- Callbacks ---- #

# ---- Validations & DB Constraints ---- #
test '#valid?' do
  assert build(:ChangeModel).valid?
end

context 'basic validations' do
  # DeleteThis: add set up if testing uniqueness because
  # uniqueness saves to the database but it forgets to use
  # factory bot which then raises an excpeption because of the
  # not null database constraint
  setup do
    @ChangeModel = create(:ChangeModel)
  end

  should validate_ChangeValidation
end

# ---- Instance Methods ---- #

# ---- Destroying ---- #
test '#destroy' do
  ChangeModel = create(:ChangeModel)
  # DeleteThis:
  # test to do what you expect
  # example: assert it's deleted if deleting is allowed
  # assert it's not deleted if not allowed
  # assert children destroyed if there are children that need to be destroyed
  # assert foreign key in children set to nil if it's a nilable reference
  # etc.
  ChangeModel.destroy
  assert_raise(ActiveRecord::RecordNotFound) { ChangeModel.reload }
end
