Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F767087E8
	for <lists.virtualization@lfdr.de>; Thu, 18 May 2023 20:38:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D765942BA2;
	Thu, 18 May 2023 18:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D765942BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_XFjHC_ukCT; Thu, 18 May 2023 18:38:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ACC9242B9C;
	Thu, 18 May 2023 18:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACC9242B9C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC9D9C007C;
	Thu, 18 May 2023 18:38:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF190C002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86FF742761
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86FF742761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0H4X5mFVYfT
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:38:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9123C41FF6
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9123C41FF6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 18:38:39 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:38250)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pziWL-00DkSF-Ep; Thu, 18 May 2023 12:38:37 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:41956
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pziWK-00DKMU-8V; Thu, 18 May 2023 12:38:37 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mike Christie <michael.christie@oracle.com>
References: <20230518000920.191583-1-michael.christie@oracle.com>
 <20230518000920.191583-6-michael.christie@oracle.com>
 <20230518-lokomotive-aufziehen-dbc432136b76@brauner>
 <81e1a94d-531a-2e43-baee-da4b35644e87@oracle.com>
Date: Thu, 18 May 2023 13:38:29 -0500
In-Reply-To: <81e1a94d-531a-2e43-baee-da4b35644e87@oracle.com> (Mike
 Christie's message of "Thu, 18 May 2023 10:03:32 -0500")
Message-ID: <87ttw9fpsq.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1pziWK-00DKMU-8V; ; ;
 mid=<87ttw9fpsq.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX1/dXqWsNhfo08htcPvm8Hc3O6X+eIhc/TM=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Virus: No
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Mike Christie <michael.christie@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 585 ms - load_scoreonly_sql: 0.02 (0.0%),
 signal_user_changed: 4.7 (0.8%), b_tie_ro: 3.3 (0.6%), parse: 1.07
 (0.2%), extract_message_metadata: 3.7 (0.6%), get_uri_detail_list:
 1.48 (0.3%), tests_pri_-2000: 3.2 (0.5%), tests_pri_-1000: 2.1 (0.4%),
 tests_pri_-950: 1.10 (0.2%), tests_pri_-900: 0.89 (0.2%),
 tests_pri_-200: 0.73 (0.1%), tests_pri_-100: 2.8 (0.5%),
 tests_pri_-90: 309 (52.9%), check_bayes: 308 (52.6%), b_tokenize: 4.8
 (0.8%), b_tok_get_all: 7 (1.2%), b_comp_prob: 1.67 (0.3%),
 b_tok_touch_all: 291 (49.8%), b_finish: 0.66 (0.1%), tests_pri_0: 239
 (40.9%), check_dkim_signature: 0.38 (0.1%), check_dkim_adsp: 2.7
 (0.5%), poll_dns_idle: 1.37 (0.2%), tests_pri_10: 1.81 (0.3%),
 tests_pri_500: 6 (1.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [RFC PATCH 5/8] vhost: Add callback that stops new work and
 waits on running ones
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: axboe@kernel.dk, Christian Brauner <brauner@kernel.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, oleg@redhat.com, linux@leemhuis.info,
 stefanha@redhat.com, nicolas.dichtel@6wind.com,
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

Mike Christie <michael.christie@oracle.com> writes:

> On 5/18/23 9:18 AM, Christian Brauner wrote:
>>> @@ -352,12 +353,13 @@ static int vhost_worker(void *data)
>>>  		if (!node) {
>>>  			schedule();
>>>  			/*
>>> -			 * When we get a SIGKILL our release function will
>>> -			 * be called. That will stop new IOs from being queued
>>> -			 * and check for outstanding cmd responses. It will then
>>> -			 * call vhost_task_stop to exit us.
>>> +			 * When we get a SIGKILL we kick off a work to
>>> +			 * run the driver's helper to stop new work and
>>> +			 * handle completions. When they are done they will
>>> +			 * call vhost_task_stop to tell us to exit.
>>>  			 */
>>> -			vhost_task_get_signal();
>>> +			if (vhost_task_get_signal())
>>> +				schedule_work(&dev->destroy_worker);
>>>  		}
>> 
>> I'm pretty sure you still need to actually call exit here. Basically
>> mirror what's done in io_worker_exit() minus the io specific bits.
>
> We do call do_exit(). Once destory_worker has flushed the device and
> all outstanding IO has completed it call vhost_task_stop(). vhost_worker()
> above then breaks out of the loop and returns and vhost_task_fn() does
> do_exit().

I am not certain how you want to structure this but you really should
not call get_signal after it returns positive before you call do_exit.

You are in complete uncharted and untested waters calling get_signal
multiple times, when get_signal figures the proper response is to
call do_exit itself.

Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
