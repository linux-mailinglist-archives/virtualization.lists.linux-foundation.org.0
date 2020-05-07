Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6471C92C3
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 16:58:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A75AA8862F;
	Thu,  7 May 2020 14:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiy1YlxzSlIE; Thu,  7 May 2020 14:58:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 81068886DC;
	Thu,  7 May 2020 14:58:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F37EC0859;
	Thu,  7 May 2020 14:58:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DFCCC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0C0A026428
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrK0jwZzQc-R
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:58:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id 5C22A204E6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:58:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 14AF415C7D92E;
 Thu,  7 May 2020 07:58:07 -0700 (PDT)
Date: Thu, 07 May 2020 07:58:04 -0700 (PDT)
Message-Id: <20200507.075804.1424387208635118.davem@davemloft.net>
To: mst@redhat.com
Subject: Re: [PATCH v2] virtio_net: fix lockdep warning on 32 bit
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200507072525.355222-1-mst@redhat.com>
References: <20200507072525.355222-1-mst@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 07 May 2020 07:58:07 -0700 (PDT)
Cc: eric.dumazet@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 tglx@linutronix.de
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

From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 7 May 2020 03:25:56 -0400

> When we fill up a receive VQ, try_fill_recv currently tries to count
> kicks using a 64 bit stats counter. Turns out, on a 32 bit kernel that
> uses a seqcount. sequence counts are "lock" constructs where you need to
> make sure that writers are serialized.
> 
> In turn, this means that we mustn't run two try_fill_recv concurrently.
> Which of course we don't. We do run try_fill_recv sometimes from a
> softirq napi context, and sometimes from a fully preemptible context,
> but the later always runs with napi disabled.
> 
> However, when it comes to the seqcount, lockdep is trying to enforce the
> rule that the same lock isn't accessed from preemptible and softirq
> context - it doesn't know about napi being enabled/disabled. This causes
> a false-positive warning:
> 
> WARNING: inconsistent lock state
> ...
> inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
> 
> As a work around, shut down the warning by switching
> to u64_stats_update_begin_irqsave - that works by disabling
> interrupts on 32 bit only, is a NOP on 64 bit.
> 
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Suggested-by: Eric Dumazet <eric.dumazet@gmail.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Applied and queued up for -stable, thanks Michael.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
