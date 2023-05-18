Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 761037087D1
	for <lists.virtualization@lfdr.de>; Thu, 18 May 2023 20:31:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A121615E6;
	Thu, 18 May 2023 18:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A121615E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtuSe5WwStzY; Thu, 18 May 2023 18:31:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 10B016147D;
	Thu, 18 May 2023 18:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B016147D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AA4BC007C;
	Thu, 18 May 2023 18:31:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52A74C002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A57041CB0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A57041CB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5Mwfq2PBpG2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:31:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D0C41CAD
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35D0C41CAD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:31:33 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:39668)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pziPS-00FFOi-DZ; Thu, 18 May 2023 12:31:30 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:59590
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pziPR-00DImN-82; Thu, 18 May 2023 12:31:30 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
References: <20230518000920.191583-1-michael.christie@oracle.com>
 <20230518000920.191583-2-michael.christie@oracle.com>
 <87ednei9is.fsf@email.froward.int.ebiederm.org>
 <ab7d07ba-5dc3-95c0-aa7c-c2575d03f429@oracle.com>
 <20230518162508.GB20779@redhat.com>
 <05236dee-59b7-f394-db3d-cbb4d4163ce8@oracle.com>
 <20230518170359.GC20779@redhat.com>
Date: Thu, 18 May 2023 13:28:40 -0500
In-Reply-To: <20230518170359.GC20779@redhat.com> (Oleg Nesterov's message of
 "Thu, 18 May 2023 19:04:00 +0200")
Message-ID: <875y8ph4tj.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1pziPR-00DImN-82; ; ;
 mid=<875y8ph4tj.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX182DvrCr+dDpgYT6hG0qr0JpzI/WgfQ6fE=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 599 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (1.8%), b_tie_ro: 9 (1.5%), parse: 1.06 (0.2%),
 extract_message_metadata: 4.6 (0.8%), get_uri_detail_list: 2.3 (0.4%),
 tests_pri_-2000: 3.6 (0.6%), tests_pri_-1000: 2.6 (0.4%),
 tests_pri_-950: 1.29 (0.2%), tests_pri_-900: 1.03 (0.2%),
 tests_pri_-200: 0.86 (0.1%), tests_pri_-100: 4.4 (0.7%),
 tests_pri_-90: 85 (14.2%), check_bayes: 83 (13.9%), b_tokenize: 10
 (1.6%), b_tok_get_all: 10 (1.7%), b_comp_prob: 4.0 (0.7%),
 b_tok_touch_all: 55 (9.2%), b_finish: 1.02 (0.2%), tests_pri_0: 464
 (77.4%), check_dkim_signature: 0.89 (0.1%), check_dkim_adsp: 3.2
 (0.5%), poll_dns_idle: 0.85 (0.1%), tests_pri_10: 2.2 (0.4%),
 tests_pri_500: 9 (1.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [RFC PATCH 1/8] signal: Dequeue SIGKILL even if
 SIGNAL_GROUP_EXIT/group_exec_task is set
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com, linux@leemhuis.info,
 linux-kernel@vger.kernel.org, stefanha@redhat.com, nicolas.dichtel@6wind.com,
 virtualization@lists.linux-foundation.org, torvalds@linux-foundation.org
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

Oleg Nesterov <oleg@redhat.com> writes:

> On 05/18, Mike Christie wrote:
>>
>> On 5/18/23 11:25 AM, Oleg Nesterov wrote:
>> > I too do not understand the 1st change in this patch ...
>> >
>> > On 05/18, Mike Christie wrote:
>> >>
>> >> In the other patches we do:
>> >>
>> >> if (get_signal(ksig))
>> >> 	start_exit_cleanup_by_stopping_newIO()
>> >> 	flush running IO()
>> >> 	exit()
>> >>
>> >> But to do the flush running IO() part of this I need to wait for it so
>> >> that's why I wanted to be able to dequeue the SIGKILL and clear the
>> >> TIF_SIGPENDING bit.
>> >
>> > But get_signal() will do what you need, dequeue SIGKILL and clear SIGPENDING ?
>> >
>> > 	if ((signal->flags & SIGNAL_GROUP_EXIT) ||
>> > 	     signal->group_exec_task) {
>> > 		clear_siginfo(&ksig->info);
>> > 		ksig->info.si_signo = signr = SIGKILL;
>> > 		sigdelset(&current->pending.signal, SIGKILL);
>> >
>> > this "dequeues" SIGKILL,
>
> OOPS. this doesn't remove SIGKILL from current->signal->shared_pending

Neither does calling get_signal the first time.
But the second time get_signal is called it should work.

Leaving SIGKILL in current->signal->shared_pending when it has already
been short circuit delivered appears to be an out and out bug.

>> >
>> > 		trace_signal_deliver(SIGKILL, SEND_SIG_NOINFO,
>> > 			&sighand->action[SIGKILL - 1]);
>> > 		recalc_sigpending();
>> >
>> > this clears TIF_SIGPENDING.
>
> No, I was wrong, recalc_sigpending() won't clear TIF_SIGPENDING if
> SIGKILL is in signal->shared_pending

That feels wrong as well.

>> I see what you guys meant. TIF_SIGPENDING isn't getting cleared.
>> I'll dig into why.
>
> See above, sorry for confusion.
>
>
>
> And again, there is another problem with SIGSTOP. To simplify, suppose
> a PF_IO_WORKER thread does something like
>
> 	while (signal_pending(current))
> 		get_signal(...);
>
> this will loop forever if (SIGNAL_GROUP_EXIT || group_exec_task) and
> SIGSTOP is pending.

I think we want to do something like the untested diff below.

That the PF_IO_WORKER test allows get_signal to be called
after get_signal returns a fatal aka SIGKILL seems wrong.
That doesn't happen in the io_uring case, and certainly nowhere
else.

The change to complete_signal appears obviously correct although
a pending siginfo still needs to be handled.

The change to recalc_siginfo also appears mostly right, but I am not
certain that the !freezing test is in the proper place.  Nor am I
certain it won't have other surprise effects.

Still the big issue seems to be the way get_signal is connected into
these threads so that it keeps getting called.  Calling get_signal after
a fatal signal has been returned happens nowhere else and even if we fix
it today it is likely to lead to bugs in the future because whoever is
testing and updating the code is unlikely they have a vhost test case
the care about.

diff --git a/kernel/signal.c b/kernel/signal.c
index 8f6330f0e9ca..4d54718cad36 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -181,7 +181,9 @@ void recalc_sigpending_and_wake(struct task_struct *t)
 
 void recalc_sigpending(void)
 {
-       if (!recalc_sigpending_tsk(current) && !freezing(current))
+       if ((!recalc_sigpending_tsk(current) && !freezing(current)) ||
+           ((current->signal->flags & SIGNAL_GROUP_EXIT) &&
+                   !__fatal_signal_pending(current)))
                clear_thread_flag(TIF_SIGPENDING);
 
 }
@@ -1043,6 +1045,13 @@ static void complete_signal(int sig, struct task_struct *p, enum pid_type type)
                 * This signal will be fatal to the whole group.
                 */
                if (!sig_kernel_coredump(sig)) {
+                       /*
+                        * The signal is being short circuit delivered
+                        * don't it pending.
+                        */
+                       if (type != PIDTYPE_PID) {
+                               sigdelset(&t->signal->shared_pending,  sig);
+
                        /*
                         * Start a group exit and wake everybody up.
                         * This way we don't have other threads



Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
