alias sss='python -m SimpleHTTPServer 8888 &'

alias kindlegen='~/kindlegen/kindlegen'

alias showip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

alias uptolow='for f in *; do mv "$f" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done'

alias spacetouscore='find . -depth -name "* *" \
| while IFS= read -r f ; do mv -i "$f" "$(dirname "$f")/$(basename "$f"|tr " " _)" ; done'

# ls aliases
alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

