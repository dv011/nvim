echo "yello"

nnoremap <leader>tt :echo "Custom mapping works!"<CR>

let name = "muffin"
function Hello()
    let name = "danny"
    echo "hello " .. toupper(name)
endfunction

nnoremap <leader>ff :call Hello() <CR>
