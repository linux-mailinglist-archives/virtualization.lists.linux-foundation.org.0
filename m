Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B57720DAB
	for <lists.virtualization@lfdr.de>; Sat,  3 Jun 2023 05:45:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB9E360B2E;
	Sat,  3 Jun 2023 03:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB9E360B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIlZorJSCj5A; Sat,  3 Jun 2023 03:45:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8FAB860FA7;
	Sat,  3 Jun 2023 03:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FAB860FA7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDA9DC0088;
	Sat,  3 Jun 2023 03:45:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56D56C0029
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Jun 2023 03:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EA77845F3
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Jun 2023 03:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EA77845F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YT9pu3lG8Cne
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Jun 2023 03:45:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D548845F2
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D548845F2
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Jun 2023 03:45:40 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:40116)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q5ICv-007FAM-Ob; Fri, 02 Jun 2023 21:45:38 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:45462
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q5ICu-006Cwo-Gt; Fri, 02 Jun 2023 21:45:37 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
In-Reply-To: <20230602192254.GD555@redhat.com> (Oleg Nesterov's message of
 "Fri, 2 Jun 2023 21:22:55 +0200")
References: <20230601183232.8384-1-michael.christie@oracle.com>
 <20230602192254.GD555@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Fri, 02 Jun 2023 22:44:47 -0500
Message-ID: <87wn0l2or4.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
X-XM-SPF: eid=1q5ICu-006Cwo-Gt; ; ;
 mid=<87wn0l2or4.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX18rwwgl3V8rHDOCFR4O8oZK9le+ZTQfAnc=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Virus: No
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 676 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 4.6 (0.7%), b_tie_ro: 3.1 (0.5%), parse: 1.16
 (0.2%), extract_message_metadata: 4.4 (0.7%), get_uri_detail_list: 2.1
 (0.3%), tests_pri_-2000: 3.2 (0.5%), tests_pri_-1000: 2.1 (0.3%),
 tests_pri_-950: 1.14 (0.2%), tests_pri_-900: 0.89 (0.1%),
 tests_pri_-200: 0.69 (0.1%), tests_pri_-100: 2.5 (0.4%),
 tests_pri_-90: 348 (51.5%), check_bayes: 345 (51.1%), b_tokenize: 6
 (0.8%), b_tok_get_all: 9 (1.3%), b_comp_prob: 1.88 (0.3%),
 b_tok_touch_all: 326 (48.2%), b_finish: 0.72 (0.1%), tests_pri_0: 289
 (42.7%), check_dkim_signature: 0.60 (0.1%), check_dkim_adsp: 3.4
 (0.5%), poll_dns_idle: 2.0 (0.3%), tests_pri_10: 2.9 (0.4%),
 tests_pri_500: 9 (1.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 1/1] fork, vhost: Use CLONE_THREAD to fix freezer/ps
 regression
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

> Hi Mike,
>
> sorry, but somehow I can't understand this patch...
>
> I'll try to read it with a fresh head on Weekend, but for example,
>
> On 06/01, Mike Christie wrote:
>>
>>  static int vhost_task_fn(void *data)
>>  {
>>  	struct vhost_task *vtsk = data;
>> -	int ret;
>> +	bool dead = false;
>> +
>> +	for (;;) {
>> +		bool did_work;
>> +
>> +		/* mb paired w/ vhost_task_stop */
>> +		if (test_bit(VHOST_TASK_FLAGS_STOP, &vtsk->flags))
>> +			break;
>> +
>> +		if (!dead && signal_pending(current)) {
>> +			struct ksignal ksig;
>> +			/*
>> +			 * Calling get_signal will block in SIGSTOP,
>> +			 * or clear fatal_signal_pending, but remember
>> +			 * what was set.
>> +			 *
>> +			 * This thread won't actually exit until all
>> +			 * of the file descriptors are closed, and
>> +			 * the release function is called.
>> +			 */
>> +			dead = get_signal(&ksig);
>> +			if (dead)
>> +				clear_thread_flag(TIF_SIGPENDING);
>
> this can't be right or I am totally confused.
>
> Another signal_wake_up() can come right after clear(SIGPENDING).

Technically yes.

However please not that prepare_signal does:
	if (signal->flags & SIGNAL_GROUP_EXIT)
		return false;

In general it is wrong to receive or attempt to process a signal
after task death has been decided.

Strictly speaking that doesn't cover de_thread, and coredumping
but still receiving any kind of signal at that point is rare
and generally wrong behavior.

Beyond that clearing TIF_SIGPENDING is just an optimization so
the thread can sleep in schedule and not spin.

> Again, I'll try to re-read this patch, but let me ask anyway...
>
> Do we have a plan B? I mean... iirc you have mentioned that you can
> change these code paths to do something like
>
> 	if (killed)
> 		tell_the_drivers_that_all_callbacks_will_fail();
>
>
> so that vhost_worker() can exit after get_signal() returns SIGKILL.
>
> Probably I misunderstood you, but it would be nice to avoid the changes
> in coredump/etc code just to add a temporary (iiuc!) fix.

One saving grace with the the vhost code is that you need to open
device nodes that normally have root-only permissions.

If we are willing to allow races in process shutdown to cause leaks I
think we can do something better, and put the burden of work on vhost
layer.

I will follow up with a patch doing that.

Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
