Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEEA708608
	for <lists.virtualization@lfdr.de>; Thu, 18 May 2023 18:26:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A004784365;
	Thu, 18 May 2023 16:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A004784365
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DCORfyWO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RW4UHsxUr_e2; Thu, 18 May 2023 16:26:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 54AD68434D;
	Thu, 18 May 2023 16:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AD68434D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E8D7C007C;
	Thu, 18 May 2023 16:26:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EE8DC002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28FA14119B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 16:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28FA14119B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DCORfyWO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8P4doexvg_uO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 16:26:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67ED84054B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67ED84054B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684427171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N0VBaOKRYTVXJE7z+8gKbNWq3wyr8YL28adwGI5M+8Q=;
 b=DCORfyWOWZTH4RUdQkYEotrbDaBDq7rmrung2Il2lcqgbVhprM9KfA50kpxNsE/MWdKpcr
 ua7nQYShRBddGbZvgbJVDqKupq3fSK2rPxgB5eFzrPnoslVenEU5VBehEF2WfO2RGgv/hu
 b0Z5QD1xUtHl2eZt+Ed1cJGdn/7nXOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-xlcIGl63Ncy0qqjYJ0vFaw-1; Thu, 18 May 2023 12:26:07 -0400
X-MC-Unique: xlcIGl63Ncy0qqjYJ0vFaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E18C805F58;
 Thu, 18 May 2023 16:26:07 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.20])
 by smtp.corp.redhat.com (Postfix) with SMTP id 4D4651121314;
 Thu, 18 May 2023 16:26:04 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 18 May 2023 18:25:52 +0200 (CEST)
Date: Thu, 18 May 2023 18:25:49 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [RFC PATCH 1/8] signal: Dequeue SIGKILL even if
 SIGNAL_GROUP_EXIT/group_exec_task is set
Message-ID: <20230518162508.GB20779@redhat.com>
References: <20230518000920.191583-1-michael.christie@oracle.com>
 <20230518000920.191583-2-michael.christie@oracle.com>
 <87ednei9is.fsf@email.froward.int.ebiederm.org>
 <ab7d07ba-5dc3-95c0-aa7c-c2575d03f429@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab7d07ba-5dc3-95c0-aa7c-c2575d03f429@oracle.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, linux@leemhuis.info,
 "Eric W. Biederman" <ebiederm@xmission.com>, stefanha@redhat.com,
 nicolas.dichtel@6wind.com, virtualization@lists.linux-foundation.org,
 torvalds@linux-foundation.org
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

I too do not understand the 1st change in this patch ...

On 05/18, Mike Christie wrote:
>
> In the other patches we do:
>
> if (get_signal(ksig))
> 	start_exit_cleanup_by_stopping_newIO()
> 	flush running IO()
> 	exit()
>
> But to do the flush running IO() part of this I need to wait for it so
> that's why I wanted to be able to dequeue the SIGKILL and clear the
> TIF_SIGPENDING bit.

But get_signal() will do what you need, dequeue SIGKILL and clear SIGPENDING ?

	if ((signal->flags & SIGNAL_GROUP_EXIT) ||
	     signal->group_exec_task) {
		clear_siginfo(&ksig->info);
		ksig->info.si_signo = signr = SIGKILL;
		sigdelset(&current->pending.signal, SIGKILL);

this "dequeues" SIGKILL,

		trace_signal_deliver(SIGKILL, SEND_SIG_NOINFO,
			&sighand->action[SIGKILL - 1]);
		recalc_sigpending();

this clears TIF_SIGPENDING.

> Or I don't need this specifically. In patch 0/8 I said I knew you guys
> would not like it :) If I just have a:
>
> if (fatal_signal())
> 	clear_fatal_signal()

see above...


Well... I think this code is actually wrong if if SIGSTOP is pending and
the task is PF_IO_WORKER, but this is also true for io-threads so we can
discuss this separately.

Oleg.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
