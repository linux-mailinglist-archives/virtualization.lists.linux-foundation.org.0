Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A047942F
	for <lists.virtualization@lfdr.de>; Fri, 17 Dec 2021 19:43:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF2861153;
	Fri, 17 Dec 2021 18:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjApEpaMdtqo; Fri, 17 Dec 2021 18:43:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6073761158;
	Fri, 17 Dec 2021 18:43:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DABA0C0070;
	Fri, 17 Dec 2021 18:43:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8733C0012
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 18:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C92A041EB5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 18:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9DjoW9pPlNZ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 18:43:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 127F641DE5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 18:43:45 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:58040)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1myICk-00FEae-88; Fri, 17 Dec 2021 11:43:42 -0700
Received: from ip68-227-161-49.om.om.cox.net ([68.227.161.49]:42298
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1myICi-008ieW-3a; Fri, 17 Dec 2021 11:43:41 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: Mike Christie <michael.christie@oracle.com>
References: <20211129194707.5863-1-michael.christie@oracle.com>
 <20211129194707.5863-6-michael.christie@oracle.com>
Date: Fri, 17 Dec 2021 12:42:54 -0600
In-Reply-To: <20211129194707.5863-6-michael.christie@oracle.com> (Mike
 Christie's message of "Mon, 29 Nov 2021 13:47:02 -0600")
Message-ID: <87lf0jdqdt.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1myICi-008ieW-3a; ; ;
 mid=<87lf0jdqdt.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.161.49; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/iGnaVviMxtTKijQlJhSfLXrjW2CoE4/w=
X-SA-Exim-Connect-IP: 68.227.161.49
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Mike Christie <michael.christie@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1554 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (0.7%), b_tie_ro: 9 (0.6%), parse: 0.81 (0.1%),
 extract_message_metadata: 3.1 (0.2%), get_uri_detail_list: 1.26
 (0.1%), tests_pri_-1000: 3.6 (0.2%), tests_pri_-950: 1.20 (0.1%),
 tests_pri_-900: 1.01 (0.1%), tests_pri_-90: 76 (4.9%), check_bayes: 74
 (4.8%), b_tokenize: 7 (0.4%), b_tok_get_all: 8 (0.5%), b_comp_prob:
 2.1 (0.1%), b_tok_touch_all: 55 (3.5%), b_finish: 0.80 (0.1%),
 tests_pri_0: 1424 (91.6%), check_dkim_signature: 0.52 (0.0%),
 check_dkim_adsp: 2.9 (0.2%), poll_dns_idle: 0.94 (0.1%), tests_pri_10:
 4.7 (0.3%), tests_pri_500: 22 (1.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH V6 05/10] signal: Perfom autoreap for PF_USER_WORKER
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: axboe@kernel.dk, hdanton@sina.com, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, vverma@digitalocean.com, geert@linux-m68k.org,
 stefanha@redhat.com, christian.brauner@ubuntu.com
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

Mike Christie <michael.christie@oracle.com> writes:

> Userspace doesn't know about PF_USER_WORKER threads, so it can't do wait
> to clean them up. For cases like where qemu will do dynamic/hot add/remove
> of vhost devices, then we need to auto reap the thread like was done for
> the kthread case, because qemu does not know what API the kernel/vhost
> layer is using.
>
> This has us do autoreaping for these threads similar to when the parent
> ignores SIGCHLD and for kthreads.

There is a lot wrong with this change.
1) you can just set "task->signal = SIGCHLD" to get this
   behavior so it is unnecessary.

2) This is not the autoreaping you want.  This autoreaping just kicks
   in when the parents signal handler is SIG_IGN.  Since I presume
   you are not controlling the parent this is just plain nonsense.

The autoreap you want is the autoreap in exit_notify, and you don't
want to call do_notify_parent at all.

Eric

> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  kernel/signal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index a629b11bf3e0..4ce2cc195269 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -2071,9 +2071,9 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  
>  	psig = tsk->parent->sighand;
>  	spin_lock_irqsave(&psig->siglock, flags);
> -	if (!tsk->ptrace && sig == SIGCHLD &&
> +	if (!tsk->ptrace && (tsk->flags & PF_USER_WORKER || (sig == SIGCHLD &&
>  	    (psig->action[SIGCHLD-1].sa.sa_handler == SIG_IGN ||
> -	     (psig->action[SIGCHLD-1].sa.sa_flags & SA_NOCLDWAIT))) {
> +	     (psig->action[SIGCHLD-1].sa.sa_flags & SA_NOCLDWAIT))))) {
>  		/*
>  		 * We are exiting and our parent doesn't care.  POSIX.1
>  		 * defines special semantics for setting SIGCHLD to SIG_IGN
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
