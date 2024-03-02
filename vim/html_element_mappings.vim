" Html Elements BUtton
nnoremap <silent> ,hebu :call IndentTemplate('views/elements/button.html.erb')<return>/ChangeTitle<return>
" Html Elements Content Tag
nnoremap <silent> ,hect :call IndentTemplate('views/elements/content_tag.html.erb')<return>/ChangeElementType\\|ChangeContentsOrRemoveThisAndAddBlock\\|AddHtmlOptionsOrRemoveThis\\|ChangeValue<return>
" Html Elements Icon
nnoremap <silent> ,heic a<i class="text-primary pressable fa-solid fa-ChangeIcon"></i><esc>/ChangeIcon<return>
" Html Elements Icon List
nnoremap <silent> ,heil :call IndentTemplate('views/elements/icon_list.html.erb')<return>
" Html Elements Image Tag
nnoremap <silent> ,heit :call IndentTemplate('views/elements/image_tag.html.erb')<return>/DeleteThis\\|ChangeModel\\|ChangeAttachment\\|ChangeOrRemove<return>
" Html Elements Link To
nnoremap <silent> ,helt a<%= link_to ChangeDisplay, ChangePath_path %><esc>/ChangeDisplay\\|ChangePath<return>
" Html Elements Link to Attachment
nnoremap <silent> ,hela :call IndentTemplate('views/elements/link_to_attachment.html.erb')<return>/DeleteThis\\|ChangeDisplay\\|ChangeModel\\|ChangeAttachment<return>
" Html Elements Link to Download
nnoremap <silent> ,held :call IndentTemplate('views/elements/link_to_download.html.erb')<return>/DeleteThis\\|ChangeDisplay\\|ChangeModel\\|ChangeAttachment<return>
" Html Elements Link to Icon
nnoremap <silent> ,heli :call IndentTemplate('views/elements/link_to_icon.html.erb')<return>/ChangePath\\|ChangeIcon<return>
" Html Elements Render Partial
nnoremap <silent> ,herp a<%= render '<esc>:call FileCopyPartialPath()<return>pa/ChangePartial', ChangeLocal: ChangeLocal %><esc>/ChangePartial\\|ChangeLocal<return>
" Html Elements Stimulus element for action cable Channel
nnoremap <silent> ,hesc :call IndentTemplate('views/elements/stimulus_element_for_action_cable_channel.html.erb')<return>/ChangeKebabPathToController\\|some_data\\|ChangeValue<return>
" Html Elements Video Tag
nnoremap <silent> ,hevt :call IndentTemplate('views/elements/video_tag.html.erb')<return>/DeleteThis\\|ChangeModel\\|ChangeAttachment\\|ChangeOrRemove<return>





