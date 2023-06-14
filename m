Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785B72F461
	for <lists.virtualization@lfdr.de>; Wed, 14 Jun 2023 08:03:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F9760B98;
	Wed, 14 Jun 2023 06:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7F9760B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVpcaqJhGx-o; Wed, 14 Jun 2023 06:03:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 26CA660AC6;
	Wed, 14 Jun 2023 06:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CA660AC6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4199CC0089;
	Wed, 14 Jun 2023 06:03:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EC2AC0029
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 606978143D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 606978143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSlvqWnihC-O
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:03:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29168140B
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B29168140B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:03:37 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:36596)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q9JbT-009Rpp-9K; Wed, 14 Jun 2023 00:03:35 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:55536
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q9JbJ-003KA2-K3; Wed, 14 Jun 2023 00:03:34 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mike Christie <michael.christie@oracle.com>
References: <20230601183232.8384-1-michael.christie@oracle.com>
 <20230602192254.GD555@redhat.com>
 <87r0qt18qq.fsf_-_@email.froward.int.ebiederm.org>
 <ae250076-7d55-c407-1066-86b37014c69c@oracle.com>
 <20230605151037.GE32275@redhat.com>
 <03c07f48-8922-f563-560c-f0d4cc3e1279@oracle.com>
 <20230606121643.GD7542@redhat.com>
 <39f5913c-e658-e476-0378-62236bb4ed49@oracle.com>
 <20230606193907.GB18866@redhat.com>
 <cfbf1a0d-5d62-366f-f32f-6c63b151489e@oracle.com>
Date: Wed, 14 Jun 2023 01:02:58 -0500
In-Reply-To: <cfbf1a0d-5d62-366f-f32f-6c63b151489e@oracle.com> (Mike
 Christie's message of "Tue, 6 Jun 2023 15:38:04 -0500")
Message-ID: <87mt12oa25.fsf_-_@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1q9JbJ-003KA2-K3; ; ;
 mid=<87mt12oa25.fsf_-_@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX1/4Ah0HgiSeh15/g7eNi4deF/0irVfxcS8=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: ; sa07 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Mike Christie <michael.christie@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 8918 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 213 (2.4%), b_tie_ro: 8 (0.1%), parse: 1.15
 (0.0%), extract_message_metadata: 3.4 (0.0%), get_uri_detail_list:
 0.91 (0.0%), tests_pri_-2000: 3.3 (0.0%), tests_pri_-1000: 2.6 (0.0%),
 tests_pri_-950: 1.32 (0.0%), tests_pri_-900: 1.08 (0.0%),
 tests_pri_-200: 0.84 (0.0%), tests_pri_-100: 2.9 (0.0%),
 tests_pri_-90: 1378 (15.5%), check_bayes: 1375 (15.4%), b_tokenize: 5
 (0.1%), b_tok_get_all: 817 (9.2%), b_comp_prob: 2.2 (0.0%),
 b_tok_touch_all: 547 (6.1%), b_finish: 0.88 (0.0%), tests_pri_0: 7287
 (81.7%), check_dkim_signature: 0.67 (0.0%), check_dkim_adsp: 2.9
 (0.0%), poll_dns_idle: 1.04 (0.0%), tests_pri_10: 3.3 (0.0%),
 tests_pri_500: 9 (0.1%), rewrite_mail: 0.00 (0.0%)
Subject: Can vhost translate to io_uring?
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 stefanha@redhat.com, linux@leemhuis.info, nicolas.dichtel@6wind.com,
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


I am sad my idea for simplifying things did not work out.


Let's try an even bigger idea to reduce maintenance and simplify things.

Could vhost depend on io_uring?

Could vhost just be a translation layer of existing vhost requests to
io_uring requests?

At a quick glance it looks like io_uring already supports the
functionality that vhost supports (which I think is networking and
scsi).

If vhost could become a translation layer that would allow removing
the vhost worker and PF_USER_WORKER could be removed completely,
leaving only PF_IO_WORKER.


I suggest this because a significant vhost change is needed because in
the long term the hacks in exec and coredump are not a good idea.  Which
means something like my failed "[PATCH v3] fork, vhost: Use CLONE_THREAD
to fix freezer/ps regression".

If we have to go to all of the trouble of reworking things it why can't
we just make io_uring do all of the work?

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
