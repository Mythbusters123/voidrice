function! customvim#MythVim()
   lua << EOF
    local autosave = require("autosave")

    autosave.setup(
      {
        enabled = true,
        execution_message = "Saved!",
        events = { "InsertLeave", "TextChanged" },
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
          },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
      }
    )
EOF
  " gj and gk are sometimes just better
  nnoremap gj j
  nnoremap j gj
  nnoremap gk k
  nnoremap k gk

  " Map CTRL+C to <ESC>
  nmap <C-c> <esc>
  imap <C-c> <esc>
  vmap <C-c> <esc>
  omap <C-c> <esc>

  " Set colors
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
  colorscheme onedark

  lua << EOF
    require('lualine').setup {
	    options = { theme = 'onedark' },
    }
EOF

  " Spaces > Tabs
  set tabstop=4
  set expandtab
  set shiftwidth=4

  " Highlight ALL the results
  set hls

endfunction
