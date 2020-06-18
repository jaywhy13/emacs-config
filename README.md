# Emacs Configuration

## TODO
- [ ] General
    - [ ] Sidebar navigation
      - [ ] Investigate Neotree
        - [ ] Add icons using all-the-icons
      - [ ] Investigate Treemacs
        - [ ] Change tree when new project is selected
    - [ ] Status bar
      - [ ] Investigate Spaceline
      - [ ] Investigate modeline
    - [ ] Embedded terminal (toggle terminal size)
    - [ ] Descent theme (e.g VSCode Dark+)
    - [ ] Fira Code font / font size
    - [x] Fuzzy find files
    - [ ] Search all files
      - [x] Accomplished using Counsel-Projectile (C-c C-p s i)
      - [ ] Search for the current symbol
    - [ ] Setting synchronization
    - [ ] Breadcrumb navigation
    - [x] Project management (open projects with one command)
    - [ ] Multiple cursors
    - [ ] Jira
    - [ ] Protobuf
    - [ ] GraphQL
    - [ ] Dash integration
    - [ ] Show date & time / weather
    - [ ] Python IDE Features
          - [x] Autocomplete of functions and arguments
          - [x] Jump to definition
	  - [ ] Django syntax highlighting
	  - [ ] Linting with mypy, flake8
	  - [x] Virtualenv Support
	    - [ ] Need to add autodiscovery of virtual envs
    - [ ] Navigation
      - [ ] Go back
- [ ] Javascript / Typescript
	- [ ] Autocomplete
	- [ ] Jump to definition
	- [ ] Prettier
	- [ ] ES / TS Lint
- [ ] Git
  - [ ] Features
    - [ ] History
    - [ ] Blame
    - [ ] Open commit in Github
    - [ ] Stage / unstage files
    - [ ] Commit
    - [ ] Push / pull
  - [ ] Extensions
    - [ ] Magit
- [ ] CSS
	- [ ] Class completion


## Extensions

- Look and feel
  - Material theme
- Project Management
  - Projectile - manage project
    - Counsel-Projectile - better searching (fuzzy load projects and files)
- Python
  - Elpy - virtual env support, autocompletion, jump to defn, etc... (disabled flymake module)
  - Blacken - formatting with black
  - Flycheck - syntax checks

## Issues
- https://melpa.org/packages/ivy-20160818.708.tar: Not found. Package listing
  was out of date. Was resolved by doing `M-x package-refresh-contents`
- `neotree-projectile-action` is not reliably triggered when changing projects
  with Projectile.