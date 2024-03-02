" Javascript Stimulus Base Channel
nnoremap <silent> ,jsbc :call ReadTemplate('javascript/stimulus/base.js')<return>:call JavascriptStimulusBaseChannel()<return><esc>/DeleteThis\\|someValue\\|someData\\|some_param<return>
function! JavascriptStimulusBaseChannel()
  let name = expand('%')
  let name = split(name, '_controller.js')[0]
  let name = split(name, '/javascript/controllers/')[1]
  let kebab_case = substitute(name, '_', '-', 'g')
  let kebab_case = substitute(kebab_case, '/', '--', 'g')
  let pascal_case = ConvertSnakeToPascalCase(name)
  execute "normal! /controller-kebab-case\<return>cgn" . kebab_case . "\<esc>/ControllerPascalCase\<return>cgn" . pascal_case
endfunction
