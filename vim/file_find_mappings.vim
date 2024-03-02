nnoremap <silent> <space>ffff :e **/*

" within app
nnoremap <silent> <space>ffad :e app/admin/**/*
nnoremap <silent> <space>ffap :e app/api/**/*
nnoremap <silent> <space>ffas :e app/assets/**/*
nnoremap <silent> <space>ffch :e app/channels/**/*
nnoremap <silent> <space>ffcm :e app/components/**/*
nnoremap <silent> <space>ffco :e app/controllers/**/*
nnoremap <silent> <space>ffhe :e app/helpers/**/*
nnoremap <silent> <space>ffho :e app/hooks/**/*
nnoremap <silent> <space>ffja :e app/javascript/**/*
nnoremap <silent> <space>ffjo :e app/jobs/**/*
nnoremap <silent> <space>ffma :e app/mailers/**/*
nnoremap <silent> <space>ffmo :e app/models/**/*
nnoremap <silent> <space>ffsc :e app/screens/**/*
nnoremap <silent> <space>ffse :e app/services/**/*
nnoremap <silent> <space>ffut :e app/utilities/**/*
nnoremap <silent> <space>ffvi :e app/views/**/*

" outside app
nnoremap <silent> <space>fffa :e test/factories/**/*
nnoremap <silent> <space>ffrs :e spec/**/*
nnoremap <silent> <space>ffte :e test/**/*
nnoremap <silent> <space>fftm :e templates/**/*
nnoremap <silent> <space>ffli :e lib/**/*
nnoremap <silent> <space>ffcn :e config/**/*

" depends on project type
nnoremap <silent> <space>ffcn :call FileFindConfig()<return>:e <C-R>=system('pbpaste')<CR>
function! FileFindConfig()
  let l:project_type = ProjectType()
  if l:project_type == 'rails'
    let @+ = 'config/**/*'
  elseif l:project_type == 'react native' || l:project_type == 'react native expo'
    let @+ = 'app/config/**/*'
  endif
endfunction
"   lib/utilities (maybe move rails utilities to app to match react native?)
