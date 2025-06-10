function fish_prompt -d "Write out the prompt"
    # Set username in red (ff2919)
    set_color white
    printf '%s' $USER

    # Set '@' and hostname in white
    set_color white
    printf '@%s ' $hostname

    # Set directory in white as well
    printf '%s > '  (prompt_pwd) 
end
