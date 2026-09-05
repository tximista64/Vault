# 🛠 Using The Metasploit Framework -- Cheat Sheet

Source: HackTheBox -- Using The Metasploit Framework Cheat Sheet

------------------------------------------------------------------------

# 📌 MSFconsole Commands

## 🔎 Recherche & Exploration

  -----------------------------------------------------------------------
  Command                        Description
  ------------------------------ ----------------------------------------
  `show exploits`                Show all exploits within the Framework.

  `show payloads`                Show all payloads within the Framework.

  `show auxiliary`               Show all auxiliary modules within the
                                 Framework.

  `search <name>`                Search for exploits or modules within
                                 the Framework.

  `info`                         Load information about a specific
                                 exploit or module.

  `use <name>`                   Load an exploit or module (ex:
                                 `use windows/smb/psexec`).

  `use <number>`                 Load an exploit by using the index
                                 number from `search`.
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 🌐 Variables & Configuration

  -------------------------------------------------------------------------
  Command                          Description
  -------------------------------- ----------------------------------------
  `LHOST`                          Your local IP reachable by the target
                                   (used for reverse shells).

  `RHOST`                          The remote host (target).

  `set <function>`                 Set a specific value (e.g., LHOST,
                                   RHOST).

  `setg <function>`                Set a value globally.

  `show options`                   Show available options for a module.

  `show targets`                   Show supported platforms.

  `set target <number>`            Specify target index (OS/SP).

  `set payload <payload>`          Specify payload to use.

  `set payload <number>`           Specify payload index number.

  `show advanced`                  Show advanced options.

  `set autorunscript migrate -f`   Auto-migrate to another process after
                                   exploit.
  -------------------------------------------------------------------------

------------------------------------------------------------------------

## 🚀 Exploitation

  Command                  Description
  ------------------------ -----------------------------------------
  `check`                  Check if target is vulnerable.
  `exploit`                Execute the exploit.
  `exploit -j`             Run exploit in background (job).
  `exploit -z`             Do not interact after exploitation.
  `exploit -e <encoder>`   Specify encoder (ex: `shikata_ga_nai`).
  `exploit -h`             Show exploit help.

------------------------------------------------------------------------

# 🔄 Sessions Management

  Command                  Description
  ------------------------ ----------------------------------
  `sessions -l`            List active sessions.
  `sessions -l -v`         List sessions (verbose).
  `sessions -s <script>`   Run script on all sessions.
  `sessions -K`            Kill all sessions.
  `sessions -c <cmd>`      Execute command on all sessions.
  `sessions -u <id>`       Upgrade shell to Meterpreter.

------------------------------------------------------------------------

# 🗄 Database Commands

  Command                                 Description
  --------------------------------------- -----------------------------------
  `db_create <name>`                      Create a database.
  `db_connect <name>`                     Connect to a database.
  `db_nmap`                               Run Nmap and store results in DB.
  `db_destroy`                            Delete current DB.
  `db_destroy <user:pass@host:port/db>`   Delete DB (advanced).

------------------------------------------------------------------------

# 🎯 Meterpreter Commands

## 📋 Basic

  Command          Description
  ---------------- ------------------------------
  `help`           Open Meterpreter help.
  `run <script>`   Run Meterpreter script.
  `sysinfo`        Show system information.
  `ls`             List files.
  `ps`             Show running processes.
  `shell`          Drop into interactive shell.
  `background`     Background current session.

------------------------------------------------------------------------

## 🔐 Privilege Escalation & Tokens

  Command                             Description
  ----------------------------------- --------------------------------------
  `use priv`                          Load privilege extension.
  `use incognito`                     Load token impersonation functions.
  `list_tokens -u`                    List user tokens.
  `list_tokens -g`                    List group tokens.
  `impersonate_token <DOMAIN\USER>`   Impersonate token.
  `steal_token <pid>`                 Steal token from process.
  `drop_token`                        Stop impersonation.
  `getsystem`                         Attempt SYSTEM privilege escalation.
  `getprivs`                          Get as many privileges as possible.

------------------------------------------------------------------------

## 🖥 Process & Execution

  Command                         Description
  ------------------------------- ---------------------------------
  `migrate <pid>`                 Migrate to process.
  `execute -f cmd.exe -i`         Execute cmd interactively.
  `execute -f cmd.exe -i -t`      Execute with all tokens.
  `execute -f cmd.exe -i -H -t`   Execute hidden with all tokens.
  `rev2self`                      Revert to original user.
  `reboot`                        Reboot target.

------------------------------------------------------------------------

## 📂 File System

  Command             Description
  ------------------- ------------------------------------------
  `upload <file>`     Upload file.
  `download <file>`   Download file.
  `timestomp`         Modify file timestamps (anti-forensics).

------------------------------------------------------------------------

## 🖱 Interface & Desktop

  Command                           Description
  --------------------------------- -------------------------
  `setdesktop <number>`             Switch desktop session.
  `screenshot`                      Take screenshot.
  `uictl enable <keyboard/mouse>`   Control keyboard/mouse.

------------------------------------------------------------------------

## 🎹 Keylogging

  Command           Description
  ----------------- ---------------------------
  `keyscan_start`   Start keylogger.
  `keyscan_dump`    Dump captured keystrokes.
  `keyscan_stop`    Stop keylogger.

------------------------------------------------------------------------

## 🌐 Sniffer

  Command                         Description
  ------------------------------- ------------------------
  `use sniffer`                   Load sniffer module.
  `sniffer_interfaces`            List interfaces.
  `sniffer_start <id> <buffer>`   Start sniffing.
  `sniffer_dump <id> <pcap>`      Dump captured packets.
  `sniffer_stats <id>`            Show statistics.
  `sniffer_stop <id>`             Stop sniffing.

------------------------------------------------------------------------

## 👥 User & Domain Manipulation

  ------------------------------------------------------------------------------------------
  Command                                           Description
  ------------------------------------------------- ----------------------------------------
  `add_user <user> <pass> -h <ip>`                  Add user on remote target.

  `add_group_user "Domain Admins" <user> -h <ip>`   Add user to Domain Admins group.

  `hashdump`                                        Dump password hashes.

  `clearev`                                         Clear event logs.
  ------------------------------------------------------------------------------------------

------------------------------------------------------------------------

# 📎 Tags

#metasploit #offensive #cheatsheet 