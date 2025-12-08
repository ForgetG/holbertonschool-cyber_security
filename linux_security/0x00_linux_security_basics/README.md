Tasks:

 0. What secrets hold:
    0-login.sh:
        Write a bash script that shows you the last 5 logins session for users with their corresponding dates and times.

    You should run your code as privileged user. root or sudoers.

 1. Shows your Linux connections, not your social     status!
    1-active-connections.sh:
    
    Write a bash script that display a list of network socket connections

        1 You should run your code as privileged user root or sudoers.
        2 You should Show all sockets, including listening and non-listening sockets.
        3 You should Display numerical addresses (IP addresses and port numbers).
        4 You should Limit the output to TCP sockets.
        5 You should Display the process information associated with each socket.

        The task should use iproute2 version 5.x

 2. Firewall rules: Your network's first line of defense! 
    2-incoming_connections.sh :
        Write a bash script that allow only incoming connections with the TCP protocol through port 80.

    You should run your code as privileged user. root or sudoers.

3. Securing your network, one rule at a time!
    3-firewall_rules.sh :
        Write a bash script that list all the rules in the security table of the firewall.

    You should run your code as privileged user. root or sudoers.
    You should use the verbose mode.

4. See what's talking, and who's listening!
    4-network_services.sh :
    Write a bash script that list services, their current state, and their corresponding ports.

    1 You should run your code as privileged user. root or sudoers.
    2 You should show the PID and name of the program to which each socket belongs.
    3 You should show numerical addresses (IP addresses and port numbers).
    4 You should display listening sockets.
    5 You should display TCP sockets.
    6 You should display UDP sockets.

5. Where it talks, we all listen!
    5-audit_system.sh :
        Write a bash script that initiate a system audit for scanning the machine.

    You should run your code as privileged user. `root` or `sudoers`.
