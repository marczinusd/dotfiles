set mouse=a

if exists(':GuiFont')
    GuiFont Delugia:h14
endif

if exists(':GuiTabline')
    GuiTabline 0
endif

if exists(':GuiRenderLigatures')
    GuiRenderLigatures 1
endif

if exists(':GuiAdaptiveStyle')
    GuiAdaptiveStyle Fusion
endif

if exists(':GuiAdaptiveColor')
    GuiAdaptiveColor 1
endif

let g:onedark_transparent_background = v:false
colorscheme onedark

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv