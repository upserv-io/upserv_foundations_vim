" Ruby Basic Frozen String
nnoremap <silent> ,rbfs a# frozen_string_literal: true

" Ruby Basic CLass
nnoremap <silent> ,rbcl :call CreateBaseFile(1, 0, 0)<return>
" Ruby Basic MOdule
nnoremap <silent> ,rbmo :call CreateBaseFile(0, 0, 0)<return>
" Ruby Basic Concern
nnoremap <silent> ,rbco :call CreateBaseFile(0, 0, 1)<return>/inner_followup<return>cgn<esc>:call IndentTemplate('ruby_basics/concern.rb')<return>/ChangeTopLevelDocumentation<return>

" Ruby Basic String from Time
nnoremap <silent> ,rbst astrftime('%A, %B %-d, %Y')<return># DeleteThis - %A gets day spelled out - "Sunday"; %a gets day spelled out abbreviated - "Sun"<return>DeleteThis - %B gets month spelled out - "January"; %b gets month spelled out abbreviated - "Jan"<return>DeleteThis - %d gets day of month (ex 01-31); %-d gets day of month with blank instead of 0 padding (ex 1-31)<return>DeleteThis - %Y gets full year - 2021; %y gets last 2 digits of year - 21<return>DeleteThis - see here for more https://apidock.com/ruby/DateTime/strftime<return><esc>/%A, %B %-d, %Y\\|DeleteThis<return>

"" Ruby Basic Code Challenge
"nnoremap <silent> ,rbcc a# frozen_string_literal: true<return><backspace><backspace><return>Dir['./app/**/*.rb'].each do \|file\|<return>require file<return>end<esc>
"" Ruby Basic IF
"nnoremap <silent> ,rbif aif ChangeThisPls<return>end<esc>/ChangeThisPls<return>
"" Ruby Basic IF inline
"nnoremap <silent> ,rbiF aChangeThisPls if ChangeThisPls<esc>/ChangeThisPls<return>
"" Ruby Basic If Else
"nnoremap <silent> ,rbie aif ChangeThisPls<return>else<return>end<esc>/ChangeThisPls<return>
"" Ruby Basic If Else if else
"nnoremap <silent> ,rbiE aif ChangeThisPls<return>elsif ChangeThisPls<return>else<return>end<esc>/ChangeThisPls<return>
"" Ruby Basic Unless
"nnoremap <silent> ,rbun aunless ChangeThisPls<return>end<esc>/ChangeThisPls<return>
"" Ruby Basic Unless
"nnoremap <silent> ,rbuN aChangeThisPls unless ChangeThisPls<esc>/ChangeThisPls<return>
"" Ruby Basic CAse
"nnoremap <silent> ,rbca acase ChangeThisPls<return>when ChangeThisPls<return>else<return>end<esc>/ChangeThisPls<return>
"" Ruby Basic Hash Lookup
"nnoremap <silent> ,rbhl alookup_hash = {<return>ChangeKey: ChangeValue,<return>ChangeKey: ChangeValue<return>}<return>lookup_hash[ChangeVariarble]<return># DeleteThis - you may need to add ".to_sym" to variable<esc>/ChangeKey\\|ChangeValue\\|ChangeVariarble\\|DeleteThis<return>
"" Ruby Basic TErnary
"nnoremap <silent> ,rbte aChangeBoolean ? ChangeTrueResult : ChangeFalseResult<esc>/ChangeBoolean\\|ChangeTrueResult\\|ChangeFalseResult<return>
"" Ruby Basic Puts Debugger
"nnoremap <silent> ,rbpd aputs 'WWWWWWWWWWWWWWWWWWWWWWWWWWWW'<return>puts 'WWWWWWWWWWWWWWWWWWWWWWWWWWWW'<return>puts 'WWWWWWWWWWWWWWWWWWWWWWWWWWWW'<return>puts 'WWWWWWWWWWWWWWWWWWWWWWWWWWWW'<return>puts 'WWWWWWWWWWWWWWWWWWWWWWWWWWWW'<return>puts 'WWWWWWWWWWWWWWWWWWWWWWWWWWWW'<return>puts nil<return>puts 'ChangeLabel:'<return>puts ChangeThisPls<esc>/ChangeLabel\\|ChangeThisPls<return>
"" Ruby Basic puts Json pretty Generate
"nnoremap <silent> ,rbjg aputs JSON.pretty_generate(ChangeHash)<esc>/ChangeHash<return>
"" Ruby Basic puts Json pretty Generate
"nnoremap <silent> ,rbjp aJSON.parse(ChangeNonHash)<esc>/ChangeNonHash<return>
"
"nnoremap <silent> ,rbde a# ChangeDescription<return><backspace><backspace>def ChangeMethod<return>end<esc>/ChangeDescription\\|ChangeMethod<return>
"" Ruby Basic Attach File
"nnoremap <silent> ,rbaf aattach(io: File.open(Rails.root.join(ChangePath)), filename: 'ChangeFileName', content_type: 'ChangeContentType')<return># DeleteThis - common file types: application/pdf, image/jpeg, image/gif, image/png, video/quicktime, video/mp4, video/webm, audio/ogg<esc>/ChangePath\\|ChangeFileName\\|ChangeContentType<return>
"" Ruby Basic Cancancan Model based
"nnoremap <silent> ,rbcm acan?(:ChangeAbility, @ChangeObject)<esc>/ChangeAbility\\|ChangeObject<return>
"" Ruby Basic Cancancan Non-mmodel Model based (granular / controller action specific)
"nnoremap <silent> ,rbcn acan?(:ChangeAbility, :ChangeControllerOrFeature)<esc>/ChangeAbility\\|ChangeControllerOrFeature<return>
"" Ruby Basic Interpolated String
"nnoremap <silent> ,rbis a#{}<esc>i
"
"" Ruby Basic Dir
"nnoremap <silent> ,rbdi a# DeleteThisNote: ** searches all subfolders; *.ChangeExtension searches all file names wit that extension; the final * makes sure to include erb files<return><backspace><backspace>Dir[Rails.root.join('app', 'ChangePath', '**', '*.ChangeExtension')].each do \|path\|<return># DeleteThisNote: add logic here...<return>DeleteThisNote: use this to clean file name: path.remove(Rails.root.join('app', 'ChangePath')).split('<delete>.ChangeExtension').first<return><backspace><backspace>end<esc>/DeleteThisNote\\|ChangePath\\|ChangeExtension<return>
"" Ruby basic Rails Root
"nnoremap <silent> ,rbrr aRails.root.join('ChangeThis', 'ChangeThis', 'Etc.')<esc>/ChangeThis\\|Etc.<return>
"" Ruby Basic BEgin
"nnoremap <silent> ,rbbe arescue StandardError => e<return># DeleteThis - some exception handling<return><backspace><backspace>else<return># DeleteThis - add logic to run only when no errors occur<return><backspace><backspace>ensure<return># DeleteThis - add logic to run whether there are error or not<esc>/DeleteThis<return>
"" Ruby Basic BEgin (full)
"nnoremap <silent> ,rbbE abegin<return># DeleteThis - have code that could possibly error<return><backspace><backspace>rescue StandardError => e<return># DeleteThis - some exception handling<return><backspace><backspace>else<return># DeleteThis - add logic to run only when no errors occur<return><backspace><backspace>ensure<return># DeleteThis - add logic to run whether there are error or not<return><backspace><backspace>end<esc>/DeleteThis<return>
