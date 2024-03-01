@echo off

setlocal enabledelayedexpansion

:: Set the repository path and commit message
set "repo_path=C:\Users\triig\Music\cpp-trading"
set "commit_message=Daily commit for March 2024"

:: Loop through each day of March 2024
for /l %%d in (1,1,31) do (
    :: Set the date for the commit
    set "date=2024-03-%%d"

    :: Create a random number of commits for the day (between 1-10)
    set /a num_commits=!random! %% 10 + 1

    :: Loop through each commit for the day
    for /l %%c in (1,1,!num_commits!) do (
        :: Create a new file with a random name
        set "file_name=!random!.txt"
        echo !date! > "!repo_path!\!file_name!"

        :: Add the file to the repository
        git add "!repo_path!\!file_name!"

        :: Commit the changes with the specified message
        git commit -m "!commit_message! (!date!)"

        :: Push the changes to GitHub
        git push origin master
    )
)