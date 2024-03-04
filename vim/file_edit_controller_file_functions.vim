function FileEditeStyle(split_window)
  let current_file = expand('%')
  " Rails
  if match(current_file, 'app/assets/stylesheets') != -1
    let directory = expand('%:h')
  elseif match(current_file, 'app/controllers') != -1
    let directory = substitute(expand('%'), 'controllers', 'assets/stylesheets', '')
    " if there are 6 namespaces then we are in a child controller so
    " remove last namespace
    if len(split(current_file, '/')) == 6
      let directory = join(split(directory, '/')[:-2], '/')
    endif
    let directory = substitute(directory, '_controller.rb', '', '')
  elseif match(current_file, 'app/helpers') != -1
    let directory = substitute(expand('%'), 'helpers', 'assets/stylesheets', '')
    " if there are 6 namespaces then we are in a nested helper so
    " remove last namespace
    if len(split(current_file, '/')) == 6
      let directory = join(split(directory, '/')[:-2], '/')
    endif
    let directory = substitute(directory, '_helper.rb', '', '')
  elseif match(current_file, 'app/javascript/packs') != -1
    let directory = substitute(expand('%:h'), 'javascript/packs', 'assets/stylesheets', '')
  " Rails views will not end in .js
  elseif (match(current_file, 'app/views') != -1) && (match(current_file, '.js') == -1)
    let directory = expand('%:h')
    " if there are 7 namespaces then we are in a child controller view so
    " remove last namespace
    if len(split(current_file, '/')) == 7
      let directory = join(split(directory, '/')[:-2], '/')
    endif
    let directory = substitute(directory, 'views', 'assets/stylesheets', '')
  elseif match(current_file, 'test/controllers') != -1
    let directory = substitute(expand('%'), 'test/controllers', 'app/assets/stylesheets', '')
    let directory = substitute(directory, '_controller_test.rb', '', '')
  elseif match(current_file, 'spec/controllers') != -1
    let directory = substitute(expand('%'), 'spec/controllers', 'app/assets/stylesheets', '')
    let directory = substitute(directory, '_controller_test.rb', '', '')
  " React native (this is just a Clark thing... probably ignore...)
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
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute ':e' file
    endif
  " app is rails
  else
    if isdirectory(directory)
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute ':Explore' directory
    else
      let new_file = input("There are no style files yet. Create the first one!: " . directory . "/")
      if new_file == ''
        if a:split_window == 1
          call WindowSplitVerdically()
        endif
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


function FileEditController(split_window)
  let current_file = expand('%')
  if match(current_file, 'app/assets/stylesheets') != -1
    let controller = 1
    let file = substitute(expand('%:h'), 'assets/stylesheets', 'controllers', '') . '_controller.rb'
  elseif match(current_file, 'app/controllers') != -1
    let controller = 1
    let file = current_file
  elseif match(current_file, 'app/helpers') != -1
    let controller = 1
    let file = expand('%')
    " if there are 6 namespaces then we are in a nested helper so
    " remove last namespace
    if len(split(current_file, '/')) == 6
      let file = join(split(file, '/')[:-2], '/') . '_helper.rb'
    endif
    let file = substitute(file, 'helpers', 'controllers', '')
    let file = substitute(file, '_helper.rb', '_controller.rb', '')
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
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute ':e' file
    endif
  else
    if file == current_file
      echo 'Already on component file'
    else
      if a:split_window == 1
        call WindowSplitVerdically()
      endif
      execute ':e' file
    endif
  endif
endfunction


function FileEditHelper(split_window)
  let current_file = expand('%')
  if match(current_file, 'app/assets/stylesheets') != -1
    let file = substitute(expand('%:h'), 'assets/stylesheets', 'helpers', '') . '_helper.rb'
  elseif match(current_file, 'app/controllers') != -1
    let file = expand('%')
    " if there are 6 namespaces then we are in a nested controller so
    " remove last namespace
    if len(split(current_file, '/')) == 6
      let file = join(split(file, '/')[:-2], '/') . '_controller.rb'
    endif
    let file = substitute(file, 'controllers', 'helpers', '')
    let file = substitute(file, '_controller.rb', '_helper.rb', '')
  elseif match(current_file, 'app/helpers') != -1
    let file = current_file
  elseif match(current_file, 'app/javascript/packs') != -1
    let file = substitute(expand('%:h'), 'javascript/packs', 'helpers', '') . '_helper.rb'
  elseif match(current_file, 'app/views') != -1
    let file = expand('%:h')
    " if there are 7 namespaces then we are in a child controller view so
    " remove last namespace
    if len(split(current_file, '/')) == 7
      let file = join(split(file, '/')[:-2], '/')
    endif
    let file = substitute(file, 'views', 'helpers', '') . '_helper.rb'
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

function FileEditView(split_window)
  let current_file = expand('%')
  if match(current_file, 'app/assets/stylesheets') != -1
    let directory = substitute(expand('%:h'), 'assets/stylesheets', 'views', '')
  elseif match(current_file, 'app/controllers') != -1
    let directory = substitute(current_file, 'controllers', 'views', '')
    let directory = substitute(directory, '_controller.rb', '', '')
  elseif match(current_file, 'app/helpers') != -1
    let directory = expand('%')
    " if there are 6 namespaces then we are in a nested helper so
    " remove last namespace
    if len(split(current_file, '/')) == 6
      let directory = join(split(directory, '/')[:-2], '/') . '_helper.rb'
    endif
    let directory = substitute(directory, 'helpers', 'views', '')
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
