Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0AF710F9A
	for <lists.virtualization@lfdr.de>; Thu, 25 May 2023 17:31:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14AB161262;
	Thu, 25 May 2023 15:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14AB161262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dkLzUW0e50N; Thu, 25 May 2023 15:30:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DE415612D9;
	Thu, 25 May 2023 15:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE415612D9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27DD1C0089;
	Thu, 25 May 2023 15:30:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C54FC002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 15:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 685C34273A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 15:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 685C34273A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPPla7T5arn9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 15:30:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 536C042739
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 536C042739
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 15:30:53 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:37406)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q2CvS-000r5n-Fi; Thu, 25 May 2023 09:30:50 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:35938
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q2CvR-00FA7J-65; Thu, 25 May 2023 09:30:50 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
References: <20230522025124.5863-1-michael.christie@oracle.com>
 <20230522025124.5863-4-michael.christie@oracle.com>
 <20230522123029.GA22159@redhat.com>
 <cfca7764-d210-6df9-e182-2c093101c6cf@oracle.com>
 <20230522174757.GC22159@redhat.com> <20230523121506.GA6562@redhat.com>
 <87bkib6nxr.fsf@email.froward.int.ebiederm.org>
 <20230524141022.GA19091@redhat.com>
 <87ttw1zt4i.fsf@email.froward.int.ebiederm.org>
 <20230525115512.GA9229@redhat.com>
Date: Thu, 25 May 2023 10:30:04 -0500
In-Reply-To: <20230525115512.GA9229@redhat.com> (Oleg Nesterov's message of
 "Thu, 25 May 2023 13:55:13 +0200")
Message-ID: <87y1lcxwcj.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1q2CvR-00FA7J-65; ; ;
 mid=<87y1lcxwcj.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX1/R72iCqGKqDUSGxzLbRgsNGaK/j3KlzUI=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 721 ms - load_scoreonly_sql: 0.28 (0.0%),
 signal_user_changed: 18 (2.5%), b_tie_ro: 14 (2.0%), parse: 3.3 (0.5%),
 extract_message_metadata: 12 (1.7%), get_uri_detail_list: 2.9 (0.4%),
 tests_pri_-2000: 11 (1.5%), compile_eval: 59 (8.2%), tests_pri_-1000:
 6 (0.9%), tests_pri_-950: 2.8 (0.4%), tests_pri_-900: 2.5 (0.3%),
 tests_pri_-200: 1.45 (0.2%), tests_pri_-100: 11 (1.5%), tests_pri_-90:
 100 (13.9%), check_bayes: 92 (12.7%), b_tokenize: 12 (1.7%),
 b_tok_get_all: 7 (1.0%), b_comp_prob: 3.2 (0.4%), b_tok_touch_all: 62
 (8.6%), b_finish: 1.47 (0.2%), tests_pri_0: 501 (69.6%),
 check_dkim_signature: 1.13 (0.2%), check_dkim_adsp: 7 (1.0%),
 poll_dns_idle: 0.47 (0.1%), tests_pri_10: 3.7 (0.5%), tests_pri_500:
 17 (2.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 3/3] fork, vhost: Use CLONE_THREAD to fix freezer/ps
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

> On 05/24, Eric W. Biederman wrote:
>>
>> Oleg Nesterov <oleg@redhat.com> writes:
>>
>> > Yes, but probably SIGABRT/exit doesn't really differ from SIGKILL wrt
>> > vhost_worker().
>>
>> Actually I think it reveals that exiting with SIGABRT will cause
>> a deadlock.
>>
>> coredump_wait will wait for all of the threads to reach
>> coredump_task_exit.  Meanwhile vhost_worker is waiting for
>> all of the other threads to reach exit_files to close their
>> file descriptors.
>
> Indeed, I didn't think about this.
>
>
> So why do we actually need CLONE_THREAD ? Can't vhost_worker() be a kernel thread?
>
> kthread_create() won't be convenient, but how about kernel_thread() ? it inherits
> mm/cgroups/rlimits/etc, kthread_stop() should work just fine.

Basically with no patches that is where Linus's kernel is.

User complained about the new thread showing up in ps.  So the
exploration of how we could use CLONE_THREAD instead of what is
currently merged began.

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
