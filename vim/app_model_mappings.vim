" App Models BAse
nnoremap <silent> ,amba :call CreateBaseFile(1, 0, 1)<return>/class<return>wviwy/ChangeTopLevelDocumentation<return>viwpa model<esc><down>A < ApplicationRecord<esc>/inner_followup<esc>ddO# Constants<space><backspace><return><backspace><backspace><return># Class Methods<space><backspace><space><backspace><return><backspace><backspace><return># Attributes<space><backspace><return><backspace><backspace><return># Callbacks<space><backspace><return><backspace><backspace><return># Validations<space><backspace><return><backspace><backspace><return># Associations<space><backspace><esc>o<esc>x0Do# Scopes<space><backspace><return>DeleteThis - create default order (if necessary - usually this is to order by name).<esc>oUse LOWER if it should be case insensitive. Otherwise, use regular order method.<return>Include the table name as well because it will be needed if default order is<return>chained to a scope that uses joins<esc><down>Oscope :default_order, -> { order('LOWER(ChangeTable.ChangeAttribute)') }<return>scope :default_order, -> { order(:ChangeAttribute) }<esc>o<esc>x0Do# Services<space><backspace><esc>o<esc>x0Do# Instance Methods<esc>gg/DeleteThis\\|ChangeDefault\\|ChangeAttribute\\|ChangeTable<return>
" Associations
" App Models Belongs To association
nnoremap <silent> ,ambt a# DeleteThis - include "polymorphic: true" if this association is polympolymorphic<esc><down>Obelongs_to :ChangeParentName<esc>/ChangeParentName\\|DeleteThis<return>
" App Models Belongs To association - full (when in different namespace or association name doesn't match model name)
nnoremap <silent> ,ambT abelongs_to :ChangeParentName, class_name: 'ChangeParentClass', inverse_of: :ChangeAssociationInOtherModel<esc>/ChangeParentName\\|ChangeParentClass\\|ChangeAssociationInOtherModel<return>
" App Models Has One association
nnoremap <silent> ,amho a# DeleteThis - if this association is polympolymorphic, include "as: name_of_belongs_to_in_child"<esc><down>Ohas_one :ChangeAssociation, dependent: :destroy<esc>/ChangeAssociation\\|DeleteThis<return>
" App Models Has One association - full (when in different namespace or association name doesn't match model name)
nnoremap <silent> ,amhO a# DeleteThis - if this association is polympolymorphic, include "as: name_of_belongs_to_in_child" and remvoe foreign_key and inverse_of<esc><down>Ohas_one :ChangeAssociation, class_name: 'ChangeAssociationClass', foreign_key: :ChangeAssociation_id, inverse_of: :ChangeAssociationInOtherModel, dependent: :destroy<esc>/ChangeAssociationInOtherModel\\|ChangeAssociationClass\\|ChangeAssociation\\|DeleteThis<return>
" App Models has One through association
nnoremap <silent> ,amHo a# DeleteThis - if this association is polympolymorphic, include<esc>o"source_type: 'ChangeClassNameOfAssociationModel'" but only to<esc>othe side of the associate where it's needed (i'm<esc>ostruggling to explain what that means but you'll figure it out)<esc>oAlso include the source: ChangeAssociatable attribute since it cannot be<esc>oautomated for polympolymorphic associations when source_type is needed<esc><down>Ohas_one :ChangeAssociation, through: :ChangeConnectingAssociationName, inverse_of: :ChangeAssociationInOtherModel<esc>/ChangeAssociatable\\|ChangeAssociationInOtherModel\\|ChangeAssociation\\|ChangeConnectingAssociationName\\|ChangeClassNameOfAssociationModel\\|DeleteThis<return>
" App Models Has One through association - full (when in different namespace or association name doesn't match model name)
nnoremap <silent> ,amHO a# DeleteThis - if this association is polympolymorphic, include<esc>o"source_type: 'ChangeClassNameOfAssociationModel'" but only to<esc>othe side of the associate where it's needed (i'm<esc>ostruggling to explain what that means but you'll figure it out)<esc><down>Ohas_one :ChangeAssociation, through: :ChangeConnectingAssociationName, class_name: 'ChangeAssociationClass', source: :ChangeAssociationNameInConnectingModel, inverse_of: :ChangeAssociationInOtherModel<esc>/ChangeAssociationClass\\|ChangeConnectingAssociationName\\|ChangeAssociationInOtherModel\\|ChangeAssociationNameInConnectingModel\\|ChangeAssociation\\|DeleteThis<return>
" App Models Has Many association
nnoremap <silent> ,amhm a# DeleteThis - if this association is polympolymorphic, include "as: name_of_belongs_to_in_child"<esc><down>Ohas_many :ChangeChildrenName, dependent: :destroy<esc>/ChangeChildrenName\\|DeleteThis<return>
" App Models Has Many association - full (when in different namespace or association name doesn't match model name)
nnoremap <silent> ,amhM a# DeleteThis - if this association is polympolymorphic, include "as: name_of_belongs_to_in_child" and remvoe foreign_key and inverse_of<esc><down>Ohas_many :ChangeChildrenName, class_name: 'ChangeChildClass', foreign_key: :ChangeParentName_id, inverse_of: :ChangeAssociationInOtherModel, dependent: :destroy<esc>/ChangeChildrenName\\|ChangeChildClass\\|ChangeParentName\\|ChangeAssociationInOtherModel\\|DeleteThis<return>
" App Models has Many through association
nnoremap <silent> ,amHm a# DeleteThis - if this association is polympolymorphic, include<esc>o"source_type: 'ChangeClassNameOfAssociationModel'" but only to<esc>othe side of the associate where it's needed (i'm<esc>ostruggling to explain what that means but you'll figure it out)<esc>oAlso include the source: ChangeAssociatable attribute since it cannot be<esc>oautomated for polympolymorphic associations when source_type is needed<esc><down>Ohas_many :ChangeChildrenName, through: :ChangeConnectingAssociationName, inverse_of: :ChangeAssociationInOtherModel<esc>/ChangeAssociatable\\|ChangeAssociationInOtherModel\\|ChangeChildrenName\\|ChangeChildrenName\\|ChangeConnectingAssociationName\\|ChangeTopParentModel\\|DeleteThis<return>
" App Models Has Many through association - full (when in different namespace or association name doesn't match model name)
nnoremap <silent> ,amHM a# DeleteThis - if this association is polympolymorphic, include<esc>o"source_type: 'ChangeClassNameOfAssociationModel'" but only to<esc>othe side of the associate where it's needed (i'm<esc>ostruggling to explain what that means but you'll figure it out)<esc><down>Ohas_many :ChangeChildrenName, through: :ChangeConnectingAssociationName, class_name: 'ChangeAssociationClass', source: :ChangeAssociationNameInConnectingModel, inverse_of: :ChangeAssociationInOtherModel<esc>/ChangeAssociationNameInConnectingModel\\|ChangeClassNameOfAssociationModel\\|ChangeChildrenName\\|ChangeChildrenName\\|ChangeConnectingAssociationName\\|ChangeClass\\|ChangeAssociationInOtherModel\\|ChangeAssociationClass\\|DeleteThis<return>
" App Models has Rich Text
nnoremap <silent> ,amrt ahas_rich_text :ChangeAttribute<esc>/ChangeAttribute<return>
" App Models has One Attached
nnoremap <silent> ,amoa ahas_one_attached :ChangeAttribute<esc>/ChangeAttribute<return>
" App Models has One Attached with variants
nnoremap <silent> ,amoA ahas_one_attached :ChangeAttribute do \|ChangeAttribute\|<return>ChangeAttribute.variant :ChangeVariant, ChangeTransformationType: ChangeTransformationValue<return>end<esc>/ChangeAttribute\\|ChangeVariant\\|ChangeTransformationType\\|ChangeTransformationValue<return>
" App Models has Many Attached
nnoremap <silent> ,amma ahas_many_attached :ChangeAttributes<esc>/ChangeAttributes<return>
" App Models has Many Attached with variants
nnoremap <silent> ,ammA ahas_many_attached :ChangeAttributes do \|ChangeAttribute\|<return>ChangeAttribute.variant :ChangeVariant, ChangeTransformationType: ChangeTransformationValue<return>end<esc>/ChangeAttribute\\|ChangeVariant\\|ChangeTransformationType\\|ChangeTransformationValue<return>

