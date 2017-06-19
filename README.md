gitlink-vim
===========

Generate a link to the exact commit, file and line.

When collaborating with your team, you may often want to reference a line of code.  Copy-and-pasting the line just doesn't work when context matters, plus you know the formating isn't going to be right, anyways!

## Example
![screenshot](https://raw.githubusercontent.com/mazubieta/gitlink-vim/master/docs/calling.png)

![screenshot](https://raw.githubusercontent.com/mazubieta/gitlink-vim/master/docs/executed.png)

![screenshot](https://raw.githubusercontent.com/mazubieta/gitlink-vim/master/docs/inbrowser.png)

## Known Issues

As written, it only works for Github and Gitlab.  Bitbucket is not supported.

## Installation

### Using Vundle
Add the following line to your ```.vimrc``` file.

```
Bundle 'https://github.com/mazubieta/gitlink-vim.git'
```
### Optional
You can add the following lines to your ```.vimrc``` file.

- If you want to execute via command:

  ```
  command GitLink :echo gitlink#GitLink()
  ```

- If you want to execute via leader command:

  ```
  nmap <leader>gl :echo gitlink#GitLink()<CR>
  vmap <leader>gl :echo gitlink#GitLink(1)<CR>
  ```

- If you want to copy to the clipboard automatically:

  ```
  function! CopyGitLink(...) range
    redir @+
    silent echo gitlink#GitLink(get(a:, 1, 0))
    redir END
  endfunction
  nmap <leader>gl :call CopyGitLink()<CR>
  vmap <leader>gl :call CopyGitLink(1)<CR>
  ```

## Usage
- If you just autoload the script

  ```
  :echo gitlink#GitLink()
  ```

- If you added the optional .vimrc lines

  ```
  :GitLink
  ```

  Or...

  ```
  \gl
  ```
