# TASKS

 0. File Hub
 1. Another filter won't help
 2. Not even this can be bypassed
 3. The Jinja template
 4. Poison the logs

## Write-ups

 0. File Hub : exposition of a vuln file download endpoint

    - The application exposes a file download endpoint: download_file?filename=README.md&path=., indicating user-controlled file access. By analyzing the parameters, it became clear the server concatenates path and filename without proper validation. This allows arbitrary file retrieval by modifying inputs. Instead of using traversal, a direct path was supplied: path=/etc and filename=0-flag.txt. Sending a request to /task0/download_file?filename=0-flag.txt&path=/etc successfully returned the flag. The vulnerability is a classic insecure direct file access due to lack of path sanitization.

 1. Another filter won't help : improper handling of duplicate parameters

    - The application uses the same endpoint download_file?filename=README.md&path=., but introduces filtering to block path traversal and absolute paths, returning a 403 response. Multiple traversal and encoding bypass attempts were unsuccessful, indicating stronger input validation. However, the application is vulnerable to parameter pollution, where duplicate parameters are handled inconsistently. By supplying both safe and malicious values for path and filename, the filter validates the benign input but the backend processes the malicious one. The request /task1/download_file?path=/tmp/secure_storage&filename=1-flag.txt&path=.&filename=README.md successfully returned the flag. This demonstrates improper handling of duplicate parameters leading to a filter bypass.

 2. Not even this can be bypassed : validation applied to encoded data flaw

    - The application introduces stronger validation by requiring encoded inputs and hinting at a secret path. Direct path traversal and parameter manipulation attempts fail due to strict filtering. Analysis of the challenge and its hints revealed that the application expects Base64-encoded values for both filename and path, and likely validates them before decoding. By encoding 2-flag.txt and the provided secret path abc123_secret_path_to_flag, the payload bypasses input validation. The request /task2/download_file?filename=Mi1mbGFnLnR4dA==&path=YWJjMTIzX3NlY3JldF9wYXRoX3RvX2ZsYWc= successfully returns the flag. This demonstrates a flaw where validation is applied to encoded data, but unsafe operations are performed after decoding, leading to a bypass.

 3. The Jinja template : improper exposure of internal functions within the template context

    - The application allows users to submit reports that are rendered using Jinja2 templates, making it vulnerable to Server-Side Template Injection (SSTI). By injecting template expressions such as {{7*7}}, it was confirmed that user input is evaluated on the server. Initial attempts to access the filesystem directly were restricted, but further inspection of the template context using {{ self._TemplateReference__context }} revealed a function named flag_request. This function accepts a filepath as an argument and is accessible within the template. By calling {{ flag_request('/etc/3-flag.txt') }}, the application returned the contents of the flag file. This demonstrates improper exposure of internal functions within the template context, allowing attackers to bypass restrictions and retrieve sensitive data.

 4. Poison the logs : LFI

    - The vulnerable endpoint is find_your_shell.php?filename=..., which allows local file inclusion. First, task4_file_hub/shell.php was accessed to set the required session variable FLAG_SET to true. After that, additional files inside task4_file_hub were tested through the LFI endpoint instead of accessing them directly. This revealed task4_file_hub/flag.php, which could not be reached normally but was executable when included through find_your_shell.php. Requesting /find_your_shell/find_your_shell.php?filename=task4_file_hub/flag.php returned the flag. The issue is an LFI vulnerability that allows indirect execution of internal PHP files once the proper session state is established.
