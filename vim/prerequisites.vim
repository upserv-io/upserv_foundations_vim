" Check if the variable is not defined before setting it
if !exists("g:path_to_upserv_foundations_vim")
  let g:path_to_upserv_foundations_vim = '~/.upserv_foundations_vim/'
endif

" this probably needs to be cleaned. Idk if all of these are still used

" get current file
" use this instead of expand('%') because expand sometimes does from project
" root and other times from computer root
function! GetCurrentFile()
  let project_root = finddir('.git', ';')
  let current_file = expand('%')
  return fnamemodify(current_file, ':~:' . project_root . ':t')
endfunction
"
" Run tests for current file
function! FileTestCurrentFile(use_shell, entire_file)
  execute ':wa'
  let test_file = GetTestFile()
  if a:entire_file == 0
    let suffix = ':'. line('.')
  else 
    let suffix = ' -f'
  endif
  let test_command = 'rails t ' . test_file . suffix
  if a:use_shell == 0
    execute ':!' test_command
  else 
    let @+ = test_command
  endif
endfunction
" Get test file name
function! GetTestFile()
  let file = expand('%')
  " if file is view, js or stylesheet, open test for related controller
  if match(file, 'app/views') != -1
    let file = substitute(expand('%:h'), 'views', 'controllers', '') . '_controller.rb'
  elseif match(file, 'app/assets/stylesheets') != -1
    let file = substitute(expand('%:h'), 'assets/stylesheets', 'controllers', '') . '_controller.rb'
  elseif match(file, 'app/javascript/packs') != -1
    let file = substitute(expand('%:h'), 'javascript/packs', 'controllers', '') . '_controller.rb'
  endif
  " modify file name for non test files
  if index(split(file, '/'), 'test') == -1
    let file = substitute(file, '.rb', '_test.rb', '')
  endif
  return substitute(file, 'app\|lib\|test', 'test', '')
endfunction

" Run spec for current file
function! SpecRunCurrentFile(use_shell, entire_file)
  execute ':wa'
  let test_file = GetSpecFile()
  if a:entire_file == 0
    let suffix = ':'. line('.')
  else 
    let suffix = ' --fail-fast'
  endif
  let test_command = 'bundle exec rspec ' . test_file . suffix
  if a:use_shell == 0
    execute ':!' test_command
  else 
    let @+ = test_command
  endif
endfunction

function! GetSpecFile()
  let file = expand('%')
  " if file is active admin, convert active admin file path to admin
  " controller file path
  if match(file, 'app/admin') != -1
    let file = substitute(file, 'app/admin', 'app/controllers/admin', '')
    let file = substitute(file, '.rb', '_controller.rb', '')
  endif
  " if file is view, js or stylesheet, open test for related controller
  if match(file, 'app/views') != -1
    let file = substitute(expand('%:h'), 'views', 'controllers', '') . '_controller.rb'
  elseif match(file, 'app/assets/stylesheets') != -1
    let file = substitute(expand('%:h'), 'assets/stylesheets', 'controllers', '') . '_controller.rb'
  elseif match(file, 'app/javascript/packs') != -1
    let file = substitute(expand('%:h'), 'javascript/packs', 'controllers', '') . '_controller.rb'
  endif
  " modify file name for non spec files
  if index(split(file, '/'), 'spec') == -1
    let file = substitute(file, '.rb', '_spec.rb', '')
  endif
  return substitute(file, 'app\|lib\|spec', 'spec', '')
endfunction

" Tests Included and Not included
function! TestIncludedNotIncluded()
  execute "normal! aincluded = [ChangeTable(:ChangeFixture).id]\<return>included << ChangeTable(:ChangeFixture).id\<return>assert_equal included.sort, (result & included).sort\<return>not_included = [ChangeTable(:ChangeFixture).id]\<return>not_included << ChangeTable(:ChangeFixture).id\<return>assert_empty not_included & result"
endfunction

function! FindProjectRoot()
  let current_file_with_extension = expand('%')
  execute ":Explore .git/.."
  let root_folder = getcwd()
  execute ":e " . current_file_with_extension
  return root_folder
endfunction

" Chat GPT suggested this but it doesn't work... So I'm using my solution
" above which is hacky but at least it works
function! FindProjectRoot2()
  let currdir = getcwd()
  let projdir = currdir

  while projdir != '/'
    if filereadable(projdir . '/.git')
      return projdir
    endif
    let projdir = fnamemodify(projdir, ':h')
  endwhile
  return ''
