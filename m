Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 24522707897
	for <lists.virtualization@lfdr.de>; Thu, 18 May 2023 05:49:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B056F820C9;
	Thu, 18 May 2023 03:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B056F820C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDp-UV7kX4_M; Thu, 18 May 2023 03:49:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 497DA82061;
	Thu, 18 May 2023 03:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 497DA82061
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8414DC0089;
	Thu, 18 May 2023 03:49:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3840FC002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 03:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0597F60F1A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 03:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0597F60F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCkqpcdfDx_G
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 03:49:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4463660F19
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4463660F19
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 03:49:44 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:33636)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pzUe4-00CfHv-Co; Wed, 17 May 2023 21:49:40 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:42220
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pzUe3-00BaAq-86; Wed, 17 May 2023 21:49:40 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mike Christie <michael.christie@oracle.com>
References: <20230518000920.191583-1-michael.christie@oracle.com>
 <20230518000920.191583-2-michael.christie@oracle.com>
Date: Wed, 17 May 2023 22:49:31 -0500
In-Reply-To: <20230518000920.191583-2-michael.christie@oracle.com> (Mike
 Christie's message of "Wed, 17 May 2023 19:09:13 -0500")
Message-ID: <87ednei9is.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1pzUe3-00BaAq-86; ; ;
 mid=<87ednei9is.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX18xZmL4Q+Vq1+K/tIl/EHdIxr0BcO8Dv4w=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Mike Christie <michael.christie@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 552 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 14 (2.5%), b_tie_ro: 12 (2.1%), parse: 1.65
 (0.3%), extract_message_metadata: 7 (1.3%), get_uri_detail_list: 3.7
 (0.7%), tests_pri_-2000: 5 (1.0%), tests_pri_-1000: 3.7 (0.7%),
 tests_pri_-950: 1.81 (0.3%), tests_pri_-900: 1.45 (0.3%),
 tests_pri_-200: 1.22 (0.2%), tests_pri_-100: 15 (2.6%), tests_pri_-90:
 88 (15.9%), check_bayes: 85 (15.3%), b_tokenize: 12 (2.2%),
 b_tok_get_all: 10 (1.8%), b_comp_prob: 3.4 (0.6%), b_tok_touch_all: 55
 (9.9%), b_finish: 1.17 (0.2%), tests_pri_0: 388 (70.4%),
 check_dkim_signature: 0.72 (0.1%), check_dkim_adsp: 3.4 (0.6%),
 poll_dns_idle: 1.22 (0.2%), tests_pri_10: 3.3 (0.6%), tests_pri_500: 9
 (1.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [RFC PATCH 1/8] signal: Dequeue SIGKILL even if
 SIGNAL_GROUP_EXIT/group_exec_task is set
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, oleg@redhat.com, stefanha@redhat.com,
 linux@leemhuis.info, nicolas.dichtel@6wind.com,
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


Long story short.

In the patch below the first hunk is a noop.

The code you are bypassing was added to ensure that process termination
(aka SIGKILL) is processed before any other signals.  Other than signal
processing order there are not any substantive differences in the two
code paths.  With all signals except SIGSTOP == 19 and SIGKILL == 9
blocked SIGKILL should always be processed before SIGSTOP.

Can you try patch with just the last hunk that does
s/PF_IO_WORKER/PF_USER_WORKER/ and see if that is enough?

I have no objections to the final hunk.

Mike Christie <michael.christie@oracle.com> writes:

> This has us deqeue SIGKILL even if SIGNAL_GROUP_EXIT/group_exec_task is
> set when we are dealing with PF_USER_WORKER tasks.
>
> When a vhost_task gets a SIGKILL, we could have outstanding IO in flight.
> We can easily stop new work/IO from being queued to the vhost_task, but
> for IO that's already been sent to something like the block layer we
> need to wait for the response then process it. These type of IO
> completions use the vhost_task to process the completion so we can't
> exit immediately.
>
> We need to handle wait for then handle those completions from the
> vhost_task, but when we have a SIGKLL pending, functions like
> schedule() return immediately so we can't wait like normal. Functions
> like vhost_worker() degrade to just a while(1); loop.
>
> This patch has get_signal drop down to the normal code path when
> SIGNAL_GROUP_EXIT/group_exec_task is set so the caller can still detect
> there is a SIGKILL but still perform some blocking cleanup.
>
> Note that in that chunk I'm now bypassing that does:
>
> sigdelset(&current->pending.signal, SIGKILL);
>
> we look to be ok, because in the places we set SIGNAL_GROUP_EXIT/
> group_exec_task we are already doing that on the threads in the
> group.
>
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  kernel/signal.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 8f6330f0e9ca..ae4972eea5db 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -2705,9 +2705,18 @@ bool get_signal(struct ksignal *ksig)
>  		struct k_sigaction *ka;
>  		enum pid_type type;
>  
> -		/* Has this task already been marked for death? */
> -		if ((signal->flags & SIGNAL_GROUP_EXIT) ||
> -		     signal->group_exec_task) {
> +		/*
> +		 * Has this task already been marked for death?
> +		 *
> +		 * If this is a PF_USER_WORKER then the task may need to do
> +		 * extra work that requires waiting on running work, so we want
> +		 * to dequeue the signal below and tell the caller its time to
> +		 * start its exit procedure. When the work has completed then
> +		 * the task will exit.
> +		 */
> +		if (!(current->flags & PF_USER_WORKER) &&
> +		    ((signal->flags & SIGNAL_GROUP_EXIT) ||
> +		     signal->group_exec_task)) {
>  			clear_siginfo(&ksig->info);
>  			ksig->info.si_signo = signr = SIGKILL;
>  			sigdelset(&current->pending.signal, SIGKILL);

This hunk is a confusing no-op.

> @@ -2861,11 +2870,11 @@ bool get_signal(struct ksignal *ksig)
>  		}
>  
>  		/*
> -		 * PF_IO_WORKER threads will catch and exit on fatal signals
> +		 * PF_USER_WORKER threads will catch and exit on fatal signals
>  		 * themselves. They have cleanup that must be performed, so
>  		 * we cannot call do_exit() on their behalf.
>  		 */
> -		if (current->flags & PF_IO_WORKER)
> +		if (current->flags & PF_USER_WORKER)
>  			goto out;
>  
>  		/*

This hunk is good and makes sense.

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
