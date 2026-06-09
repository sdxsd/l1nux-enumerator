#!/usr/bin/env bash

find_suid() {
	echo '=== SUID binaries ==='
	find '/' 2>/dev/null -perm /4000
}

find_sgid() {
	echo '=== SGID binaries ==='
	find '/' 2>/dev/null -perm /2000
}

userinfo() {
	echo '=== Groups ==='
	groups
	echo '=== Whoami ===':
	whoami
	echo '=== ' $USER ' Owned Directories ==='
	find '/' 2>/dev/null -user "$USER" -type d
}

list_root_processes() {
	echo '=== Processes running as root ==='
	ps -o ruser=RealUser -o pid,cmd -u root | grep -v "\["
}

find_user_writeable_files_owned_by_root() {
	echo '=== User writeable files and directories owned by root ==='
	find '/' 2>/dev/null -writable -user 'root'
}

list_open_ports() {
	echo '=== Open ports ==='
	ss -tunlp
}

os_info() {
	echo '=== OS Info ==='
	uname -a
}

passwd() {
	echo '=== /etc/passwd ==='
	cat /etc/passwd
}

cron_info() {
	echo '=== /etc/crontab ==='
	cat /etc/crontab
	echo '=== /etc/cron.d ==='
	ls -la /etc/cron.d
}

incron() {
	echo '=== /etc/incron.conf ==='
	cat /etc/incron.conf
	echo '=== /etc/incron.d ==='
	ls -la /etc/incron.d
}

git_search() {
	echo '=== List Git Repositories ==='
	find '/' -name '.git' -type d
}

find_suid
find_sgid
userinfo
list_root_processes
find_user_writeable_files_owned_by_root
list_open_ports
os_info
passwd
cron_info
incron
git_search
