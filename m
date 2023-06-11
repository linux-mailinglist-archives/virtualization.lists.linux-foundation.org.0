Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4855C72B3ED
	for <lists.virtualization@lfdr.de>; Sun, 11 Jun 2023 22:27:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82714821C3;
	Sun, 11 Jun 2023 20:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82714821C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zg4huVWiEQRC; Sun, 11 Jun 2023 20:27:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 611AA821D0;
	Sun, 11 Jun 2023 20:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 611AA821D0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0CE5C0089;
	Sun, 11 Jun 2023 20:27:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE9A8C0029
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Jun 2023 20:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5738821C3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Jun 2023 20:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5738821C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WojPx0-Vr-pl
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Jun 2023 20:27:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B57DD821B5
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B57DD821B5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Jun 2023 20:27:48 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:32866)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q8Rf7-00FsPF-6p; Sun, 11 Jun 2023 14:27:45 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:57338
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q8Rf5-00Dwr8-Ub; Sun, 11 Jun 2023 14:27:44 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
References: <20230601183232.8384-1-michael.christie@oracle.com>
 <20230602192254.GD555@redhat.com>
 <87r0qt18qq.fsf_-_@email.froward.int.ebiederm.org>
 <ae250076-7d55-c407-1066-86b37014c69c@oracle.com>
 <20230605151037.GE32275@redhat.com>
 <03c07f48-8922-f563-560c-f0d4cc3e1279@oracle.com>
 <20230606121643.GD7542@redhat.com>
 <39f5913c-e658-e476-0378-62236bb4ed49@oracle.com>
 <20230606193907.GB18866@redhat.com>
Date: Sun, 11 Jun 2023 15:27:37 -0500
In-Reply-To: <20230606193907.GB18866@redhat.com> (Oleg Nesterov's message of
 "Tue, 6 Jun 2023 21:39:07 +0200")
Message-ID: <87o7llycau.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1q8Rf5-00Dwr8-Ub; ; ;
 mid=<87o7llycau.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX18l/LHrg7YOf3qY6kN95CS3gXrqGb0gCq8=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 623 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 12 (2.0%), b_tie_ro: 11 (1.7%), parse: 1.19
 (0.2%), extract_message_metadata: 4.6 (0.7%), get_uri_detail_list:
 1.90 (0.3%), tests_pri_-2000: 3.4 (0.5%), tests_pri_-1000: 2.6 (0.4%),
 tests_pri_-950: 1.28 (0.2%), tests_pri_-900: 1.11 (0.2%),
 tests_pri_-200: 0.89 (0.1%), tests_pri_-100: 4.5 (0.7%),
 tests_pri_-90: 54 (8.7%), check_bayes: 52 (8.4%), b_tokenize: 7 (1.1%),
 b_tok_get_all: 7 (1.2%), b_comp_prob: 2.4 (0.4%), b_tok_touch_all: 32
 (5.2%), b_finish: 0.92 (0.1%), tests_pri_0: 515 (82.7%),
 check_dkim_signature: 0.60 (0.1%), check_dkim_adsp: 2.6 (0.4%),
 poll_dns_idle: 0.54 (0.1%), tests_pri_10: 2.9 (0.5%), tests_pri_500: 9
 (1.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [CFT][PATCH v3] fork, vhost: Use CLONE_THREAD to fix freezer/ps
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

> On 06/06, Mike Christie wrote:
>>
>> On 6/6/23 7:16 AM, Oleg Nesterov wrote:
>> > On 06/05, Mike Christie wrote:
>> >
>> >> So it works like if we were using a kthread still:
>> >>
>> >> 1. Userapce thread0 opens /dev/vhost-$something.
>> >> 2. thread0 does VHOST_SET_OWNER ioctl. This calls vhost_task_create() to
>> >> create the task_struct which runs the vhost_worker() function which handles
>> >> the work->fns.
>> >> 3. If userspace now does a SIGKILL or just exits without doing a close() on
>> >> /dev/vhost-$something, then when thread0 does exit_files() that will do the
>> >> fput that does vhost-$something's file_operations->release.
>> >
>> > So, at least in this simple case vhost_worker() can just exit after SIGKILL,
>> > and thread0 can flush the outstanding commands when it calls vhost_dev_flush()
>> > rather than wait for vhost_worker().
>> >
>> > Right?
>>
>> With the current code, the answer is no. We would hang like I mentioned here:
>>
>> https://lore.kernel.org/lkml/ae250076-7d55-c407-1066-86b37014c69c@oracle.com/
>
> If only I could fully understand this email ;)
>
> Could you spell to explain why this can't work (again, in this simple case) ?
>
> My current (and I know, very poor) understanding is that .release() should
> roughly do the following:
>
> 	1. Ensure that vhost_work_queue() can't add the new callbacks
>
> 	2. Call vhost_dev_flush() to ensure that worker->work_list is empty
>
> 	3. Call vhost_task_stop()


At least in the case of exec by the time the final fput happens
from close_on_exec the task has already changed it's mm.  So the
conditions are wrong to run the work queue items.

For close(2) and SIGKILL perhaps, but definitely not in the case of
exec.


Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
