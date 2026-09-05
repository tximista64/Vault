---
tags:
  - backups
  - ransomware
  - soc
  - course/lets-defend
---

# Backups



Backups
 are not a mechanism for fighting Ransomware but they are your last line
 of defense. A non-operational backup system following an attack could 
jeopardize the survival of your business.

### Rule 3-2-1

As a basic rule and the minimum expected for an infrastructure, the 3-2-1 rule states that you must:

- Have at least three copies of your data
- Store on two different media
- One of which must be an offsite external backup

### Three Copies

The principle is to have your data on the server and two backups. 
This is to avoid that a failure makes your backups inoperative.

### Two Different Media

Here, two media should not be understood as necessarily two different
 physical formats (hard disk and LTO tape) but as having one's backup on
 two different and unrelated points. Thus, it is possible to have two 
copies of the backup on hard disks if the two are not stored in the same
 datacenter, not linked via the same software RAID (Redundant Array of 
Inexpensive Disks), etc.

### One Offsite External Backup

The idea behind this request is to have a backup stored outside your 
building that contains the main data to protect against risks such as 
fire.

## Rule 3-2-1-1-0

This rule is to be applied at least on the critical resources of your
 company. Identical to the 3-2-1 rule, it adds two conditions:

- 1 offline copy
- 0 errors during the restoration

### One Offline Copy

This is about having a backup that is not connected to your network 
and any IT infrastructure. The goal is to avoid that if an attacker has 
compromised your network, he can intervene on this backup.

### Zero Errors During The Restoration

This point seems logical, but it is advisable to regularly test the 
backups made and check that they can be restored without errors. It 
would be a shame if once restored, it is discovered that a file on the 
database server is actually damaged.

## Minimum Storage Time

It is important that the backups allow to restore at least 30 days 
old data. Why 30 days? Because the average time between the intrusion in
 the park and the detection by the company is about this time.

## Backup Tests

Now that your data is backed up according to best practices, it is 
important to ensure that your test restores are tracked and that each 
server is restored at least once a year.

