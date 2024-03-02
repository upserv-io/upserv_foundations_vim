" functinos for the file edit mappitns
function FileEditClipBoad()
  let split = split(@+, ':')
  let file = split[0]
  if len(split) > 1
    execute "normal! :e " . split[0]. "\<return>" . split[1] . "G"
  else
    execute "normal! :e \<C-R>\<C-R>+\<return>"
  endif
endfunction

function FileEditFactories(split_window)
  if a:split_window == 1
    call WindowSplitVerdically()
  endif
  " for Highway
  if filereadable('spec/factories.rb') == 1
    execute ':e spec/factories.rb'
  " for my apps
  else
    if stridx(expand('%'), 'app/models') == 0
      let app = split(expand('%'), '/')[2]
      execute ':e test/factories/' . app
    else
      execute ':e test/factories'
    endif
  endif
endfunction

function FileEditLocales(split_window)
  if a:split_window == 1
    call WindowSplitVerdically()
  endif
  let l:project_type = ProjectType()
  if l:project_type == 'rails'
    execute ':e config/locales'
  elseif l:project_type == 'react native' || l:project_type == 'react native expo'
    execute ':e app/config/locales'
  endif
endfunction


function FileEditeStyle()
  let current_file = expand('%')
  " Rails
  if match(current_file, 'app/assets/stylesheets') != -1
    let directory = expand('%:h')
  elseif match(current_file, 'app/controllers') != -1
    let l:namespaces = split(current_file, '/')
    " if there are 6 namespaces then we are in a child controller so change
    " the current file to be the parent controller
    if len(l:namespaces) == 6
      let current_file = join(l:namespaces[:-2], '/') . '/_controller.rb'
    endif
    let directory = substitute(expand('%'), 'controllers', 'assets/stylesheets', '')
    let directory = substitute(directory, '_controller.rb', '', '')
  elseif match(current_file, 'app/helpers') != -1
    let directory = substitute(expand('%'), 'helpers', 'assets/stylesheets', '')
    let directory = substitute(directory, '_helper.rb', '', '')
  elseif match(current_file, 'app/javascript/packs') != -1
    let directory = substitute(expand('%:h'), 'javascript/packs', 'assets/stylesheets', '')
  " Rails views will not end in .js
  elseif (match(current_file, 'app/views') != -1) && (match(current_file, '.js') == -1)
    let directory = substitute(expand('%:h'), 'views', 'assets/stylesheets', '')
  elseif match(current_file, 'test/controllers') != -1
    let directory = substitute(expand('%'), 'test/controllers', 'app/assets/stylesheets', '')
    let directory = substitute(directory, '_controller_test.rb', '', '')
  elseif match(current_file, 'spec/controllers') != -1
    let directory = substitute(expand('%'), 'spec/controllers', 'app/assets/stylesheets', '')
    let directory = substitute(directory, '_controller_test.rb', '', '')
  " React native
  elseif match(current_file, 'styles.js') != -1
    let directory = 2
    let file = current_file
  elseif match(current_file, '.js') != -1
    let directory = 2
    let file = expand('%:h') . '/styles.js'
  else 
    let directory = 1
  endif

  " unable to find directory
  if directory == 1
    echo 'Unable to find styles for' current_file
  " app is react native
  elseif directory == 2
    if file == current_file
      echo 'Already on styles file'
    else
      execute ':e' file
    endif
  " app is rails
  else
    if isdirectory(directory)
      execute ':Explore' directory
    else
      let new_file = input("There are no style files yet. Create the first one!: " . directory . "/")
      if new_file == ''
        execute "normal! :echo"
      else
        execute ":e " . directory . "/" . new_file
      endif
    endif
  endif
endfunction

function FileEditChild(split_window)
  let l:current_file = expand('%')
  if match(l:current_file, '_controller\.rb$') != -1
    call FileEditChildController(a:split_window)
  else
    call FileEditChildRegular(a:split_window)
  endif
endfunction

function FileEditChildRegular(split_window)
  let current_file = expand('%')
  let directory_of_children = split(current_file, '\.')[0]
  if isdirectory(directory_of_children)
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':Explore' directory_of_children
  else
    let new_file = input("There are no child files yet. Create the first one!: " . directory_of_children . "/")
    if new_file == ''
      execute "normal! :echo"
    else
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute ":e " . directory_of_children . "/" . new_file
    endif
  endif
endfunction
  
function FileEditParent(split_window)
  let l:current_file = expand('%')
  if match(l:current_file, '_controller\.rb$') != -1
    call FileEditParentController(a:split_window)
  else
    call FileEditParentRegular(a:split_window)
  endif
