if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

function ppush
    echo "Pushing changes to Google Drive..."
    rclone copy /home/gustavo/langara gdrive:langara -v
    if test $status -eq 0
        echo "Push successful!"
    else
        echo "Push failed. Check your configuration."
    end
end

starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gustavo/google-cloud-sdk/path.fish.inc' ]; . '/home/gustavo/google-cloud-sdk/path.fish.inc'; end
set -gx PATH $HOME/google-cloud-sdk/bin $PATH

