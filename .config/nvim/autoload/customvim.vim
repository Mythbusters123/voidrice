function! customvim#MythVim()
  " Autosave Config
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
endfunction
