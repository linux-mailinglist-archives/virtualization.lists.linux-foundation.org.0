Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75271658E
	for <lists.virtualization@lfdr.de>; Tue, 30 May 2023 17:02:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C08E5403E2;
	Tue, 30 May 2023 15:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08E5403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I6ofZEK9UCd; Tue, 30 May 2023 15:02:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4708F40574;
	Tue, 30 May 2023 15:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4708F40574
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91653C008C;
	Tue, 30 May 2023 15:02:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60B3AC002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35EA541EE0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35EA541EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yN16vShsyke
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:02:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE2BA41DF4
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE2BA41DF4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 May 2023 15:02:22 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:59752)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q40rd-00FkE0-0G; Tue, 30 May 2023 09:02:21 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:58166
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q40rb-00BNZp-RD; Tue, 30 May 2023 09:02:20 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20230522025124.5863-1-michael.christie@oracle.com>
 <20230522025124.5863-4-michael.christie@oracle.com>
 <20230522123029.GA22159@redhat.com>
 <cfca7764-d210-6df9-e182-2c093101c6cf@oracle.com>
 <20230522174757.GC22159@redhat.com> <20230523121506.GA6562@redhat.com>
 <87bkib6nxr.fsf@email.froward.int.ebiederm.org>
 <20230524141022.GA19091@redhat.com>
 <87ttw1zt4i.fsf@email.froward.int.ebiederm.org>
 <20230525115512.GA9229@redhat.com>
 <87y1lcxwcj.fsf@email.froward.int.ebiederm.org>
 <CAHk-=wj4DS=2F5mW+K2P7cVqrsuGd3rKE_2k2BqnnPeeYhUCvg@mail.gmail.com>
 <87cz2mrtnk.fsf@email.froward.int.ebiederm.org>
Date: Tue, 30 May 2023 10:01:47 -0500
In-Reply-To: <87cz2mrtnk.fsf@email.froward.int.ebiederm.org> (Eric
 W. Biederman's message of "Sat, 27 May 2023 04:49:19 -0500")
Message-ID: <87mt1ldfs4.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1q40rb-00BNZp-RD; ; ;
 mid=<87mt1ldfs4.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX1/9o63f2W6pY4D3HMPRklxYHAhmFR0Cxzc=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 533 ms - load_scoreonly_sql: 0.08 (0.0%),
 signal_user_changed: 11 (2.2%), b_tie_ro: 10 (1.8%), parse: 1.20
 (0.2%), extract_message_metadata: 17 (3.2%), get_uri_detail_list: 1.53
 (0.3%), tests_pri_-2000: 15 (2.8%), tests_pri_-1000: 2.9 (0.6%),
 tests_pri_-950: 1.34 (0.3%), tests_pri_-900: 1.12 (0.2%),
 tests_pri_-200: 0.91 (0.2%), tests_pri_-100: 4.0 (0.8%),
 tests_pri_-90: 210 (39.3%), check_bayes: 201 (37.6%), b_tokenize: 7
 (1.3%), b_tok_get_all: 8 (1.5%), b_comp_prob: 2.5 (0.5%),
 b_tok_touch_all: 179 (33.7%), b_finish: 0.85 (0.2%), tests_pri_0: 238
 (44.7%), check_dkim_signature: 0.54 (0.1%), check_dkim_adsp: 3.0
 (0.6%), poll_dns_idle: 1.39 (0.3%), tests_pri_10: 1.92 (0.4%),
 tests_pri_500: 25 (4.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 3/3] fork, vhost: Use CLONE_THREAD to fix freezer/ps
 regression
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 stefanha@redhat.com, linux@leemhuis.info, nicolas.dichtel@6wind.com,
 virtualization@lists.linux-foundation.org
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

"Eric W. Biederman" <ebiederm@xmission.com> writes:

> Linus Torvalds <torvalds@linux-foundation.org> writes:
>
>> So I'd really like to finish this. Even if we end up with a hack or
>> two in signal handling that we can hopefully fix up later by having
>> vhost fix up some of its current assumptions.
>
>
> The real sticky widget for me is how to handle one of these processes
> coredumping.  It really looks like it will result in a reliable hang.
>
> Limiting ourselves to changes that will only affect vhost, all I can
> see would be allowing the vhost_worker thread to exit as soon as
> get_signal reports the process is exiting.  Then vhost_dev_flush
> would need to process the pending work.
>

Oleg recently pointed out that the trickiest case currently appears
to be what happens if someone calls exec, in a process using vhost.

do_close_on_exec is called after de_thread, and after the mm has
changed.  Which means that my idea of moving the work from vhost_worker
into vhost_dev_flush can't work.  At the point that flush is called
it has the wrong mm.  Which means the flush or cancel of the pending
work needs to happen in the vhost thread, we can't assume there
is any other thread available to do the work.

What makes this all nice is that the vhost code has
vhost_dev_check_owner which ensures only one mm can initiate
I/O.  Which means file descriptor passing is essentially an
academic concern.

In the case of both process exit, and exec except for a racing
on which piece of code shuts down first there should be no
more I/O going into the work queues.

But it is going to take someone who understands and cares about
vhost to figure out how to stop new I/O from going into the
work queues and to ensure that on-going work is dealt with.

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