" Attributes
" Enum - NOTE WHEN YOU DO THIS, ADD SOME NOTE ABOUT MAKING NOTE OF ENUM
" DISPLAY, VALUE AND DB VALUE - see MTP mobile keys - app/models/core/mobile_key.rb
  " App Models Attributes Array
  nnoremap <silent> ,amaa aserialize :ChangeAttribute, Array
  " App Models Attributes HAsh
  nnoremap <silent> ,amah aserialize :ChangeAttribute, Hash

" Scopes
" App Models SCope
nnoremap <silent> ,amsc ascope :ChangeName, -> { ChangeLogic }<esc>/ChangeName\\|ChangeLogic<return>
" App Models Scope with Argument(s)
nnoremap <silent> ,amsa ascope :ChangeName, ->(ChangeArgument) { ChangeLogic }<esc>/ChangeName\\|ChangeArgument\\|ChangeLogic<return>
" App Models Scope Query (for search)
nnoremap <silent> ,amsq ascope :query, lambda { \|query\|<return># DeleteThis - use this if default_order is simeple ex. order(:name)<esc><down>Odistinct<esc>o# DeleteThis - use this if the default order is non-standards -ex order('LOWER(current_table.name)')<esc><down>Oselect('DISTINCT ON(InsertExactSQLSnippetFromDefaultOrder) ChangeCurrentTable.*')<return>  .where('ChangeAttribute ILIKE :query', query: "%#{query}%")<return><backspace>}<esc>/ChangeAttribute\\|DeleteThis\\|ChangeCurrentTable\\|InsertExactSQLSnippetFromDefaultOrder<return>

" Validations
" App Models Validates Presence
nnoremap <silent> ,amvp :call AppModelsPresenceAbsenceNote()<return>avalidates :ChangeAttribute, presence: true<esc>:call AppModelsValidatesSearch()<return>
nnoremap <silent> ,amvP :call AppModelsPresenceAbsenceNote()<return>avalidates :ChangeAttribute, presence: { <esc>:call AppModelValidatesOptions()<return>a }<esc>:call AppModelsValidatesSearch()<return>
" App Models Validates Uniqueness
nnoremap <silent> ,amvu avalidates :ChangeAttribute, uniqueness: { case_sensitive: false,<return>scope: %i[ChangeAttributes],<return><space><backspace><esc>:call AppModelValidatesOptions()<return>a }<esc>:call AppModelsValidatesSearch()<return>
nmap <silent> ,amvU ,amvu
" App Models Validates Inclusion
nnoremap <silent> ,amvi avalidates :ChangeAttribute, inclusion: { in: [ChangeItems],<return><backspace><space><esc>:call AppModelValidatesOptions()<return>a }<esc>:call AppModelsValidatesSearch()<return>
" App Models Validates Exclusion
nnoremap <silent> ,amve avalidates :ChangeAttribute, exclusion: { in: [ChangeItems],<return><backspace><space><esc>:call AppModelValidatesOptions()<return>a }<esc>:call AppModelsValidatesSearch()<return>
function! AppModelsPresenceAbsenceNote()
  execute "normal! a# DeleteThis - for booleans, use exclusion or inclusion rather\<esc>o than presence or absence because presence and absence\<esc>o use \"blank?\" and false.blank? is true\<esc>\<down>O\<space>\<backspace>"
endfunction
" function! AppModelsValidatesMessage()
"   execute "normal! amessage: '%<model>s %<attribute>s %<value>s'\<return>\<space>\<backspace>"
" endfunction
function! AppModelValidatesOptions()
 execute "normal! aallow_nil: true,\<return>allow_blank: true"
 call AppModelValidatesOptionsLessNilAndBlank()
endfunction
function! AppModelValidatesOptionsLessNilAndBlank()
 execute "normal! a,\<return>if: ChangeMethodOrProcOrArray,\<return>unless: ChangeMethodOrProcOrArray"
endfunction
function! AppModelsValidatesSearch()
  let @/ = 'ChangeAttributes\|ChangeAttribute\|ChangeValidation\|%<model>s %<attribute>s %<value>s\|ChangeMethodOrProcOrArray\|255ForStringOrSomeOtherLength\|ChangeThis\|ChangeRange\|DeleteThis\|ChangeAttachmentName\|ChangeMin\|ChangeMax\|ChangeSize\|ChangeByteType\|ChangeWidthInteger\|ChangeHeightInteger\|ChangeItems\|Changemessage\|ChangeLogic\|ChangeValue\|ChangeMessage\|ChangeRegex'
  normal! n
endfunction
"  " App Models Validates Base
"  nnoremap <silent> ,amvb avalidates :ChangeAttribute, ChangeValidation: {<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptions()<return>:call AppModelsValidatesSearch()<return>
"  " App Models Validates Absence
"  nnoremap <silent> ,amva :call AppModelsPresenceAbsenceNote()<return>avalidates :ChangeAttribute, absence: {<return>message: 'please remove ChangeAttribute'<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptions()<return>:call AppModelsValidatesSearch()<return>
"  " App Models Validates Length
"  nnoremap <silent> ,amvl avalidates :ChangeAttribute, length: {<return>is: ChangeValue,<return>minimum: ChangeMin,<return>maximum: 255,<return>in: ChangeRange,<return>message: 'ChangeAttribute is too long (maximum is 255 characters)'<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptions()<return>:call AppModelsValidatesSearch()<return>
"  " App Models Validates Numericality
"  nnoremap <silent> ,amvn avalidates :ChangeAttribute, numericality: {<return>only_integer: true,<return>allow_nil: true,<return>less_than: ChangeValue,<return>less_than_or_eqaul_to: ChangeValue,<return>equal_to: ChangeValue,<return>greater_than: ChangeValue,<return>greater_than_or_equal_to: ChangeValue,<return>other_than: ChangeValue,<return>odd: true,<return>even: true,<return>message: 'ChangeAttribute must be a number'<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptions()<return>:call AppModelsValidatesSearch()<return>
"  " App Models Validates Attachment
"  nnoremap <silent> ,amvA a# DeleteThis - Active Storage Attachment Validations are only run if the attachment is attached so there is no need to include the "allow_blank: true" safety precaution<space><backspace><return>DeleteThis - the "attached" validation is effectively the same as the "presence" validation but attached is preferred because it is more intuitive when reading the codee (attached usees the "attached?" method and presence uses the "blank?" method but they work the same for active storage attachments. Just FYI)<return><backspace><backspace>validates :ChangeAttachmentName, attached: {<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptionsLessNilAndBlank()<return>$a<return><return>validates :ChangeAttachmentName, content_type: {<return>in: %w[image/jpeg image/gif image/png image/heic application/pdf],<return>message: 'ChangeAttachmentName must be a valid format. Valid formats are: jpeg, gif, png, heic, pdf',<return>in: %w[video/quicktime video/mp4 video/webm audio/ogg],<return>message: 'ChangeAttachmentName must be a valid image video format. Valid formats are:  mp4, mov, webm, ogg',<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptionsLessNilAndBlank()<return>$a<return><return>validates :ChangeAttachmentName, size: {<return># DeleteThis - Byte type an be "kilobytes", "megabytes" and probably others:<return><backspace><backspace> less_than: ChangeSize.ChangeByteType,<return>message: 'ChangeAttribute is too large (ChangeSize ChangeByteType max)',<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptionsLessNilAndBlank()<return>$a<return><return>validates :ChangeAttachmentName, dimension: {<return>width: { min: ChangeMin, max: ChangeMax },<return>height: { min: ChangeMin, max: ChangeMax },<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptionsLessNilAndBlank()<return>$a<return><return>validates :ChangeAttachmentName, aspect_ratio:<return># DeleteThis - Choose one:<return><backspace><backspace>:square<return>:portrate<return>:landscape<return>:is_16_9<return># DeleteThis - Or add a dynamic aspect ratio:<return><backspace><backspace>:is_ChangeWidthInteger_ChangeHeightInteger{<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptionsLessNilAndBlank()<return>:call AppModelsValidatesSearch()<return>
"  " App Models Validates Format
"  nnoremap <silent> ,amvf avalidates :ChangeAttribute, format: {<return>with: ChangeRegex,<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptions()<return>:call AppModelsValidatesSearch()<return>
"  " App Models Validates eMail
"  nnoremap <silent> ,amvm avalidates :ChangeAttribute, format: {<return>with: URI::MailTo::EMAIL_REGEXP,<return><space><backspace><esc>:call AppModelsValidatesMessage()<return>a}<esc>:call AppModelValidatesOptions()<return>:call AppModelsValidatesSearch()<return>
"  " App Models Validate Custom
"  nnoremap <silent> ,amvc :call AppModelsValidateCustom()<return>
"  function! AppModelsValidateCustom()
"    let attribute = input("what is the name of the attribute you are validating?: ")
"    if attribute == ''
"      let attribute = 'ChangeAttribute'
"    endif
"    let description = input("what is a description of the validation (snake case - this will be used to create method name): ")
"    if description == ''
"      let description = 'ChangeDescription'
"    endif
"    execute "normal! avalidate :" . attribute . "_" . description . "\<return># DeleteThis - move below to private section\<return>\<backspace>\<backspace>def " . attribute . "_" . description . "\<return># DeleteThis - insert guard clauses if needed ex. don't run validation if nil, etc.\<return>ChangeComment\<return>\<backspace>\<backspace>return unless " . attribute . "\<return># DeleteThis - insert validation logic\<return>ChangeComment\<return>\<backspace>\<backspace>return unless " . attribute . " == ChangeLogic\<esc>o\<esc>oerrors.add(:" . attribute . ", 'ChangeMessage')\<return>end"
"    let @/ = "ChangeAttribute\\|ChangeDescription\\|DeleteThis\\|ChangeComment\\|ChangeLogic\\|ChangeMessage"
"  endfunction
"  " App Models Validates Each
"  nnoremap <silent> ,amvE a# DeleteThis - make sure to add logic so that validation is not run if needed attributes are not present<return>DeleteThis - presence validations should test presence if precsence is needed<return><backspace><backspace>validates_each :ChangeAttribute do \|record, attr, value\|<return>record.errors.add(attr, 'ChangeMessage') if ChangeLogic<return>end<esc>:call AppModelsValidatesSearch()<return>











"" App Models Scope Multiline
"nnoremap <silent> ,amsm ascope :ChangeName, lambda { \|ChangeArgument\|<return>ChangeLogic<return>}<esc>/ChangeName\\|ChangeArgument\\|ChangeLogic<return>
"" App Models Scope Order
"nnoremap <silent> ,amso ascope :order_by_ChangeAttributes, -> { order(:ChangeAttribute, 'LOWER(ChangeTable.ChangeAttribute)') }<esc>/ChangeAttributes\\|ChangeTable\\|ChangeAttribute<return>
"nnoremap <silent> ,amsO ascope :order_and_distinct_on_ChangeAttributes, -> { select('DISTINCT ON (ChangeTable.ChangeAttribute, LOWER(ChangeTable.ChangeCaseInsensitiveAttribute)) ChangeTableToAccessAllAttributes.*').order('LOWER(ChangeTable.ChangeAttribute)') }<esc>/ChangeAttributes\\|ChangeTableToAccessAllAttributes\\|ChangeTable\\|ChangeAttribute\\|ChangeCaseInsensitiveAttribute<return>
"" Base / Misc
"  
"  " App Models Cancancan Non-model based
"  nnoremap <silent> ,amcn acan %i[ChangeAbility], :ChangeNamespace_ChangeControllerOrFeature<return># DeleteThis - ChangeAbility - use "admin" or a lesser permission or a specific controller action (never use "manage" - see note below)<return>DeleteThis - ChangeNamespace - the upserv "app" this ability belongs to (ex. "core" or "hr", etc.)<return>DeleteThis - ChangeControllerOrFeature - a specific controller or a feature that describes a collection of<return>controllers.<return><esc>:call AppModelsCancancanManageNote()<return>/ChangeAbility\\|ChangeNamespace\\|ChangeControllerOrFeature\\|DeleteThis<enter>
"  " App Models Cancancan model based for Index
"  nnoremap <silent> ,amci acan %i[index_ChangeNamespace_ChangeControllerOrFeature], ChangeModel, ChangeMethod: user.ChangeValue<return># DeleteThis - NOTE: accessible_by ALWAYS gets its own unique ability starting with "index" because<return>accessible_by errors when non-attribute (ie not columns in db) methods are used. This way regular<return>abilities will be kept separate so we can use any method on them and we don't have to worry about<return>accessible_by breaking.<return>DeleteThis - ChangeNamespace - the upserv "app" this ability belongs to (ex. "core" or "hr", etc.)<return>DeleteThis - ChangeControllerOrFeature - a specific controller or a feature that describes a collection of<return>controllers.<esc>/ChangeAbility\\|ChangeNamespace\\|ChangeControllerOrFeature\\|ChangeModel\\|ChangeMethod\\|ChangeValue\\|DeleteThis<enter>
"  " App Models Cancancan Model based
"  nnoremap <silent> ,amcm acan %i[ChangeAbility_ChangeNamespace_ChangeControllerOrFeature], ChangeModel, ChangeMethod: user.ChangeValue<return># DeleteThis - ChangeAbility - use "admin" or a lesser permission or a specific controller action (never use "manage" - see note below)<return>DeleteThis - ChangeNamespace - the upserv "app" this ability belongs to (ex. "core" or "hr", etc.)<return>DeleteThis - ChangeControllerOrFeature - a specific controller or a feature that describes a collection of<return>controllers.<return><esc>:call AppModelsCancancanManageNote()<return>/ChangeAbility\\|ChangeNamespace\\|ChangeControllerOrFeature\\|ChangeModel\\|ChangeMethod\\|ChangeValue\\|DeleteThis<enter>"
"  function! AppModelsCancancanManageNote()
"    execute "normal! aDeleteThis - NOTE: never use \"manage\" by iteself when defining abilities because \":manage\"\<return> by itself has special meaning in CanCanCan. Any abilities defined within \":manage\" will also be included\<return>in all other abilities defined for the model. This will unexpectedly give authorization in non-manage\<return>abilities. Ex. if \"can %i[manage], Core::User\" is used, then anything defined within it will also be\<return>applied to \"can %i[:show], Core::User\" which causes issues because usually you want anything defined in\<return>:show to be separate from and more restriced than :manage"
"  endfunction
"
"
"" other active record tools
"  " App Models WHere (full)
"  nnoremap <silent> ,amwh awhere("CONCAT_WS(' ', ChangeTable.ChangeAttribute, ChangeTable.ChangeAttribute) ILIKE :ChangeSequence OR ChangeTable.ChangeAttribute ILIKE :ChangeSequence OR ChangeTable.ChangeAttribute IN (:ChangeArray) OR ChangeTable.ChangeAttribute = :ChangeThis OR ChangeTable.ChangeAttribute IS NULL OR ChangeTable.ChangeAttribute IS NOT NULL", ChangeSequence: "%#{ChangeSequence}%", ChangeArray: ChangeArray, ChangeThis: ChangeThis)<esc>/ChangeTable\\|ChangeAttributereturn
"  " App Models ORder
"  nnoremap <silent> ,amor aorder(:ChangeAttribute)<esc>/ChangeAttribute<return>
"  " App Models Order Descending
"  nnoremap <silent> ,amod aorder(ChangeAttribute: :desc)<esc>/ChangeAttribute<return>
"  " App Models Order Case insensitive
"  nnoremap <silent> ,amoc aorder('LOWER(ChangeAttribute)')<esc>/ChangeAttribute<return>
"  " App Models ORder (full)
"  nnoremap <silent> ,amoR aorder("LOWER(ChangeAttribute) DESC")<esc>/ChangeAttribute<return>
"  " App Models Concat with Separator
"  nnoremap <silent> ,amcs aCONCAT_WS(' ', ChangeTable.ChangeAttribute, ChangeTable.ChangeAttribute)<esc>/ChangeTable\\|ChangeAttribute\\|ChangeAttribute<return>
"  
"
"" Attributes
"  " App Models ATtribute
"  nnoremap <silent> ,amat aattribute :ChangeAttribute, :ChangeDataTypeOrRemoveThisOption<esc>/ChangeAttribute\\|ChangeDataTypeOrRemoveThisOption<return>
"  " App Models Attributes Enum
"  nnoremap <silent> ,amae aenum ChangeAttribute: { 'ChangeDisplay': ChangeInteger }<return># DeleteThis - Notes regarding enums to display (for enums not to display, use ",amaE")<return>DeleteThis - typically used when selecting from a list and therefore there is a need to display the enum value<return>DeleteThis - when applying control flow use "for_database" and include comment identifying the display:<return><tab>DeleteThis - good - "if object.some_enum_for_database == 0 # some_display"<return>DeleteThis - bad - "if object.some_enum_some_display?"<return>DeleteThis - bad - "if object.some_enum == 'some_display'"<return><backspace>DeleteThis - the good example is both clear and allows us to change display whenever we want without breaking code elswhere<return>DeleteThis - the bad examples are clear but if the display is ever changed, the code will error<return>DeleteThis - NOTE: no need for "_prefix" option because "object.some_enum_some_display?" and similar methods will never be used with enum for display<return>DeleteThis - you can change the display order simply by reorganizing the hash (ex. 0 does not have to be first and none need to be sequential)<return>DeleteThis - Do not change the key / values pairs though - those should never change<esc>/ChangeAttribute\\|ChangeDisplay\\|ChangeInteger\\|DeleteThis<return>
"  nnoremap <silent> ,amaE aenum ChangeAttribute: { ChangeIdentifier: ChangeInteger }, _prefix: true<return># DeleteThis - Notes regarding enums NOT to display (for enums to display, use ",amae")<return>DeleteThis - typically used to store some sort of status<return>DeleteThis - when applying control flow use methods generated by "_prefix: true" option<return><tab>DeleteThis - good - "if object.some_enum_some_identifier?"<return>DeleteThis - bad - "if object.some_enum == :some_identifier"<return>DeleteThis - bad - "if object.some_enum_for_database == 0 # some_identifier"<return><backspace>DeleteThis - the good example is the most clear and succinct<return>DeleteThis - the first bad is less succinct and the second bad is less clear and is more likely prone to human error by confusing the database number<return>DeleteThis - do not change identifiers after they have been set because that will break code elsewhere ("if object.some_enum_some_identifier?" will break)<return>DeleteThis - Do not change the key / values pairs - those should never change<esc>/ChangeAttribute\\|ChangeIdentifier\\|ChangeInteger\\|DeleteThis<return>
"
"" Callbacks
"  " App Models Process Attributes
"  nnoremap <silent> ,ampa abefore_validation :process_attributes<return># DeleteThis - move this to private section<return><backspace><backspace><esc><up>:call ReadTemplate('models/misc/process_attributes.rb')<return>/DeleteThis\\|ChangeAttribute\\|ChangeValue\\|ChangeIndedependentAttribute<return>
"  " App Models Nil Parent on orphanable childrend
"  nnoremap <silent> ,amnp abefore_destroy :nil_parent_id_on_orphanable_children<return># DeleteThis - move below method to private section<return><backspace><backspace>def nil_parent_id_on_orphanable_children<return># DeleteThis - make all children nil<return><backspace><backspace>ChangeChildren.update_all(ChangeForeignKey_id: nil)<return># DeleteThis - if this model can be the parent of one of it's parents (in a circular child / parent association), then remove the foreign key in the parent record<return><backspace><backspace>ChangeChild.update(ChangeForeignKey_id: nil) if ChangeParent.ChangeChildParent_id == id<return>end<esc>/DeleteThis\\|ChangeChildren\\|ChangeForeignKey\\|ChangeParent\\|ChangeChildParent<return>
