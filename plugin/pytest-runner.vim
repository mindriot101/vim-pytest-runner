let s:plugin_path = expand("<sfile>:p:h:h")

if !exists("g:pytest_runner")
  let g:pytest_runner = "os_x_terminal"
endif

if !exists("g:pytest_command")
  let s:cmd = "py.test {test}"

  if has("gui_running") && has("gui_macvim")
    let g:pytest_command = "silent !" . s:plugin_path . "/bin/" . g:pytest_runner . " '" . s:cmd . "'"
  else
    let g:pytest_command = "!clear && echo " . s:cmd . " && " . s:cmd
  endif
endif

function! RunAllTests()
  let l:test = "."
  call SetLastTestCommand(l:test)
  call RunTests(l:test)
endfunction

function! RunCurrentTestFile()
  if InTestFile()
    let l:test = @%
    call SetLastTestCommand(l:test)
    call RunTests(l:test)
  else
    call RunLastTest()
  endif
endfunction

function! RunNearestTest()
  if InTestFile()
    let l:test = @% . ":" . line(".")
    call SetLastTestCommand(l:test)
    call RunTests(l:test)
  else
    call RunLastTest()
  endif
endfunction

function! RunLastTest()
  if exists("s:last_test_command")
    call RunTests(s:last_test_command)
  endif
endfunction

function! InTestFile()
  return match(expand("%"), "test_.*\.py$") != -1
endfunction

function! SetLastTestCommand(test)
  let s:last_test_command = a:test
endfunction

function! RunTests(test)
  execute substitute(g:pytest_command, "{test}", a:test, "g")
endfunction
