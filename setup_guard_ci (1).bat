@echo off
REM ================================================
REM Setup Guard and GitHub Actions CI for your Rails project
REM ================================================

REM 1. Extract guard_ci_bundle.zip into current directory
if exist guard_ci_bundle.zip (
    powershell -Command "Expand-Archive -Path 'guard_ci_bundle.zip' -DestinationPath . -Force"
    echo Extracted guard_ci_bundle.zip
) else (
    echo Error: guard_ci_bundle.zip not found in this directory.
    pause
    exit /b 1
)

REM 2. Append Guard gems to Gemfile
echo.>>Gemfile
echo "group :development do" >> Gemfile
echo "  gem 'guard'" >> Gemfile
echo "  gem 'guard-rspec'" >> Gemfile
echo "end" >> Gemfile
echo Appended Guard gems to Gemfile

REM 3. Remove helper files
if exist gemfile_snippet.txt del /q gemfile_snippet.txt
if exist README.txt del /q README.txt

REM 4. Install bundle
echo Running bundle install...
bundle install

REM 5. Setup complete
echo.
echo Setup complete! 
echo To start Guard, run: bundle exec guard
echo Your GitHub Actions workflow is ready in .github\workflows\ci.yml
pause