endfunction

function! ConvertSnakeToPascalCase(str)
  let words = split(a:str, '/')
  let pascalCase = []
  for word in words
    let camelCaseWord = substitute(word, '\(\w\)\(\w*\)', '\u\1\2', '')
    let pascalCaseWord = substitute(camelCaseWord, '_\(\w\)', '\u\1', '')
    call add(pascalCase, pascalCaseWord)
  endfor
  let result = join(pascalCase, '::')
  return result
endfunction

function! CreateBaseFile(class_or_module, include_outer_followup, include_inner_followup)
  let root = FindProjectRoot()
  let current_file = expand('%:r')
  " sometimes vim goes all the way to the very root directory but we only the
  " project root... so this remove anything before the root
  let current_file = split(current_file, root)[0]
  " default to skip 2 levels. Ex. we exclude app/controllers, lib/whatever,
  " test/models, etc. All class names in rails skip the first 2 levels for the
  " most part (or at least they should)
  "let l:skip_levels = get(a:args, 3, 2)
  let l:skip_levels = 2

  let splits = split(current_file, '/')
  let length = len(splits)
  let count = 1
  for split in splits
    if count > l:skip_levels
      execute "normal! o\<space>\<backspace>"
      " regex below will create camel case only after '_' so need to manually
      " add '_' before first word
      execute "normal! a_" . split
      if count == length
        let class_or_module = 'class'
      else
        let class_or_module = 'module'
      endif
      execute 'normal! I' . class_or_module . ' '
    endif
    let count = count + 1
  endfor

  " make camel case by replacing all _x with X
  " NOTE you can use the substitute funciton instead as long as the snake
  " string starts with an underscore. Consider refactoring
  " let camel_string = substitute(snake_string, '_\([a-zA-Z]\)', '\u\1',  'g')
  " this would change _some_file_name to SomeFileName
  %s/_\([a-zA-Z]\)/\u\1/g

  let count = l:skip_levels
  while count < length
    execute "normal! oend"
    let count = count + 1
  endwhile

  execute "normal! ggi# frozen_string_literal: true\<esc>\<down>O"

  if a:include_outer_followup == 1
    normal! oouter_followup
  endif

  let @/ = 'class'
  execute "normal! nO# ChangeTopLevelDocumentation"

  if a:include_inner_followup == 1
    execute "normal! \<down>oinner_followup"
  elseif a:class_or_module == 1
    execute "normal! \<down>odef initialize(ChangeArgs)\<return>end"
  endif

  let @/ = 'class'
  if a:class_or_module == 0
    normal! ncgnmodule
  endif
  let @/ = 'ChangeTopLevelDocumentation\|ChangeArgs'
  normal! n
endfunction


function! IndentTemplate(template_path)
  call IndentTemplateFrom('', a:template_path)
endfunction
function! IndentTemplateFrom(start, template_path)
  " set indentations
  " if there is a starting point set indentations based on starting point
  if a:start != ''
    let @/ = a:start
    normal! n
    " when there is a starting point, the cursor is actually 1 column too
    " far compared to when on an empty line so subtract 1
    let indentations = (col('.') - 1) /  2
  " if there is no starting point, set indentations based on current cursor
  " position
  else
    let indentations = col('.') /  2
  endif 
  " if ther is a starting point, go back to it (cursor position is reset after
  " each execute command, so if there is a start, it must be searched again
  " and it must be search again and all in one inline command)
  if a:start == ''
    "execute "normal! mbO\<esc>mt:read " . g:path_to_upserv_foundations_vim . "templates/" . a:template_path . " \<return>v`b" . indentations . ">"
    execute "normal! mbO\<esc>mt:read " . g:path_to_upserv_foundations_vim . "templates/" . a:template_path . " \<return>"
    " when indentations == 0, doing "0>" does the same as "1>" and therefore
    " indents by 1 when we don't want to... so we only need to indent if indentations > 0
    if indentations > 0
      execute "normal! v`b" . indentations . ">"
    endif
  else
    execute "normal! /" . a:start . "\<return>mbO\<esc>mt:read " . g:path_to_upserv_foundations_vim . "templates/" . a:template_path . " \<return>0v`b" . indentations . ">"
  endif
  " Delete top and bottom
  " delete starting point because read function reads one line after start
  " which leaves an empy line at the beginning we need to delete (or leaves
  " start text which we also want to delete)
  normal! `tdd`bdd
