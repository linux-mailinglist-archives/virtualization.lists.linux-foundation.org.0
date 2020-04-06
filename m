Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA11A003A
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:35:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C18E8829B;
	Mon,  6 Apr 2020 21:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dyw2vAmPI+9E; Mon,  6 Apr 2020 21:35:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C07B88268;
	Mon,  6 Apr 2020 21:35:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 140A6C0177;
	Mon,  6 Apr 2020 21:35:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D50CDC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C3AAE8829B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ISC6VVenL+n
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 44DA288268
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=JPiBpDqpP/6BvFxIU9fGZvo1+ZX9IEoRIv8CzMhq9n0tx1DtuKGxnsJiz8JLvKuxQNAff6
 NqVE8GAbf68HVU2mz+TMl7dZNoZ6Knn7ZA4x9X9lV+C1pmNJC2+djDpaxxSa/80qg453/H
 4mD5uqzhhkG8Ip4pnQHKGXex1D3aokY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-rX3QxwgzNbewQI4nJvZ5vg-1; Mon, 06 Apr 2020 17:34:59 -0400
X-MC-Unique: rX3QxwgzNbewQI4nJvZ5vg-1
Received: by mail-wr1-f69.google.com with SMTP id d4so576148wrq.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=mCr+1oNTcjKLWgixzEuxl9V747eo0OLAiX08YGpnDe4BNz+zve/W609uqRZv1gcFUA
 aS/WZUZ6+8ptnYK0cs5wM8iGegwS3YrtsJV9HuaPOZtjEwFOY2TyTDqRme+/TloXK+Ht
 4mINeNevs6F8XYg1NS3qZ9psiVgilHyBL6uxAD8gor8kJDkgtRQLGiHSm27enXcRTuWG
 LFU6LSIRfwnlt2EAJEz4AhtBRP5JGaz2kU23MAhg68/pUZeGhOiv/lUWIOEgedl299fZ
 tklJ0yxW4mphCxefVkUJCeLdqWsb/yZQvSgFYJEeMAWkoioIsY+TPkmp3x0bC0SZ3T4E
 z7cQ==
X-Gm-Message-State: AGi0PubEmB8YrpFepHqn1LTEuzJPVjmBTy9cLyvammsv/i3FxkQ7P7Qr
 srSzU+dYfJGW6DLQ3LNscs54aplQIS3VKiMkZh9YDiD+DxDYvE7bZbvOhORrcOPWAY4b+7Pw049
 7nCjnPyJc0YHW4zZJQNHCKZ/djEc5B2kQLJkWIrps/g==
X-Received: by 2002:adf:f44f:: with SMTP id f15mr303362wrp.270.1586208898146; 
 Mon, 06 Apr 2020 14:34:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypI159ebnTiToQl1tzfpeqQgmH/T1ywBqyQKWOkNaclvA52w3xCI0JwwcGElWapEFXMTsHQeSA==
X-Received: by 2002:adf:f44f:: with SMTP id f15mr303354wrp.270.1586208898000; 
 Mon, 06 Apr 2020 14:34:58 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id j11sm27996776wrt.14.2020.04.06.14.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:57 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/12] tools/virtio: make asm/barrier.h self contained
Message-ID: <20200406213314.248038-3-mst@redhat.com>
References: <20200406213314.248038-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406213314.248038-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

We are using abort() so let's include stdlib.h

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tools/virtio/asm/barrier.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtio/asm/barrier.h b/tools/virtio/asm/barrier.h
index d0351f83aebe..04d563fc9b95 100644
--- a/tools/virtio/asm/barrier.h
+++ b/tools/virtio/asm/barrier.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#include <stdlib.h>
 #if defined(__i386__) || defined(__x86_64__)
 #define barrier() asm volatile("" ::: "memory")
 #define virt_mb() __sync_synchronize()
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
