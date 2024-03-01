@echo off

setlocal enabledelayedexpansion

:: Set the path to your Git repository
set "repo_path=C:\Users\triig\Music\cpp-trading"

:: Set the range of dates (March 2024)
for /l %%d in (1,1,31) do (
    set "date=2024-03-%%d"
    echo !date!

    :: Create a random number of commits between 1 and 10
    set /a num_commits=!random! %% 10 + 1
    echo Creating !num_commits! commits for !date!

    :: Create and commit changes
    for /l %%c in (1,1,!num_commits!) do (
        echo !date! - Commit %%c > "!repo_path!\commit.txt"
        git add .
        git commit -m "Automated commit %%c on !date!" --date=!date!
    )

    :: Push changes to GitHub
    git push origin master
)

pause