endfunction

function! SetTerminals()
  " Get the current count of terminal buffers
  let l:currentTerminalCount = TerminalCount()

  " Calculate the number of terminals needed
  let l:missingTerminalCount = 5 - l:currentTerminalCount

  " Open missing terminal buffers and hide their windows
  while l:missingTerminalCount > 0
    " Open a new terminal buffer
    term

    " Decrease the count of missing terminals
    let l:missingTerminalCount = l:missingTerminalCount - 1

    " Hide the current window
    wincmd j
  endwhile
endfunction

"function! SetTerminals()
"  " Get the current count of terminal buffers
"  let l:currentTerminalCount = TerminalCount()
"
"  " Calculate the number of terminals needed
"  let l:missingTerminalCount = 5 - l:currentTerminalCount
"
"  " Open missing terminal buffers
"  while l:missingTerminalCount > 0
"    " Open a new terminal buffer
"    belowright term
"
"    " Decrease the count of missing terminals
"    let l:missingTerminalCount = l:missingTerminalCount - 1
"  endwhile
"endfunction

"function! SetTerminals()
"  " we want 5 terminals (using 0 array start)
"    " 0. Base terminal
"    " 1. Console
"    " 2. Server
"    " 3. Debugger
"    " 4. Test
"  let l:missingTerminalCount = 5 - TerminalCount()
"  
"  while l:missingTerminalCount > 0  
"    vsp
"    call GoToNextWindow(1)
"    ter
"    close
"    let l:missingTerminalCount = l:missingTerminalCount - 1
"  endwhile
"endfunction
function! GetTerminalInfo()
  let l:blist = map(filter(copy(getbufinfo()), 'v:val.listed == 1'), 'v:val.bufnr')
  let l:terminals = []
  for l:item in l:blist
    if getbufvar(l:item, '&buftype') == 'terminal'
      call add(l:terminals, {'bufnr': bufnr(l:item), 'winnr': bufwinnr(l:item)})
    endif
  endfor
  return l:terminals 
endfunction
function! TerminalCount()
  let l:blist = map(filter(copy(getbufinfo()), 'v:val.listed == 1'), 'v:val.bufnr')
  let l:terminalCount = 0
  for l:item in l:blist
    if getbufvar(l:item, '&buftype') == 'terminal'
      let l:terminalCount = l:terminalCount + 1
    endif
  endfor
  return l:terminalCount
endfunction

function! ToggleTerminalInWindow(terminalNumber, split_window)
  " See note in SetTerminals function mapping terminal number
  " to purpose
  " Make sure defult terminals have been set
  call SetTerminals()
  let l:terminalInfo = GetTerminalInfo()[a:terminalNumber]
  if l:terminalInfo['winnr'] != -1
    execute l:terminalInfo['winnr'] 'wincmd w'
    execute 'normal! a'
  else
    if a:split_window == 1
      execute ':bo sp'
    endif
    execute ':buf' l:terminalInfo['bufnr']
    execute 'normal! a'
  endif
  " would be nice to run: execute "normal! \<esc>q<return>\<C-c>\<esc>"
  " but that doesn't work from shell... so any mapping that uses this needs to
  " have that in it... sad
endfunction

function! ReadTemplate(template_path)
  " mark bottom then do O in case we are on empty file. This way, whether we are 
  " starting on a file that already has contents or is empty, we have an empty
  " line at before and after the tempalte which we can then delete afer
  " reading the tempalte. This creates consistency.
  execute "normal! mbO\<esc>mt:read " . g:path_to_upserv_foundations_vim . "templates/" . a:template_path . "\<return>`bdd`tdd"
endfunction

function! ClearBuffers()
  " listed is buffers in tabs; loaded is basiclly listed + any loaded files
  " that are not in the tabs - only example I have of this is nerd tree.
  " Not hidden is any loaded buffer in a window plus all other non-loaded buffers.
  " We want to clear the listed_hidden.
  " except not the termnals
  let l:blist = map(filter(copy(getbufinfo()), 'v:val.listed == 1 && v:val.hidden == 1'), 'v:val.bufnr')
  for l:item in l:blist
    if getbufvar(l:item, '&buftype') != 'terminal'
      execute ':bd' l:item
    endif
  endfor
