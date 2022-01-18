Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EB567492E35
	for <lists.virtualization@lfdr.de>; Tue, 18 Jan 2022 20:12:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 701A240646;
	Tue, 18 Jan 2022 19:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fCK5Ih0Nk5T; Tue, 18 Jan 2022 19:12:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EE4E340642;
	Tue, 18 Jan 2022 19:12:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76292C0077;
	Tue, 18 Jan 2022 19:12:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 376EAC002F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 19:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1649D60E57
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 19:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rf8gE4mLgFOg
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 19:12:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D10960E5C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 19:12:39 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:46696)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n9tuF-007YVI-6b; Tue, 18 Jan 2022 12:12:35 -0700
Received: from ip68-110-24-146.om.om.cox.net ([68.110.24.146]:33802
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n9tuE-007hWo-1S; Tue, 18 Jan 2022 12:12:34 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mike Christie <michael.christie@oracle.com>
References: <20211129194707.5863-1-michael.christie@oracle.com>
 <87tuf79gni.fsf@email.froward.int.ebiederm.org>
 <a171238e-d731-1c22-af72-0f7faf7f4bea@oracle.com>
 <87tuf11oe6.fsf@email.froward.int.ebiederm.org>
 <a3bd6fe7-1775-6fdd-3a02-e779c4d4e498@oracle.com>
 <87pmpoxzuf.fsf@email.froward.int.ebiederm.org>
 <783145b7-243b-b85e-e274-44ef6c0696b9@oracle.com>
 <874k62b76d.fsf@email.froward.int.ebiederm.org>
 <68ba89ae-108e-c14a-02a0-db72b169c9b1@oracle.com>
Date: Tue, 18 Jan 2022 13:12:26 -0600
In-Reply-To: <68ba89ae-108e-c14a-02a0-db72b169c9b1@oracle.com> (Mike
 Christie's message of "Tue, 18 Jan 2022 12:51:27 -0600")
Message-ID: <87a6fs3lk5.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1n9tuE-007hWo-1S; ; ;
 mid=<87a6fs3lk5.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.24.146; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/xrXBIFZmCO/AVkFA8G1d01MrUM6jLen4=
X-SA-Exim-Connect-IP: 68.110.24.146
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Mike Christie <michael.christie@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 456 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 9 (2.0%), b_tie_ro: 8 (1.7%), parse: 0.97 (0.2%),
 extract_message_metadata: 3.6 (0.8%), get_uri_detail_list: 1.46 (0.3%),
 tests_pri_-1000: 2.7 (0.6%), tests_pri_-950: 1.25 (0.3%),
 tests_pri_-900: 1.01 (0.2%), tests_pri_-90: 66 (14.6%), check_bayes:
 65 (14.2%), b_tokenize: 7 (1.6%), b_tok_get_all: 7 (1.6%),
 b_comp_prob: 2.2 (0.5%), b_tok_touch_all: 45 (9.9%), b_finish: 0.78
 (0.2%), tests_pri_0: 353 (77.4%), check_dkim_signature: 0.53 (0.1%),
 check_dkim_adsp: 3.4 (0.7%), poll_dns_idle: 0.53 (0.1%), tests_pri_10:
 2.2 (0.5%), tests_pri_500: 7 (1.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH V6 01/10] Use copy_process in vhost layer
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
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

> On 1/17/22 11:31 AM, Eric W. Biederman wrote:
>> Mike Christie <michael.christie@oracle.com> writes:
>> 
>>> On 12/22/21 12:24 PM, Eric W. Biederman wrote:
>>>> All I am certain of is that you need to set
>>>> "args->exit_signal = -1;".  This prevents having to play games with
>>>> do_notify_parent.
>>>
>>> Hi Eric,
>>>
>>> I have all your review comments handled except this one. It's looking like it's
>>> more difficult than just setting the exit_signal=-1, so I wanted to check that
>>> I understood you.
>> 
>> [snip problems with exit_signal = -1]
>> 
>>>
>>> What do you think?
>> 
>> I was wrong.  I appear to have confused the thread and the non-thread
>> cases.
>> 
>> Perhaps I meant "args->exit_signal = 0".  That looks like
>> do_notify_parent won't send it, and thread_group_leader continues to do
>> the right thing.
>
> That doesn't work too. exit_notify will call do_notify_parent but 
> our parent, qemu, does not ignore SIGCHILD so we will not drop
> down in into this chunk:
>
>         psig = tsk->parent->sighand;
>         spin_lock_irqsave(&psig->siglock, flags);
>         if (!tsk->ptrace && sig == SIGCHLD &&
>             (psig->action[SIGCHLD-1].sa.sa_handler == SIG_IGN ||
>              (psig->action[SIGCHLD-1].sa.sa_flags & SA_NOCLDWAIT))) {
>
> do_notify_parent will return false and so autoreap in exit_notify will
> be false.

Bah good point.  We won't send the signal but you won't autoreap either.

I think we could legitimately change this bit:

	/*
	 * Send with __send_signal as si_pid and si_uid are in the
	 * parent's namespaces.
	 */
	if (valid_signal(sig) && sig)
		__send_signal(sig, &info, tsk->parent, PIDTYPE_TGID, false);

To add:
	else
        	/* We don't notify the parent so just autoreap */
        	autoreap = true;


I expect we could make that change all on it's own, it sort of breaks my
head that requesting not signaling a parent does not also trigger
autoreap behavior.

We certainly need some mechanism to trigger autoreap behavior or the
technical details of being an extra thread of the process need to be
solved.

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
