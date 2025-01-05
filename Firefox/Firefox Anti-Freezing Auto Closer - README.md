# Firefox Anti-Freezing Auto Closer - README

## Description

`Firefox_Anti-Freezing_Auto_Closer.bat` is a Windows batch script designed to help users monitor and manage the performance of Firefox. It detects when Firefox becomes unresponsive or when system resource usage (CPU and memory) exceeds a defined threshold, and it automatically terminates Firefox to prevent system freezes. Additionally, it prompts the user with the option to reopen Firefox after termination.

---

## Features

- **Unresponsive Firefox Detection:** Automatically detects when Firefox is "Not Responding" and closes it.
- **Resource Monitoring:** Monitors CPU and memory usage to preemptively close Firefox when thresholds are exceeded.
- **Reopen Prompt:** Asks the user if they want to reopen Firefox after it has been terminated.
- **Adjustable Monitoring Interval:** Allows customization of the frequency for system checks.

---

## Requirements

- Windows operating system.
- Administrative privileges to monitor processes and manage system resources.

---

## Setup Instructions

1. **Download and Save:**

   - Save the script as `Firefox_Anti-Freezing_Auto_Closer.bat`.
   - Ensure it is saved as a `.bat` file and not a `.txt` file.

2. **Run with Administrative Privileges:**

   - Right-click on the script and select **Run as Administrator** to grant necessary permissions.

3. **Customize Thresholds and Intervals:**

   - Open the script in a text editor to modify the following variables:
     - `set interval=15` (default monitoring interval in seconds).
     - `set cpu_threshold=80` (CPU usage threshold as a percentage).
     - `set mem_threshold=80` (Memory usage threshold as a percentage).

---

## How It Works

1. **Monitoring Interval:**

   - The script checks Firefox and system resource usage every `interval` seconds.

2. **Unresponsive Firefox Detection:**

   - The script uses the `tasklist` command to check if Firefox is "Not Responding."

3. **Resource Usage Check:**

   - CPU usage is monitored via `wmic cpu get loadpercentage`.
   - Memory usage is calculated based on available and total memory.

4. **Automatic Termination:**

   - If Firefox is unresponsive or system thresholds are exceeded, the script closes all Firefox processes.

5. **User Prompt:**

   - After termination, the user is prompted with the option to reopen Firefox.

---

## Example Outputs

- Normal Operation:

  ```
  Firefox is running normally or not running at all.
  ```

- Firefox Not Responding:

  ```
  Firefox is not responding. Closing all Firefox windows...
  All Firefox processes have been terminated.
  ```

- Resource Check:

  ```
  CPU Usage: 85%, Memory Usage: 90%
  High resource usage detected. Closing all Firefox windows...
  ```

- Reopen Prompt:

  ```
  Do you want to reopen Firefox? (Y/N):
  ```

---

## Troubleshooting

1. **Script Does Not Detect Firefox:**

   - Ensure Firefox is installed and running.
   - Run the script as an administrator.

2. **Resource Monitoring Does Not Work:**

   - Check that `wmic` is available on your system (default on most Windows installations).

3. **Permission Errors:**

   - Run the script as an administrator.

---

## Future Enhancements

- Add logging to track historical performance and actions.
- Provide notifications instead of command-line outputs.
- Reopen Firefox with specific tabs or sessions.

---

## License

This script is provided "as-is" without warranty. Use at your own risk.

---

## Contact

For questions or suggestions, contact the script creator.