endfunction

function! ClearBuffer()
  let buf_number = bufnr()
  " normally, we don't delete terminal buffer but rather switch to other buffer
  " because we like to keep terminal buffer with all previous content /
  " commands and we only want to have one terminal buffer so we try to never
  " delete it or create new ones
  if &buftype == 'terminal'
    " simply go to next buffer if there are other buffers
    call GoToNextBuf(1)
    " if all remaining buffers are terminals, then GoToNextBuf will result
    " in landing on the same terminal buffer that it started on (this would only happen if
    " somehow multiple terminal buffers and no other non-terminal /
    " non-special buffers remaining which shoulding happen because we try to
    " only keep one terminal buffer but it could happen). In this case, go to
    " next buffer (if there is one) and go ahead and delete current terminal buffer
    if buf_number == bufnr()
      let next_buf_number = NextBuf(1)
      execute ':b ' . next_buf_number
      " ! is needed to delete terminal buffer
      execute 'bd! ' . buf_number
    endif 
 " if not terminal but there are unsaved changes - send warning
  elseif  &modified == 1
    echo "Buffer has unsaved changes. Please save or execute :bd!"
  " delete buffer if not terminal and all changes saved
  else 
    " NOTE: we will go to next buffer first, THEN delete the buffer. We do
    " this because if we simply delete buffer and there are multiple windows,
    " then deleting the buffer will also close the window which i find
    " annoying because I like to set up my windows as columns and so when I
    " delete a buffer, I would prefer the window to remain and be filled with
    " the next buffer.
    " This creats a minor problem when deleting non listed buffers because
    " when you open a non-listed buffer, the next buffer is not necessary the
    " buffer you would expect. For example, if you are on buffer 1 and then
    " opn the file eplorer and then delete the file explorer buffer, you would
    " expect it to go back to buffer 1 (in fact this is excactly what happens
    " if there is only one window and you do :bd. My goal here is to replicate
    " that when there are multiple windows)
    " In order for this to work, we need to know the previous buffer number. I
    " am not sure if there is a better way to do it so for now, on certain
    " functions, I am settinga global variable g:came_from_buf_num when I open
    " a non-listed buffer. 
    " So, first check if we are on a non-listed buffer
    " If we are, then check and see if g:came_from_buf_num exists
    " If it does, then go to that buffer and delete the non-listed buffer
    " If not, then just delete the buffer and if we are on multiple windows,
    " assume the window was meant to be delted (like the help window)
    " 
    " 
    " actually I'm editing below to include logic for file explorer buffers 
    " (file explorer buf name is the same as expand('%:r') because r removes
    " extension and file explorer does not have an extension. Most other
    " files, bufname() is the same as expand('%'). So this is
    " basically delete buffer but not window if coming from file explorer (and
    " try to open buffer you came from but if you can't then just go to next
    " buffer). Otherwise, delete buffer without changing buffers first which
    " will also close window (which is actually what we want for help windows
    " and nerd tree)
    " 
    " if not listed
    if filter(copy(getbufinfo()), 'v:val.bufnr == ' . buf_number)[0].listed == 0 
      " if nerd tree, do not switch buffer. Delete buffer which will also
      " close window
      if stridx(expand('%'), 'NERD_tree_') != -1
        execute ':bd ' . buf_number
      " if file explorer, switch buffers rather than deleting buffer (so window
      " does not close)
      elseif bufname() == expand('%:r')
        " try to go to buffer you came from 
        if get(g:, 'came_from_buf_num', 0)
          execute ':b ' . g:came_from_buf_num
        " otherwise, go to to the next buffer
        else
          call GoToNextBuf(1)
        endif
      " in all other cases of non listted buffers, do not switch buffers. Delete
      " the non-listed buffer which will close the window
      else
        execute ':bd ' . buf_number
      endif
    " otherwise, go to the next buffer and delete the buffer you wanted to
    " delete.
    else
      call GoToNextBuf(1)
      " if next buffer is same as current buffer, then there is only one
      " non-terminal / regular buffer left. Go to next buffer (if there is
      " one) even if it's terminal and close current. If there are no other
      " buffers, this will delete the buffer and close windows if there are
      " mulitple widnows
      if buf_number == bufnr()
        let next_buf_number = NextBuf(1)
        execute ':b ' . next_buf_number
        execute ':bd ' . buf_number
      else
        execute ':bd' . buf_number
      endif
    endif
  endif
