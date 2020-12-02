# -*- coding: utf-8 -*-
"""
Created on Tue Apr 28 15:53:21 2020

@author: sample
"""

import configparser


INI_FILE = '../parameter/config.ini'

inifile = configparser.ConfigParser()
inifile.read(INI_FILE, 'UTF-8')

# パラメータ取得
config_log = inifile.get('config', 'log')
syslog_facility = inifile.get('syslog', 'facility')
syslog_option = inifile.get('syslog', 'option')
database = inifile.get('database', 'database')
line_notify_api = inifile.get('line', 'notify_api')
line_notify_token = inifile.get('line', 'notify_token')
translation_language = inifile.get('translation', 'language')
translation_dictionary_dir = inifile.get('translation', 'dictionary_dir')
translation_dictionary_file = inifile.get('translation', 'dictionary_file')

# wireshark
wireshark_inerface = inifile.get('wireshark', 'inerface')
wireshark_ip_filter = inifile.get('wireshark', 'ip_filter')
wireshark_port_filter = inifile.get('wireshark', 'port_filter')
wireshark_logging_time_sec = inifile.get('wireshark', 'logging_time_sec')
wireshark_pcap_log = inifile.get('wireshark', 'pcap_log')
wireshark_text_log = inifile.get('wireshark', 'text_log')
wireshark_csv_log = inifile.get('wireshark', 'csv_log')

# statics
statics_summary_log = inifile.get('statics', 'summary_log')
statics_statics_log = inifile.get('statics', 'statics_log')
statics_histogram_bins = inifile.get('statics', 'histogram_bins')
statics_histogram_log = inifile.get('statics', 'histogram_log')
statics_histogram_img = inifile.get('statics', 'histogram_img')
statics_boxplot_img = inifile.get('statics', 'boxplot_img')


def init():
    print()


def logging_paramter():
    import common.logger
    common.logger.app_logger.debug("config_log:%s", config_log)
    common.logger.app_logger.debug("syslog_facility:%s", syslog_facility)
    common.logger.app_logger.debug("syslog_option:%s", syslog_option)
    common.logger.app_logger.debug("database:%s", database)
    common.logger.app_logger.debug("line_notify_api:%s", line_notify_api)
    common.logger.app_logger.debug("line_notify_token:%s", line_notify_token)
    common.logger.app_logger.debug("translation_language:%s", translation_language)
    common.logger.app_logger.debug("translation_dictionary_dir:%s", translation_dictionary_dir)
    common.logger.app_logger.debug("translation_dictionary_file:%s", translation_dictionary_file)
    
    common.logger.app_logger.debug("wireshark_inerface:%s", wireshark_inerface)
    common.logger.app_logger.debug("wireshark_ip_filter:%s", wireshark_ip_filter)
    common.logger.app_logger.debug("wireshark_port_filter:%s", wireshark_port_filter)
    common.logger.app_logger.debug("wireshark_logging_time_sec:%s", wireshark_logging_time_sec)
    common.logger.app_logger.debug("wireshark_pcap_log:%s", wireshark_pcap_log)
    common.logger.app_logger.debug("wireshark_text_log:%s", wireshark_text_log)
    common.logger.app_logger.debug("wireshark_csv_log:%s", wireshark_csv_log)

    common.logger.app_logger.debug("statics_summary_log:%s", statics_summary_log)
    common.logger.app_logger.debug("statics_statics_log:%s", statics_statics_log)
    common.logger.app_logger.debug("statics_histogram_bins:%s", statics_histogram_bins)
    common.logger.app_logger.debug("statics_histogram_log:%s", statics_histogram_log)
    common.logger.app_logger.debug("statics_histogram_img:%s", statics_histogram_img)
    common.logger.app_logger.debug("statics_boxplot_img:%s", statics_boxplot_img)

    