"" Html Elements Anchor new Tab
"nnoremap <silent> ,heat a<%= link_to(ChangeDisplay, ChangePath_path, target: :_blank) %><esc>/ChangeDisplay\\|ChangePath<return>
"" Html Elements Anchor with Class
"nnoremap <silent> ,heac a<%= link_to(ChangeDisplay, ChangePath_path, class: 'ChangeClass') %><esc>/ChangeDisplay\\|ChangePath\\|ChangeClass<return>
"" Html Elements Anchor Icon (classes only)
"nnoremap <silent> ,heai aicon px-3 fs-4 text-ChangeColor mdi mdi-ChangeIcon<esc>/ChangeColor\\|ChangeIcon<return>
"" Html Elements Anchor Icon (full)
"nnoremap <silent> ,heaI a<%= link_to('', ChangePath_path, class: 'icon px-3 fs-4 text-ChangeColor mdi mdi-ChangeIcon') %><esc>/ChangePath\\|ChangeColor\\|ChangeIcon<return>
"" Html Elements Anchor Button (classes only)
"nnoremap <silent> ,heab abtn btn-ChangeColor<esc>/ChangeColor<return>
"" Html Elements Anchor Button (full)
"nnoremap <silent> ,heaB a<%= link_to(ChangeDisplay, ChangePath_path, class: 'btn btn-ChangeColor') %><esc>/ChangeDisplay\\|ChangePath\\|ChangeColor<return>
"" Html Elements Anchor Ajax
"nnoremap <silent> ,heaa a<%= link_to(ChangeDisplay, ChangePath_path, method: :ChangeMethod, remote: true) %><esc>/ChangeDisplay\\|ChangePath\\|ChangeMethod<return>
"" Html Elements Anchor No href
"nnoremap <silent> ,hean a<%= content_tag('A', ChangeDisplay, class: "no-href-link no-href-icon") %><return><esc>:call NoHrefComment()<return>/ChangeDisplay\\|no-href-link\\|no-href-icon\\|DeleteThis<return>
"" Html Elements Anchor Modal
"nnoremap <silent> ,heam a<%= content_tag('A', ChangeDisplay, class: 'no-href-link no-href-icon', data: { toggle: 'modal', target: '#ChangeModalId_modal' }) %><return><esc>:call NoHrefComment()<return>o<div id="ChangeModalId_modal" class="modal fade" tabindex="-1" role="dialog"><return><%= render('ChangePath/ChangeTemplate_ChangeModal_modal') %><return></div><esc>/ChangeDisplay\\|ChangeColor\\|no-href-link\\|no-href-icon\\|DeleteThis\\|ChangeModalId\\|ChangeErbIfNecessary\\|ChangePath\\|ChangeTemplate\\|ChangeModal<return>
"" Html Elements Anchor Remote (attributes only)
"nnoremap <silent> ,hear a remote: true, method: :ChangeMethod,<esc>/ChangeMethod<return>
"" Html Elements Anchor Remote (full)
"nnoremap <silent> ,heaR a<%= link_to(ChangeDisplay, ChangePath_path, remote: true, method: :ChangeMethod) %><esc>/ChangeDisplay\\|ChangePath\\|ChangeMethod<return>


 
 
 
" " Html Elements DIv
" nnoremap <silent> ,hedi a<div><return></div><esc>k
" " Html Elements Div with Class
" nnoremap <silent> ,hedc a<div class="ChangeClass"><return></div><esc>/ChangeClass<return>
" " Html Elements PAragraph
" nnoremap <silent> ,hepa a<p><return>ChangeThisPls<return></p><esc>/ChangeThisPls<return>
" " Html Elements SPan
" nnoremap <silent> ,hesp a<span><return></span><esc><up>
" nnoremap <silent> ,hesc a<span class="ChangeClass"><return></span><esc>/ChangeClass<return>
" " Html Elements STrong
" nnoremap <silent> ,hest a<strong>ChangeThisPls</strong><esc>/ChangeThisPls<return>
" " Html Elements ICon
" nnoremap <silent> ,heic a<i class="icon px-3 fs-4 text-ChangeColor mdi mdi-ChangeIcon"></i><return><%# DeleteThis - common options include: edit delete more plus-circle-o check info-outline alert-triangle close-circle-o close plus %><esc>/px-3\\|fs-4\\|ChangeColor\\|ChangeIcon\\|DeleteThis<return>
" " Html Elements BUtton
" nnoremap <silent> ,hebu a<button class="btn btn-ChangeColor">ChangeText</button><esc>/ChangeColor\\|ChangeText<return>
" " Html Elements Button Icon (classes only)
" nnoremap <silent> ,hebi abtn-icon px-3 fs-4 text-ChangeColor mdi mdi-ChangeIcon<esc>/ChangeColor\\|ChangeIcon<return>
" " Html Elements Button Icon (full)
" nnoremap <silent> ,hebI a<button class="btn-icon px-3 fs-4 text-ChangeColor mdi mdi-ChangeIcon"></button><esc>/ChangeColor\\|ChangeIcon<return>
" " Html Elements Button Link (classes only)
" nnoremap <silent> ,hebl abtn-link<esc>
" " Html Elements Button Link (full)
" nnoremap <silent> ,hebL a<button class="btn-link">ChangeText</button><esc>/ChangeText<return>
" " Html Elements TAble
" nnoremap <silent> ,heta a<table><esc>o</table><esc>k
" " Html Elements TAble
" " Html Elements TAble full
" " Html Elements TAble really full
" " Html Elements Table capsHead
" nnoremap <silent> ,hetH a<thead><esc>o</thead><esc>k
" " Html Elements Table Row
" nnoremap <silent> ,hetr a<tr><esc>o</tr><esc>k
" " Html Elements Table Header cell
" nnoremap <silent> ,heth a<th><esc>o</th><esc>k
" " Html Elements Table Body
" nnoremap <silent> ,hetb a<tbody><esc>o</tbody><esc>k
" " Html Elements Table Data cell
" nnoremap <silent> ,hetd a<td><esc>o</td><esc>k
" " Html Elements Table Footer
" nnoremap <silent> ,hetf a<tfoot><esc>o</tfoot><esc>k
" " Html Elements Ordered List
" nnoremap <silent> ,heol a<ol><return><li>ChangeThisPls</li><return></ol><esc>/ChangeThisPls<return>
" " Html Elements Unordered List
" nnoremap <silent> ,heul a<ul><return><li>ChangeThisPls</li><return></ul><esc>/ChangeThisPls<return>
" " Html Elements CUstom
" nnoremap <silent> ,hecu a<ChangeThisPls></ChangeThisPls><esc>/ChangeThisPls<return>
" " Html Elements Ordered List
" nnoremap <silent> ,heol a<ol><return><% ChangeThisPls.each do \|ChangeThisPls\| %><return><li>ChangeThisPls</li><return><% end %><return></ol><esc>/ChangeThisPls<return>
" " Html Elements Unordered List
" nnoremap <silent> ,heul a<ul><return><% ChangeThisPls.each do \|ChangeThisPls\| %><return><li>ChangeThisPls</li><return><% end %><return></ul><esc>/ChangeThisPls<return>
" " Html Elements IMage
" nnoremap <silent> ,heim a<%= image_tag(ChangeSource, class: 'img_rounded_corners', alt: 'ChangeAlt', width: 'ChangeWidth', height: 'ChangeHeight') %><esc>/ChangeSource\\|ChangeAlt\\|ChangeWidth\\|ChangeHeight<return>
