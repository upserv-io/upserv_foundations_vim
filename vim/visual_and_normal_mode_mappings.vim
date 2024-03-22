" visual mode non-leader key mappings
  " prevent changing case on accident
  vnoremap <silent> u <esc>u
  vnoremap <silent> U <esc>U
  " make insert work in visual mode
  vnoremap <silent> i <esc>i
  vnoremap <silent> a <esc>a
  "comments
  vnoremap <silent> # I# <esc>
  vnoremap <silent> / I// <esc>


" single key non-comma
  " make > & < in normal mode the same as visual mode
  nnoremap <silent> > v><right><right><<esc>
  nnoremap <silent> < v<<left><left><esc>
  " make > & < in visual mode keep the highlighted section after tabbing
  vnoremap <silent> > >gv<right><right>
  vnoremap <silent> < <gv<left><left>
  " select word in visual mode (spacevim does this but I want to get rid of
  " spacevim)
  vnoremap v iw
  " select entire page
  vnoremap sa <esc>ggVG
  " copy entire page
  vnoremap sy <esc>ggVGy
  " paste over entire page
  vnoremap sp <esc>ggVGp
  " cut entire page
  vnoremap sx <esc>ggVGx
  " copy word
  nnoremap <silent> y viwy
  " copy and search
  nnoremap <silent> Y viwy0/<C-R><C-R>+<return>
  vnoremap <silent> Y y0/<C-R><C-R>+<return>
  " cut word or highlighted
  nnoremap <silent> cx viwx<left>
  " replace word or highlighed
  nnoremap <silent> cc viwc
  " make p in visual keep original clipboard
  vnoremap <silent> p :<backspace><backspace><backspace><backspace><backspace>let previous_clipboard = @+<return>gvp:let @+ = previous_clipboard<return>
  " paste word and keep orignal 
  nnoremap <silent> - viwpviwy
  " make - in visual work just like p in visual
  vnoremap <silent> - :<backspace><backspace><backspace><backspace><backspace>let previous_clipboard = @+<return>gvp:let @+ = previous_clipboard<return>
  " paste word and copy word just replaced
  nnoremap <silent> = viwp
  " redo
  nnoremap <S-u> <C-r>
  " o and O but remain in normal mode
  nnoremap <silent> b o <backspace><esc>
  nnoremap <silent> B O <backspace><esc>
  " remap r to s (r is used by new dpad)
  nnoremap <silent> s r
  vnoremap <silent> s r
  
  " remap v-esc feature to f which is easier than v
  nnoremap <silent> f V
  vnoremap <silent> f y

  " paste line over current line
  nnoremap <silent> F VpVy
  
" resize window
  nnoremap <silent> <S-left> :vertical resize -3<return>
  vnoremap <silent> <S-left> :vertical resize -3<return>
  nnoremap <silent> <S-right> :vertical resize +3<return>
  " nnoremap <silent> <D-S-down> :vertical resize -3<return>
  " nnoremap <silent> <D-S-up> :vertical resize +3<return>
  vnoremap <silent> <S-right> :vertical resize +3<return>
  nnoremap <silent> <S-up> :resize +3<return>
  vnoremap <silent> <S-up> :resize +3<return>
  nnoremap <silent> <S-down> :resize -3<return>
  vnoremap <silent> <S-down> :resize -3<return>

" retrain d-pad
  " : is used for dpad now so need to remap :
  nnoremap <silent> ? :
  " up
  nnoremap <silent> l k
  vnoremap <silent> l k
  nnoremap <silent> dl dk
  nnoremap <silent> <S-l> 3<up>
  vnoremap <silent> <S-l> 3<up>
  " down
  nnoremap <silent> k j
  vnoremap <silent> k j
  nnoremap <silent> dk dj
  nnoremap <silent> <S-k> 3<down>
  vnoremap <silent> <S-k> 3<down>
  " NOTE: Shift down is reserved for window resizeing
  " left
  nnoremap <silent> j <left>
  vnoremap <silent> j <left>
  nnoremap <silent> <S-j> 4<left>
  vnoremap <silent> <S-j> 4<left>
  " right
  nnoremap <silent> ; <right>
  vnoremap <silent> ; <right>
  nnoremap <silent> : 4<right>
  vnoremap <silent> : 4<right>
  " far left
  nnoremap <silent> q ^
  vnoremap <silent> q ^
  nnoremap <silent> Q I
  " back to beginning of word
  nnoremap <silent> w b
  vnoremap <silent> w b
  " forward to end of word
  nnoremap <silent> e e
  vnoremap <silent> e e
  " forward to beginning of word
  nnoremap <silent> t w
  vnoremap <silent> t w
  " far right (when in visual mode, use <left> to make sure to not get next line)
  nnoremap <silent> r g_
  vnoremap <silent> r g_
  nnoremap <silent> R A
  " to top of page (keep same gg)
  "
  " to bottom of page (make hh go to bottom like G)
  nnoremap <silent> hh G
  vnoremap <silent> hh G

  " remove highlights
  nnoremap <silent> hn :noh<return>
