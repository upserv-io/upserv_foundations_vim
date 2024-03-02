" autofill
inoremap <silent> <C-space> <C-n>
" prevent return from autocomplete (very annoying because to return you have
" to hit space then return. Now, tab does autocomplete and return does
" return
inoremap <silent> <return> <space><backspace><return>

" bar options
inoremap <silent> <bar><bar><bar> <bar><bar><left>
inoremap <silent> <bar><bar><space> <bar><bar><space>
inoremap <silent> <bar><bar>= <bar><bar>=
" ruby interpolation
inoremap <silent> ## #{}<left>
" js interpolation
inoremap <silent> $$ ${}<left>
" erb
inoremap <silent> <<< <%  %><left><left><left>
" erb entered
inoremap <silent> >>> <%=  %><left><left><left>
" erb comment
inoremap <silent> <<> <%#  %><left><left><left>
  
" Ruby blocks
" b = block
" a = block alternate (mostly for multi line lambdas used as method
" arguments
" o = inline
" x = shorthand
function! RubyBlockBlockInsertMode()
  execute "normal! ado \|\|\<return>end\<esc>\<up>$"
endfunction
" Ruby Block Each
inoremap <silent> eachb each <esc>:call RubyBlockBlockInsertMode()<return>i
inoremap <silent> eacho each { \|\| ChangeLogic }<esc>/ChangeLogic<return>2<left>i
inoremap <silent> eachx each(&:)<left>
" Ruby Block Each With index
inoremap <silent> eachwb each_with_index do \|, index\|<return>end<esc><up>$7<left>i
inoremap <silent> eachwo each_with_index { \|, index\| ChangeLogic }<esc>/ChangeLogic<return>9<left>i
" Ruby Block Times
inoremap <silent> timesb times do \|index\|<return>end<esc>O
inoremap <silent> timeso times { \|index\| ChangeLogic }<esc>/ChangeLogic<return>
" Ruby Block While
inoremap <silent> whileb while <return>end<esc><up>A
" Ruby Block Until
inoremap <silent> untilb until <return>end<esc><up>A
" Ruby Block Until
inoremap <silent> loopb loop do<return>ChangeLogic<return>break if ChangeConditional<return>end<esc>/ChangeLogic\\|ChangeConditional<return>
" Ruby Block Map
inoremap <silent> mapb map <esc>:call RubyBlockBlockInsertMode()<return>i
inoremap <silent> mapo map { \|\| ChangeLogic }<esc>/ChangeLogic<return>2<left>i
inoremap <silent> mapx map(&:)<left>
" Ruby Block Select
inoremap <silent> selectb select <esc>:call RubyBlockBlockInsertMode()<return>i
inoremap <silent> selecto select { \|\| ChangeLogic }<esc>/ChangeLogic<return>2<left>i
inoremap <silent> selectx select(&:)<left>
" Ruby Block Reject
inoremap <silent> rejectb reject <esc>:call RubyBlockBlockInsertMode()<return>i
inoremap <silent> rejecto reject { \|\| ChangeLogic }<esc>/ChangeLogic<return>2<left>i
inoremap <silent> rejectx reject(&:)<left>
" Ruby Block Sort
inoremap <silent> sortb sort do \|a, b\|<return>a.ChangeLogic <=> b.ChangeLogic<return>end<esc>/ChangeLogic<return>cgn
inoremap <silent> sorto sort { \|a, b\| a.ChangeLogic <=> b.ChangeLogic }<esc>/ChangeLogic<return>cgn
" Ruby Block Lambda
inoremap <silent> lambdab lambda <esc>:call RubyBlockBlockInsertMode()<return>i
inoremap <silent> lambdaa lambda { \|\|<return>}<esc><up>$i
inoremap <silent> lambdao ->() { ChangeLogic }<esc>/ChangeLogic<return>4<left>i
inoremap <silent> lambdax lambda(&:ChangeMethod)<esc>/ChangeMethod<return>
" Ruby Block Proc
inoremap <silent> procb proc <esc>:call RubyBlockBlockInsertMode()<return>i
inoremap <silent> proca proc { \|\|<return>}<esc><up>$i
inoremap <silent> proco proc { \|\| ChangeLogic }<esc>/ChangeLogic<return>2<left>i
inoremap <silent> procx proc(&:ChangeMethod)<esc>/ChangeMethod<return>
" Ruby Block Sort By
inoremap <silent> sort_byb sort_by <esc>:call RubyBlockBlockInsertMode()<return>i
inoremap <silent> sort_byo sort_by { \|ChangeObject\| ChangeObjedt.ChangeLogic }<esc>/ChangeObject\\|ChangeLogic<return><esc>n
inoremap <silent> sort_byx sort_by(&:ChangeMethod)<esc>/ChangeMethod<return>

" react native
" useEffect
inoremap <silent> useEffect() useEffect(() => {}, [])<esc>5<left>i<return><esc>O
