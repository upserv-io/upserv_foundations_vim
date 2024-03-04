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
