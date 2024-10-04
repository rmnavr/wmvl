

	nnoremap <F2> <S-v>:<BS><BS><BS><BS><BS>call WMVimLink_export()<Enter>
	xnoremap <F2>      :<BS><BS><BS><BS><BS>call WMVimLink_export()<Enter>

	nnoremap <S-F2> :silent execute WMVimLink_open_WM()<Enter>

	function! WMVimLink_CheckMachineName(hostname)
		return match(system("hostname"), a:hostname) >= 0
		" returns -1 if no matches, returns 0+ if has matches
	endfunction

	if WMVimLink_CheckMachineName("625")
		" at Work (NB625):
		let g:WM_Exchange_file = "C:\\Users\\r.averyanov\\Desktop\\Vault\\SynchW\\02 CAD_Data_onW\\WM\\03_VimLink\\WMVimLink_tmp.txt"
		let g:WM_NB_file       = "!\"C:\\Users\\r.averyanov\\Desktop\\Vault\\SynchW\\02 CAD_Data_onW\\WM\\03_VimLink\\VimLink.nb\""
	else
		" at Home: 
		let g:WM_Exchange_file = "E:\\00_Vault\\SynchW\\02 CAD_Data_onW\\WM\\03_VimLink\\WMVimLink_tmp.txt"
		let g:WM_NB_file       = "!\"E:\\00_Vault\\SynchW\\02 CAD_Data_onW\\WM\\03_VimLink\\VimLink.nb\""
	endif

	function! WMVimLink_export()
		execute "normal! :'<,'>w! " . g:WM_Exchange_file . "\<Enter>"
	endfunction

    function! WMVimLink_open_WM()
		return g:WM_NB_file
    endfunction