endfunction
function FileEditParentRegular(split_window)
  let current_file = expand('%')
  let split = split(current_file, '/')
  call remove(split, -1)
  let parent = join(split, '/')
  if filereadable(parent . '.rb')
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':e' parent . '.rb'
  elseif filereadable(parent . '.js')
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':e' parent . '.js'
  else
    let grandparent = join(split(parent, '/')[0:-2], '/')
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':Explore ' grandparent
  endif
endfunction

function FileEditChildController(split_window)
  let current_file = expand('%')
  " remove 12 characters for _controller so that ex. jobs_controller
  " becomes jobs
  let directory_of_children = split(current_file, '\.')[0][0:-12]
  if isdirectory(directory_of_children)
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':Explore' directory_of_children
  else
    let new_file = input("There are no child controller files yet. Create the first one!: " . directory_of_children . "/")
    if new_file == ''
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute "normal! :echo"
    else
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute ":e " . directory_of_children . "/" . new_file
    endif
  endif
endfunction

function FileEditParentController(split_window)
  let current_file = expand('%')
  let parent = join(split(current_file, '/')[0:-2], '/') . '_controller.rb'
  if filereadable(parent)
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':e' parent
  else
    let grandparent = join(split(parent, '/')[0:-2], '/')
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':Explore ' grandparent
  endif
endfunction

function FileEditController(split_window)
  if a:split_window == 1
    call WindowSplitVerdically()
  endif
  let current_file = expand('%')
  if match(current_file, 'app/assets/stylesheets') != -1
    let controller = 1
    let file = substitute(expand('%:h'), 'assets/stylesheets', 'controllers', '') . '_controller.rb'
  elseif match(current_file, 'app/controllers') != -1
    let controller = 1
    let file = current_file
  elseif match(current_file, 'app/helpers') != -1
    let controller = 1
    let file = substitute(expand('%'), 'helpers', 'controllers', '')
    let file = substitute(file, '_helper.rb', '_controller.rb', '')
  elseif match(current_file, 'app/javascript/packs') != -1
    let controller = 1
    let file = substitute(expand('%:h'), 'javascript/packs', 'controllers', '') . '_controller.rb'
  elseif match(current_file, 'app/views') != -1
    let controller = 1
    let file = substitute(expand('%:h'), 'views', 'controllers', '') . '_controller.rb'
  elseif match(current_file, 'spec/controllers') != -1
    let controller = 1
    let file = substitute(expand('%'), 'spec/controllers', 'app/controllers', '')
    let file = substitute(file, 'controller_spec', 'controller', '')
  elseif match(current_file, 'test/controllers') != -1
    let controller = 1
    let file = substitute(expand('%'), 'test/controllers', 'app/controllers', '')
    let file = substitute(file, 'controller_test', 'controller', '')
  elseif match(current_file, 'lib/loaders') != -1
    let controller = 1
    let file = substitute(expand('%'), 'lib/loaders', 'app/controllers', '')
    let file = substitute(file, '_loader.rb', '_controller.rb', '')
  elseif match(current_file, 'lib/services') != -1
    let controller = 1
    let file = substitute(expand('%:h'), 'lib/services', 'app/controllers', '') . '_controller.rb'
  " React Native COMPONENTS
  elseif match(current_file, '.js') == -1
    let controller = 1
    let file = 1
  elseif match(current_file, '.js') != -1
    let controller = 0
    let component_base_name = split(expand('%:h'), '/')[-1]
    let file = expand('%:h') . '/' . component_base_name . '.js'
  endif
  
  if controller == 1
    if file == current_file
      echo 'Already on controller file'
    elseif file == 1
      echo 'Unable to find controller for' current_file
    else
      execute ':e' file
    endif
  else
    if file == current_file
      echo 'Already on component file'
    else
      execute ':e' file
    endif
  endif
endfunction

