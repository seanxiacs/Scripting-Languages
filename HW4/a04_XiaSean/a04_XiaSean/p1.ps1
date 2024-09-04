# Sean Xia
# netid: sexia
# studentid: 113181409

# Problem 1 (15 points): p1.ps1
# Sometimes the processes running on your computer escape from your benevolent control and so must be
# killed. Let's write a powershell script to do this work for us.
# Task:
# Your script should do the following:
# 1. Read a process name as a command-line argument
# 2. List all currently running instances of that process on the console.
# 2a. If there is no currently running instance of the specified process, then print out the message,
#  "No such process is running." to the console, and then terminate the script.
# 3. Kill all currently running instances of the specified process.
# 4. List all currently running processes on the console, so we can see the specified process is absent.
# Parsing the arguments:
# The script takes a single command-line argument. The argument is a string that names a process.
# Script name:
# Name your shell script: p1.ps1
# Example invocation: $ powershell p1.ps1

# Check if process name argument was provided
if ($args.Count -lt 1) {
  Write-Host "No process name provided. Usage: powershell ./p1.ps1 <process_name>"
  exit
}

# Get process name from command line arguments
$processName = $args[0]

# Check if any instances of the specified process are running
if ((Get-Process -Name $processName -ErrorAction SilentlyContinue).Count -eq 0) {
  Write-Host "No such process is running."
  exit
}

# List all currently running instances of the specified process
Write-Host "Currently running instances of"$processName":"
Get-Process -Name $processName | Format-Table -AutoSize

# Kill all currently running instances of the specified process
Get-Process -Name $processName | Stop-Process -Force

# List all currently running processes to confirm that specified process is absent
Write-Host "Currently running processes (this should not have any instances of process:"$processName"):"
Get-Process | Where-Object {$_.Name -ne $processName} | Format-Table -AutoSize

