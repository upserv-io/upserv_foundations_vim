" Html Input Inline Wrapper (same mapping as HTML show inline wrapper)
nnoremap <silent> ,hiiw :call IndentTemplate('views/forms/input_inline_wrapper.html.erb')<return>/DeleteThis\\|ChangeLabel\\|ChangeMethod\\|ChangeOrRemove<return>
map <silent> ,hsiw ,hiiw
" Html Input group Checkbox
nnoremap <silent> ,hicb :call IndentTemplate('views/forms/input_group_checkbox.html.erb')<return>/DeleteThis\\|ChangeLabel\\|ChangeMethod\\|ChangeOrRemove<return>
nnoremap <silent> ,hicB :call IndentTemplate('views/forms/inputs_checkboxes.html.erb')<return>/DeleteThis\\|ChangeAttributeDisplay\\|ChangeAttribute\\|ChangeOrRemove<return>
" Html Input File Field
nnoremap <silent> ,hiff :call IndentTemplate('views/forms/input_group_file_field.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>
nnoremap <silent> ,hifF :call IndentTemplate('views/forms/inputs_file_field.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>
" Html Input Hidden Field
nnoremap <silent> ,hihf :call IndentTemplate('views/forms/inputs_hidden_field.html.erb')<return>/ChangeMethod\\|DeleteThis<return>
" Html Input Number Field
nnoremap <silent> ,hinf :call IndentTemplate('views/forms/input_group_number_field.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>
nnoremap <silent> ,hinF :call IndentTemplate('views/forms/inputs_number_field.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>
" Html Input Radio
nnoremap <silent> ,hirb :call IndentTemplate('views/forms/input_group_radio.html.erb')<return>/DeleteThis\\|ChangeLabel\\|ChangeMethod\\|ChangeValue\\|ChangeOrRemove<return>
nnoremap <silent> ,hirB :call IndentTemplate('views/forms/inputs_radio_buttons.html.erb')<return>/DeleteThis\\|ChangeAttribute\\|ChangeValue\\|ChangeOrRemove\\|ChangeDisplay<return>
" Html Input Select Block
nnoremap <silent> ,hisb :call IndentTemplate('views/forms/input_group_select_block.html.erb')<return>/ChangeLabel\\|ChangeMethod\\|DeleteThis\\|ChangeOrRemove\\|ChangeOptionObjects\\|ChangeOptionObject\\|ChangeValue\\|ChangeDisplay<return>
nnoremap <silent> ,hisB :call IndentTemplate('views/forms/inputs_select_block.html.erb')<return>/ChangeMethod\\|DeleteThis\\|ChangeOrRemove\\|ChangeOptionObjects\\|ChangeOptionObject\\|ChangeValue\\|ChangeDisplay<return>
" Html Input Select Default option
nnoremap <silent> ,hisd :call IndentTemplate('views/forms/input_group_select_default.html.erb')<return>/ChangeLabel\\|ChangeMethod\\|DeleteThis\\|ChangeOptionsList\\|ChangeOrRemove<return>
nnoremap <silent> ,hisD :call IndentTemplate('views/forms/inputs_select_default.html.erb')<return>/ChangeMethod\\|DeleteThis\\|ChangeOptionsList\\|ChangeOrRemove<return>
" Html Input Select Optional
nnoremap <silent> ,hiso :call IndentTemplate('views/forms/input_group_select_optional.html.erb')<return>/ChangeLabel\\|ChangeMethod\\|DeleteThis\\|ChangeOptionsList\\|ChangeOrRemove<return>
nnoremap <silent> ,hisO :call IndentTemplate('views/forms/inputs_select_optional.html.erb')<return>/ChangeMethod\\|DeleteThis\\|ChangeOptionsList\\|ChangeOrRemove<return>
" Html Input Select Required
nnoremap <silent> ,hisr :call IndentTemplate('views/forms/input_group_select_required.html.erb')<return>/ChangeLabel\\|ChangeMethod\\|DeleteThis\\|ChangeOptionsList\\|ChangeOrRemove<return>
nnoremap <silent> ,hisR :call IndentTemplate('views/forms/inputs_select_required.html.erb')<return>/ChangeMethod\\|DeleteThis\\|ChangeOptionsList\\|ChangeOrRemove<return>
" Html Input Text Area
nnoremap <silent> ,hita :call IndentTemplate('views/forms/input_group_text_area.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>
nnoremap <silent> ,hitA :call IndentTemplate('views/forms/inputs_text_area.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>
" Html Input Text Field
nnoremap <silent> ,hitf :call IndentTemplate('views/forms/input_group_text_field.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>
nnoremap <silent> ,hitF :call IndentTemplate('views/forms/inputs_text_field.html.erb')<return>/DeleteThis\\|ChangeMethod\\|ChangeOrRemove<return>



" Html Input Default
nnoremap <silent> ,hide :call IndentTemplate('views/forms/input_group.html.erb')<return>/DeleteThis\\|ChangeInputType\\|ChangeMethod<return>
" Html Input Default Custom
nnoremap <silent> ,hidc :call IndentTemplate('views/forms/input_group_custom.html.erb')<return>/DeleteThis\\|ChangeLabel<return>



" Html Input Select Options for select
nnoremap <silent> ,hios aoptions_for_select(ChangeOptionsListDisplayFirstValueSecond, ChangeSelectedOptionOrOptionsIfMultiple)<esc>/DeleteThis\\|ChangeOptionsListDisplayFirstValueSecond\\|ChangeSelectedOptionOrOptionsIfMultiple<return>
" Html Input select Options for select for Enum
nnoremap <silent> ,hioe aoptions_for_select(ChangeClass.ChangeMethods, ChangeObject.ChangeMethod_for_database)<esc>/DeleteThis\\|ChangeClass\\|ChangeMethods\\|ChangeObject\\|ChangeMethod<return>
" Html Input Grouped options for select
nnoremap <silent> ,hiog agrouped_options_for_select(ChangeOptionsListDisplayFirstValueSecond, ChangeSelectedOptionOrOptionsIfMultiple)<esc>/DeleteThis\\|ChangeOptionsListDisplayFirstValueSecond\\|ChangeSelectedOptionOrOptionsIfMultiple<return>
" Html Input Attributes Main
nnoremap <silent> ,hiam :call IndentTemplate('views/forms/attributes.html.erb')<return>/ChangeOrRemove<return>











" 
" 
"" Html Input Select Toggle Display
"nnoremap <silent> ,hist :call IndentTemplate('views/forms/inputs_select_display_toggle.html.erb')<return>/ChangeMethod\\|DeleteThis\\|ChangeOrRemove\\|ChangeOptionObjects\\|ChangeOptionObject\\|ChangeValue\\|ChangeDisplay\\|ChangeToggleClass\\|ChangeShowClass\\|ChangeDefaultDisplayWhenNotHidden\\|ChangeLogicForSelected<return>
"" Html Input Checkboxes Base
"nnoremap <silent> ,hicb :call IndentTemplate('views/forms/inputs_checkboxes_base.html.erb')<return>/DeleteThis\\|ChangeAttributeDisplay\\|ChangeAttribute\\|ChangeOrRemove<return>
"" Html Input Checkbox Stand alone
"nnoremap <silent> ,hics :call IndentTemplate('views/forms/inputs_checkbox_stand_alone.html.erb')<return>/DeleteThis\\|ChangeAttributeDisplay\\|ChangeAttribute\\|ChangeOrRemove<return>
"" Html Input Checkbox stand alone Label first
"nnoremap <silent> ,hicl :call IndentTemplate('views/forms/inputs_checkbox_stand_alone_label_first.html.erb')<return>/DeleteThis\\|ChangeAttributeDisplay\\|ChangeAttribute\\|ChangeOrRemove<return>
"
