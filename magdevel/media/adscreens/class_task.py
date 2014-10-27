# -*- coding: utf-8 -*-
# vi:si:et:sw=4:sts=4:ts=4

import datetime

from django_cron import CronJobBase, Schedule
from django_cron.models import CronJobLog

from django.core import management
from django.utils import timezone

from muccashop.libs.log import Loggable


class CronJobTask(CronJobBase, Loggable):
    ALLOW_PARALLEL_RUNS = False
    code = ''
    schedule = None

    #
    # Public API
    #

    def run_command(self, command, *args, **kwargs):
        return management.call_command(command, *args, **kwargs)

    def action(self):
        raise NotImplementedError

    #
    # Overrides
    #

    def do(self):
        self.info('Started %s' % self.code)
        self.action()
        self.info('Finished %s' % self.code)
        return 'Executed %s' % self.code


class ClearCronJobLogs(CronJobTask):
    code = u'clear_cronjob_logs'
    RUN_AT_TIMES = ['05:30']
    schedule = Schedule(run_at_times=RUN_AT_TIMES)

    def action(self):
        today = timezone.now().date()
        last_week = today - datetime.timedelta(days=7)
        CronJobLog.objects.filter(end_time__lte=last_week).delete()
