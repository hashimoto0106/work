# -*- coding: utf-8 -*-
"""
Created on Wed Apr 29 16:21:07 2020

@author: sample
"""

import common.syslog
import config

def open():
	# opetion
	if config.syslog_option == "LOG_PID":
		option = common.syslog.LOG_PID
	elif config.syslog_option == "LOG_CONS":
		option = common.syslog.LOG_CONS
	elif config.syslog_option == "LOG_NDELAY":
		option = common.syslog.LOG_NDELAY
	elif config.syslog_option == "LOG_ODELAY":
		option = common.syslog.LOG_ODELAY
	elif config.syslog_option == "LOG_NOWAIT":
		option = common.syslog.LOG_NOWAIT
	else:
		option = LOG_PID

	# facility
	if config.syslog_facility == "LOG_LOCAL0":
		fclty = syslog.LOG_LOCAL0
	elif config.syslog_facility == "LOG_LOCAL1":
		fclty = common.syslog.LOG_LOCAL1
	elif config.syslog_facility == "LOG_LOCAL2":
		fclty = common.syslog.LOG_LOCAL2
	elif config.syslog_facility == "LOG_LOCAL3":
		fclty = common.syslog.LOG_LOCAL3
	elif config.syslog_facility == "LOG_LOCAL4":
		fclty = common.syslog.LOG_LOCAL4
	elif config.syslog_facility == "LOG_LOCAL5":
		fclty = common.syslog.LOG_LOCAL5
	elif config.syslog_facility == "LOG_LOCAL6":
		fclty = common.syslog.LOG_LOCAL6
	elif config.syslog_facility == "LOG_LOCAL7":
		fclty = common.syslog.LOG_LOCAL7
	elif config.syslog_facility == "LOG_SYSLOG":
		fclty = common.syslog.LOG_SYSLOG
	elif config.syslog_facility == "LOG_KERN":
		fclty = common.syslog.LOG_KERN
	elif config.syslog_facility == "LOG_USER":
		fclty = common.syslog.LOG_USER
	elif config.syslog_facility == "LOG_MAIL":
		fclty = common.syslog.LOG_MAIL
	elif config.syslog_facility == "LOG_DAEMON":
		fclty = common.syslog.LOG_DAEMON
	elif config.syslog_facility == "LOG_AUTH":
		fclty = common.syslog.LOG_AUTH
	elif config.syslog_facility == "LOG_LPR":
		fclty = common.syslog.LOG_LPR
	elif config.syslog_facility == "LOG_NEWS":
		fclty = common.syslog.LOG_NEWS
	elif config.syslog_facility == "LOG_UUCP":
		fclty = common.syslog.LOG_UUCP
	elif config.syslog_facility == "LOG_CRON":
		fclty = common.syslog.LOG_CRON
	else:
		fclty = common.syslog.LOG_LOCAL0

	common.syslog.openlog(logoption = option, facility = fclty)


def logging(priority, message):
	syslog.syslog(priority, message)

def close():
	syslog.closelog()
