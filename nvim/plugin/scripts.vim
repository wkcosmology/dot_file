fun! s:clear_regs()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endf
command! ClearRegs :call <SID>clear_regs()

" format the code using native indent method, use the z mark to jump back
" I accept the range but do not use it
fun! NativeFmt(...)
  normal! mzgg=G`z
  delmarks z
endf