function FileEditHelper(split_window)
  let current_file = expand('%')
  if match(current_file, 'app/assets/stylesheets') != -1
    let file = substitute(expand('%:h'), 'assets/stylesheets', 'helpers', '') . '_helper.rb'
  elseif match(current_file, 'app/controllers') != -1
    let l:namespaces = split(current_file, '/')
    " if there are 6 namespaces then we are in a child controller so change
    " the current file to be the parent controller
    if len(l:namespaces) == 6
      let current_file = join(l:namespaces[:-2], '/') . '/_controller.rb'
    endif
    let file = substitute(current_file, 'controllers', 'helpers', '')
    let file = substitute(file, '_controller.rb', '_helper.rb', '')
  elseif match(current_file, 'app/helpers') != -1
    let file = current_file
  elseif match(current_file, 'app/javascript/packs') != -1
    let file = substitute(expand('%:h'), 'javascript/packs', 'helpers', '') . '_helper.rb'
  elseif match(current_file, 'app/views') != -1
    let file = substitute(expand('%:h'), 'views', 'helpers', '') . '_helper.rb'
  elseif match(current_file, 'spec') != -1
    let file = substitute(expand('%'), 'spec/controllers', 'app/helpers', '')
    let file = substitute(file, 'controller_spec', 'helper', '')
  elseif match(current_file, 'test') != -1
    let file = substitute(expand('%'), 'test/controllers', 'app/helpers', '')
    let file = substitute(file, 'controller_test', 'helper', '')
  else 
    let file = 1
  endif
  if file == current_file
    echo 'Already on helper file'
  elseif file == 1
    echo 'Unable to find helper for' current_file
  else
    if a:split_window == 1
      call WindowSplitVerdically()
    endif
    execute ':e' file
  endif
endfunction

function FileEditModel()
  let current_file = expand('%')
  if match(current_file, 'app/models') != -1
    let file = current_file
  elseif match(current_file, 'lib/services') != -1
    let file = substitute(expand('%:h'), 'lib/services', 'app/models', '') . '.rb'
  elseif match(current_file, 'test/models') != -1
    let file = substitute(current_file, 'test/models', 'app/models', '')
    let file = substitute(file, '_test.rb', '.rb', '')
  else 
    let file = 1
  endif
  if file == current_file
    echo 'Already on model file'
  elseif file == 1
    echo 'Unable to find helper for' current_file
  else
    execute ':e' file
  endif
endfunction

function FileEditView(split_window)
  let current_file = expand('%')
  " Rails
  if match(current_file, 'app/assets/stylesheets') != -1
    let directory = substitute(expand('%:h'), 'assets/stylesheets', 'views', '')
  elseif match(current_file, 'app/controllers') != -1
    let directory = substitute(current_file, 'controllers', 'views', '')
    let directory = substitute(directory, '_controller.rb', '', '')
  elseif match(current_file, 'app/helpers') != -1
    let directory = substitute(expand('%'), 'helpers', 'views', '')
    let directory = substitute(directory, '_helper.rb', '', '')
  elseif match(current_file, 'app/javascript/packs') != -1
    let directory = substitute(expand('%:h'), 'javascript/packs', 'views', '')
  elseif (match(current_file, 'app/views') != -1)
    let directory = expand('%:h')
  elseif match(current_file, 'spec/controllers') != -1
    let directory = substitute(expand('%'), 'spec/controllers', 'app/views', '')
    let directory = substitute(directory, '_controller_spec.rb', '', '')
  elseif match(current_file, 'test/controllers') != -1
    let directory = substitute(expand('%'), 'test/controllers', 'app/views', '')
    let directory = substitute(directory, '_controller_test.rb', '', '')
  else 
    let directory = 1
  endif
  
  " unable to find directory
  if directory == 1
    echo 'Unable to find views for' current_file
  " directory is found
  else
    if isdirectory(directory)
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute ':Explore' directory
    else
      let new_file = input("There are no view files yet. Create the first one!: " . directory . "/")
      if new_file == ''
        execute "normal! :echo"
      else
        if a:split_window == 1
          call WindowSplitVerdically()
        endif
        execute ":e " . directory . "/" . new_file
      endif
    endif
  endif
endfunction

function FileEditSpec(split_window)
  if a:split_window == 1
    call WindowSplitVerdically()
  endif
  execute ':e' GetSpecFile()
endfunction

function FileEditSpecSource()
  let current_file = expand('%')
  let file = substitute(current_file, '_spec.rb', '.rb', '')
  if match(file, 'channel\|controller\|helper\|job\|mailer\|model') != -1
    let file = substitute(file, 'spec', 'app', '')
  else
    let file = substitute(file, 'spec', 'lib', '')
  endif
  execute ':e' file
endfunction

function FileEditTest(split_window)
  if a:split_window == 1
    call WindowSplitVerdically()
  endif
  execute ':e' GetTestFile()
endfunction

function FileEditTestSource()
  let current_file = expand('%')
  let file = substitute(current_file, '_test.rb', '.rb', '')
  if match(file, 'channel\|controller\|helper\|job\|mailer\|model') != -1
    let file = substitute(file, 'test', 'app', '')
  else
    let file = substitute(file, 'test', 'lib', '')
  endif
  execute ':e' file
endfunction