endfunction

function! GoToNextTer(direction)
  echo 'asdf'
  if a:direction == 1
    let adj = 1
  else
    let adj = -1
  end
  let continue = 1
  while continue 
    let nbuf = NextBuf(adj)
    " exit if the next buf is the current buf (otherwise endless loop)
    if nbuf == bufnr()
      let continue = 0
    endif
    if getbufvar(nbuf, '&buftype') != 'terminal'
      if a:direction == 1
        let adj = adj + 1
      else
        let adj = adj - 1
      endif
    else
      let continue = 0
    endif
  endwhile
  exec ':buf' nbuf 
endfunction

function! GoToNextBuf(direction)
  if a:direction == 1
    let adj = 1
  else
    let adj = -1
  end
  let continue = 1
  while continue 
    let nbuf = NextBuf(adj)
    " exit if the next buf is the current buf (otherwise endless loop)
    if nbuf == bufnr()
      let continue = 0
    endif
    if getbufvar(nbuf, '&buftype') == 'terminal'
      if a:direction == 1
        let adj = adj + 1
      else
        let adj = adj - 1
      endif
    else
      let continue = 0
    endif
  endwhile
  exec ':buf' nbuf 
endfunction

function WindowSplitVerdically()
  vsp
  call GoToNextWindow(1)
  set wrap
  execute "normal! \<C-W>="
endfunction


function! ProjectType()
  let l:project_type = 'unknown'
  if IsRailsProject()
    let l:project_type = 'rails'
  elseif IsReactNativeExpoProject()
    let l:project_type = 'react native expo'
  elseif IsReactNativeProject()
    let l:project_type = 'react native'
  endif
  return l:project_type
endfunction 

function! IsRailsProject()
  " Get the path of the current file
  let l:current_file = expand('%:p')
  " Check if the Gemfile exists in the current directory or any parent directories
  let l:gemfile_path = findfile('Gemfile', '.;')
  " Check if the config/application.rb file exists in the current directory or any parent directories
  let l:application_rb_path = findfile('config/application.rb', '.;')
  " Check if the app directory exists in the current directory or any parent directories
  let l:app_directory_path = finddir('app', '.;')
  " Check if all the required files/directories were found
  if !empty(l:gemfile_path) && !empty(l:application_rb_path) && !empty(l:app_directory_path)
    return 1
  else
    return 0
  endif
endfunction

function! IsReactNativeExpoProject()
  " Get the path of the current file
  let l:current_file = expand('%:p')
  " Check if package.json exists in the current directory or any parent directories
  let l:package_json_path = findfile('package.json', '.;')
  " Check if app.json exists in the current directory or any parent directories
  let l:app_json_path = findfile('app.json', '.;')
  " Check if the node_modules directory exists in the current directory or any parent directories
  let l:node_modules_directory_path = finddir('node_modules', '.;')
  " Check if the expo directory exists in the current directory or any parent directories
  let l:expo_directory_path = finddir('.expo', '.;')
  " Check if all the required files/directories were found
  if !empty(l:package_json_path) && !empty(l:app_json_path) && !empty(l:node_modules_directory_path) && !empty(l:expo_directory_path)
    return 1
  else
    return 0
  endif
endfunction

function! IsReactNativeProject()
  " Get the path of the current file
  let l:current_file = expand('%:p')

  " Check if package.json exists in the current directory or any parent directories
  let l:package_json_path = findfile('package.json', '.;')

  " Check if metro.config.js exists in the current directory or any parent directories
  let l:metro_config_js_path = findfile('metro.config.js', '.;')

  " Check if the android directory exists in the current directory or any parent directories
  let l:android_directory_path = finddir('android', '.;')

  " Check if the ios directory exists in the current directory or any parent directories
  let l:ios_directory_path = finddir('ios', '.;')

  " Check if all the required files/directories were found
  if !empty(l:package_json_path) && !empty(l:metro_config_js_path) && !empty(l:android_directory_path) && !empty(l:ios_directory_path)
    return 1
  else
    return 0
  endif
endfunction
