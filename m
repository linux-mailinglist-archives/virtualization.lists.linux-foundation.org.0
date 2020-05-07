Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA521C8367
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 09:26:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D590B85F5C;
	Thu,  7 May 2020 07:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_N37jthxKMc; Thu,  7 May 2020 07:26:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B3AF85F4D;
	Thu,  7 May 2020 07:26:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 404E9C07FF;
	Thu,  7 May 2020 07:26:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65FD1C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 07:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41CCF2078D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 07:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fPePZ6DAcVr
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 07:26:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 4E985203A2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588836362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MNb3P1C6nMcjTzE7KOYMh3f2/+8YEUojREhYLpZKIq8=;
 b=TlMmaSzlTVXqSjyVpNHFNC2I7JHK2Qv8j+I0rET8FGF+tR+m61lCrnU3n0WDNBZa/YyCyQ
 v8ssbTzlsbBtY9KAnu7i0lDdoPTCWr10eiM+Ye7nWpuw7ZLqWSY+Z43L8IxtTne8iAfjUU
 yPaN5jChX3I1ciTY4tzCSH3V6+1EoN0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-b6KD_F3MN9eQe6cUvAFO8w-1; Thu, 07 May 2020 03:26:00 -0400
X-MC-Unique: b6KD_F3MN9eQe6cUvAFO8w-1
Received: by mail-wm1-f71.google.com with SMTP id t62so2826159wma.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 00:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=MNb3P1C6nMcjTzE7KOYMh3f2/+8YEUojREhYLpZKIq8=;
 b=Qv9t3hgqWpJSFMEr5E0yR0TZhSVojvcXznryjuo3UZEWDlwBxd815lNVNmn6V9iPWv
 V7jNwf/8fcPKtZgqyuzDMhgTblFKJxbwxnipGA/zPEHhxy0dJeVJzl3WIRp36hvSonTA
 sVvnNnYT5QxwgBa2l75bxh8YWaLcqP+h2ctzWaElQuGhPPLIhhQZBfd5PTs3s20TWHhG
 4lzAz0KmhpyukvuESf6jm2lnUua5sM60eRKUjAcBFKK9Jg5LWsZNRDfEGrvFx0GDgcI9
 La1F9BiXKFeLHhA2j7n2D4VYoG/0bTdwPZ0cEtFpW5n7dT1kFFI1+14unfOS995OlhOn
 GF7A==
X-Gm-Message-State: AGi0Pua1fX1qNV88U9j0L2wvO4AU+HabuPubIqcDluGDtXYQAdM09fX7
 3Wtldj6WmNXcSX8KU/noTuCaW/59NyIOvRq0oF31hLLGeDkI7XJZP+BBjaYH1huVXZNSm3tn+8N
 5B9R4WHYFgZKt6GwW99r4I9br/H8UhvCUMcRP1UiABg==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr3446591wrn.69.1588836359016; 
 Thu, 07 May 2020 00:25:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypK3v4r+fkltKyHrOlH+oryMeYYEXo3bj8rv8XDyVYT7v3qL9oDVeAXDdb2dOeLpaZveqKy4Yg==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr3446572wrn.69.1588836358811; 
 Thu, 07 May 2020 00:25:58 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 s18sm7318969wra.94.2020.05.07.00.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 00:25:58 -0700 (PDT)
Date: Thu, 7 May 2020 03:25:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio_net: fix lockdep warning on 32 bit
Message-ID: <20200507072525.355222-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
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

When we fill up a receive VQ, try_fill_recv currently tries to count
kicks using a 64 bit stats counter. Turns out, on a 32 bit kernel that
uses a seqcount. sequence counts are "lock" constructs where you need to
make sure that writers are serialized.

In turn, this means that we mustn't run two try_fill_recv concurrently.
Which of course we don't. We do run try_fill_recv sometimes from a
softirq napi context, and sometimes from a fully preemptible context,
but the later always runs with napi disabled.

However, when it comes to the seqcount, lockdep is trying to enforce the
rule that the same lock isn't accessed from preemptible and softirq
context - it doesn't know about napi being enabled/disabled. This causes
a false-positive warning:

WARNING: inconsistent lock state
...
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.

As a work around, shut down the warning by switching
to u64_stats_update_begin_irqsave - that works by disabling
interrupts on 32 bit only, is a NOP on 64 bit.

Reported-by: Thomas Gleixner <tglx@linutronix.de>
Suggested-by: Eric Dumazet <eric.dumazet@gmail.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes from v1:
	builds now. lightly tested

 drivers/net/virtio_net.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 11f722460513..ce07f52d89e7 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1243,9 +1243,11 @@ static bool try_fill_recv(struct virtnet_info *vi, struct receive_queue *rq,
 			break;
 	} while (rq->vq->num_free);
 	if (virtqueue_kick_prepare(rq->vq) && virtqueue_notify(rq->vq)) {
-		u64_stats_update_begin(&rq->stats.syncp);
+		unsigned long flags;
+
+		flags = u64_stats_update_begin_irqsave(&rq->stats.syncp);
 		rq->stats.kicks++;
-		u64_stats_update_end(&rq->stats.syncp);
+		u64_stats_update_end_irqrestore(&rq->stats.syncp, flags);
 	}
 
 	return !oom;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
