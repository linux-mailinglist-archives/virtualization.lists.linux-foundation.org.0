Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C370E0B9
	for <lists.virtualization@lfdr.de>; Tue, 23 May 2023 17:40:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93AEE41CA7;
	Tue, 23 May 2023 15:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93AEE41CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqdUYfi54J3X; Tue, 23 May 2023 15:40:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9A51C41C86;
	Tue, 23 May 2023 15:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A51C41C86
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA824C007C;
	Tue, 23 May 2023 15:40:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1D67C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 15:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F80582F99
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 15:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F80582F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lksQk9l3v0gr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 15:40:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E488211E
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72E488211E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 15:40:06 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:34724)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q1U7I-003qxd-SS; Tue, 23 May 2023 09:40:05 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:41738
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q1U7H-007qRy-L3; Tue, 23 May 2023 09:40:04 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230522025124.5863-1-michael.christie@oracle.com>
 <20230522025124.5863-4-michael.christie@oracle.com>
 <20230522153852-mutt-send-email-mst@kernel.org>
Date: Tue, 23 May 2023 10:39:56 -0500
In-Reply-To: <20230522153852-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Mon, 22 May 2023 15:40:48 -0400")
Message-ID: <87cz2r83ar.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1q1U7H-007qRy-L3; ; ;
 mid=<87cz2r83ar.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX19NgfMb/ImKg6q5N6Tu8xjjRvYEjWNx4d8=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Virus: No
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;"Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 411 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 4.1 (1.0%), b_tie_ro: 2.8 (0.7%), parse: 0.65
 (0.2%), extract_message_metadata: 3.0 (0.7%), get_uri_detail_list:
 1.46 (0.4%), tests_pri_-2000: 2.2 (0.5%), tests_pri_-1000: 1.79 (0.4%),
 tests_pri_-950: 0.92 (0.2%), tests_pri_-900: 0.90 (0.2%),
 tests_pri_-200: 0.63 (0.2%), tests_pri_-100: 9 (2.1%), tests_pri_-90:
 58 (14.1%), check_bayes: 57 (13.8%), b_tokenize: 6 (1.6%),
 b_tok_get_all: 9 (2.3%), b_comp_prob: 1.83 (0.4%), b_tok_touch_all: 36
 (8.9%), b_finish: 0.63 (0.2%), tests_pri_0: 313 (76.1%),
 check_dkim_signature: 0.58 (0.1%), check_dkim_adsp: 4.4 (1.1%),
 poll_dns_idle: 0.95 (0.2%), tests_pri_10: 2.6 (0.6%), tests_pri_500: 9
 (2.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 3/3] fork, vhost: Use CLONE_THREAD to fix freezer/ps
 regression
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Cc: axboe@kernel.dk, brauner@kernel.org, linux-kernel@vger.kernel.org,
 oleg@redhat.com, linux@leemhuis.info, stefanha@redhat.com,
 nicolas.dichtel@6wind.com, virtualization@lists.linux-foundation.org,
 torvalds@linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Sun, May 21, 2023 at 09:51:24PM -0500, Mike Christie wrote:
>> When switching from kthreads to vhost_tasks two bugs were added:
>> 1. The vhost worker tasks's now show up as processes so scripts doing ps
>> or ps a would not incorrectly detect the vhost task as another process.
>> 2. kthreads disabled freeze by setting PF_NOFREEZE, but vhost tasks's
>> didn't disable or add support for them.
>> 
>> To fix both bugs, this switches the vhost task to be thread in the
>> process that does the VHOST_SET_OWNER ioctl, and has vhost_worker call
>> get_signal to support SIGKILL/SIGSTOP and freeze signals. Note that
>> SIGKILL/STOP support is required because CLONE_THREAD requires
>> CLONE_SIGHAND which requires those 2 signals to be suppported.
>> 
>> This a modified version of patch originally written by Linus which
>> handles his review comment to himself to rename ignore_signals to
>> block_signals to better represent what it now does. And it includes a
>> change to vhost_worker() to support SIGSTOP/KILL and freeze, and it
>> drops the wait use per Oleg's review comment that it's no longer needed
>> when using CLONE_THREAD.
>> 
>> Fixes: 6e890c5d5021 ("vhost: use vhost_tasks for worker threads")
>> Signed-off-by: Mike Christie <michael.christie@oracle.com>
>> ---
>>  drivers/vhost/vhost.c      | 17 ++++++++++++++++-
>>  include/linux/sched/task.h |  2 +-
>>  kernel/fork.c              | 12 +++---------
>>  kernel/signal.c            |  1 +
>>  kernel/vhost_task.c        | 16 ++++------------
>>  5 files changed, 25 insertions(+), 23 deletions(-)
>> 
>> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>> index a92af08e7864..bf83e9340e40 100644
>> --- a/drivers/vhost/vhost.c
>> +++ b/drivers/vhost/vhost.c
>> @@ -338,6 +338,7 @@ static int vhost_worker(void *data)
>>  	struct vhost_worker *worker = data;
>>  	struct vhost_work *work, *work_next;
>>  	struct llist_node *node;
>> +	bool dead = false;
>>  
>>  	for (;;) {
>>  		/* mb paired w/ kthread_stop */
>> @@ -349,8 +350,22 @@ static int vhost_worker(void *data)
>>  		}
>>  
>>  		node = llist_del_all(&worker->work_list);
>> -		if (!node)
>> +		if (!node) {
>>  			schedule();
>> +			/*
>> +			 * When we get a SIGKILL our release function will
>> +			 * be called. That will stop new IOs from being queued
>> +			 * and check for outstanding cmd responses. It will then
>> +			 * call vhost_task_stop to tell us to return and exit.
>> +			 */
>> +			if (!dead && signal_pending(current)) {
>> +				struct ksignal ksig;
>> +
>> +				dead = get_signal(&ksig);
>> +				if (dead)
>> +					clear_thread_flag(TIF_SIGPENDING);
>
>
> Does get_signal actually return true only on SIGKILL then?

get_signal returns the signal that was dequeued, or 0 if no signal was
dequeued.

For these threads that block all but SIGSTOP and SIGKILL get_signal
should properly never return any signal.  As SIGSTOP and SIGKILL are
handled internally to get_signal.

However get_signal was modified to have a special case for io_uring
and now the vhost code so that extra cleanup can be performed, before
do_exit is called on the thread.  That special case causes get_signal
to return when with the value of SIGKILL when the process exits.

The process can exit with do_group_exit aka exit(2) or any fatal signal
not just SIGKILL, and get_signal on these threads will return.

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
