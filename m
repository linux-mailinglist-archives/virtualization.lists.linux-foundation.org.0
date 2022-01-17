Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E891E490FA2
	for <lists.virtualization@lfdr.de>; Mon, 17 Jan 2022 18:31:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45DAD80C1E;
	Mon, 17 Jan 2022 17:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7dxGJnD_WG1; Mon, 17 Jan 2022 17:31:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 056CE80C15;
	Mon, 17 Jan 2022 17:31:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78C03C007A;
	Mon, 17 Jan 2022 17:31:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E16FC002F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 17:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E49660B54
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 17:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyq5MrVpi0EO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 17:31:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9C986063B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 17:31:34 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:44742)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n9Vqt-00HRqg-CU; Mon, 17 Jan 2022 10:31:31 -0700
Received: from ip68-110-24-146.om.om.cox.net ([68.110.24.146]:47238
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n9Vqs-00FkwG-D8; Mon, 17 Jan 2022 10:31:31 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mike Christie <michael.christie@oracle.com>
References: <20211129194707.5863-1-michael.christie@oracle.com>
 <87tuf79gni.fsf@email.froward.int.ebiederm.org>
 <a171238e-d731-1c22-af72-0f7faf7f4bea@oracle.com>
 <87tuf11oe6.fsf@email.froward.int.ebiederm.org>
 <a3bd6fe7-1775-6fdd-3a02-e779c4d4e498@oracle.com>
 <87pmpoxzuf.fsf@email.froward.int.ebiederm.org>
 <783145b7-243b-b85e-e274-44ef6c0696b9@oracle.com>
Date: Mon, 17 Jan 2022 11:31:22 -0600
In-Reply-To: <783145b7-243b-b85e-e274-44ef6c0696b9@oracle.com> (Mike
 Christie's message of "Mon, 17 Jan 2022 10:41:05 -0600")
Message-ID: <874k62b76d.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1n9Vqs-00FkwG-D8; ; ;
 mid=<874k62b76d.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.24.146; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX19/12qxSuzbVIP5mosEcqpM6N5wKVRUr9o=
X-SA-Exim-Connect-IP: 68.110.24.146
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Mike Christie <michael.christie@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 444 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 9 (2.1%), b_tie_ro: 8 (1.8%), parse: 0.78 (0.2%),
 extract_message_metadata: 2.4 (0.5%), get_uri_detail_list: 0.74 (0.2%),
 tests_pri_-1000: 3.5 (0.8%), tests_pri_-950: 1.19 (0.3%),
 tests_pri_-900: 0.99 (0.2%), tests_pri_-90: 101 (22.8%), check_bayes:
 100 (22.5%), b_tokenize: 5.0 (1.1%), b_tok_get_all: 6 (1.3%),
 b_comp_prob: 1.73 (0.4%), b_tok_touch_all: 84 (18.9%), b_finish: 0.98
 (0.2%), tests_pri_0: 304 (68.5%), check_dkim_signature: 0.49 (0.1%),
 check_dkim_adsp: 2.6 (0.6%), poll_dns_idle: 0.80 (0.2%), tests_pri_10:
 2.3 (0.5%), tests_pri_500: 10 (2.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH V6 01/10] Use copy_process in vhost layer
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

> On 12/22/21 12:24 PM, Eric W. Biederman wrote:
>> All I am certain of is that you need to set
>> "args->exit_signal = -1;".  This prevents having to play games with
>> do_notify_parent.
>
> Hi Eric,
>
> I have all your review comments handled except this one. It's looking like it's
> more difficult than just setting the exit_signal=-1, so I wanted to check that
> I understood you.

[snip problems with exit_signal = -1]

>
> What do you think?

I was wrong.  I appear to have confused the thread and the non-thread
cases.

Perhaps I meant "args->exit_signal = 0".  That looks like
do_notify_parent won't send it, and thread_group_leader continues to do
the right thing.

Baring any additional confusion on my part that cleanly solves the
problem of how not to send a signal from a child process cleanly.

My apologies for sending you on a wild goose chase.

Eric


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
