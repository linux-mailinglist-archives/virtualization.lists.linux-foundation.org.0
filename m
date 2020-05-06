Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 328521C64B9
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 02:01:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6DA6878D0;
	Wed,  6 May 2020 00:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkc47lb42SQa; Wed,  6 May 2020 00:01:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03CBB878BC;
	Wed,  6 May 2020 00:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCF47C0859;
	Wed,  6 May 2020 00:01:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0952BC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F2B6686CE7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t99l5JDfFm90
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:01:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 180B786CDB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588723296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=uPy7LWjiZV38WzP4ia9r6qbCDanZ9+7jGEAYy844X1w=;
 b=VlfY3VSB+yU7MrhrErllB4x2dQZedCoCI4yxeH1J0855cOcq8tLrLUwI9+qIuNxKpqPfrK
 iz3snfPdr+uBH5MRVPaJh1hGbIPhhjq3m6+c0cQz9EyRpUSbajm2aQYTNyZ2GvzwVN3a+h
 BXDioIVv281GCzxPzqbRE1oBAdLpJVU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-ZS0hVC-DPSar0pUM087Xnw-1; Tue, 05 May 2020 20:01:35 -0400
X-MC-Unique: ZS0hVC-DPSar0pUM087Xnw-1
Received: by mail-wr1-f71.google.com with SMTP id u4so278359wrm.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 05 May 2020 17:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=uPy7LWjiZV38WzP4ia9r6qbCDanZ9+7jGEAYy844X1w=;
 b=k399k+1jF0FWKQ+huY3dA4JHW5n6G5L2xerZMP/UP1QctMdlrQaqhuz1xAKdnyoFda
 cDyZlCMcEhbhDil471jeHEff5C0uxOs4vpZluniu6hF36xScajLvgmK9LTbwptk5sT9P
 TVyO7/fmuFOJwkBiANs0buv3ltMd0uUg+ciyFVSWdaAeEww96DtsLmEGHWMVJo01nAdH
 IaJ9tL8muG06ORezwHJGVy6cNr1wz3rwvKzzrRsyUxQ4dLtlVxHDbPKNmyxY0YG539Nb
 HxcEhnt2b9+5Pi/c91RFASV4Tm9yryn/Zgy3GTjPcAYJHqw8GimdHOnVy77noMlom9S7
 uvZA==
X-Gm-Message-State: AGi0PuZC9dxN2439JBebx4bSqMzwgGsLk4VU36tRAY0gtEJ9GhqNRSDh
 ABKoHuIKAG/We+deEwvAgJkXp73hQirmZe/B3gub/ftLXbxgFLHfXGXS1j1iK2m/tGblNSnEg8o
 hRS9txcklZ2TSlUR8eI62hC01BxtqtmZfZveRCk6Mhg==
X-Received: by 2002:a1c:668a:: with SMTP id a132mr1374908wmc.46.1588723293808; 
 Tue, 05 May 2020 17:01:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ8RYGHvYZzJ/QpEX2WdgeFSAVsMNA2jw0S7Y/1PxVtp3/Bj3PJc6VuKrGHjyReVPI+0wkbBw==
X-Received: by 2002:a1c:668a:: with SMTP id a132mr1374894wmc.46.1588723293612; 
 Tue, 05 May 2020 17:01:33 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id n7sm447wrm.86.2020.05.05.17.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 17:01:32 -0700 (PDT)
Date: Tue, 5 May 2020 20:01:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_net: fix lockdep warning on 32 bit
Message-ID: <20200506000006.196646-1-mst@redhat.com>
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
Which of course we don't. We do run try_fill_recv sometimes from a fully
preemptible context and sometimes from a softirq (napi) context.

However, when it comes to the seqcount, lockdep is trying to enforce
the rule that the same lock isn't accessed from preemptible
and softirq context. This causes a false-positive warning:

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

I'm not thrilled about this but this seems the best we can do for now.

Completely untested.


Thomas, can you pls let me know the config I need to trigger the warning
in question?


 drivers/net/virtio_net.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 6594aab4910e..95393b61187f 100644
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
+		u64_stats_update_end_irqrestore(&rq->stats.syncp);
 	}
 
 	return !oom;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
