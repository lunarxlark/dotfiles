PS1="\[\e[1;36m\]\u\[\e[0m\]"
PS1+="\[\e[1;31m\]@\[\e[0m\]"
PS1+="\[\e[1;33m\]\h\[\e[0m\] "
PS1+="\W"
PS1+="\[\e[33m\]\$(__git_ps1)\[\e[0m\] "
PS1+="\[\e[36m\][${AWS_PROFILE:-none}]\[\e[0m\] "
PS1+="\[\e[1;31m\][\[\e[0m\]"
PS1+="\d"
PS1+="\[\e[1;31m\]|\[\e[0m\]"
PS1+="\t"
PS1+="\[\e[1;31m\]]\[\e[0m\]"
PS1+="\n"
PS1+="\[\e[1;36m\](*'-')\[\e[0m\] "
PS1+="\[\e[1;31m\]<\[\e[0m\]"
PS1+="\[\e[1;33m\]<\[\e[0m\]"
PS1+="\[\e[1;36m\]<\[\e[0m\] "
