Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620723CB17
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:43:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CFB312036E;
	Wed,  5 Aug 2020 13:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7FQtw6c9rJrv; Wed,  5 Aug 2020 13:43:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4FD5B20463;
	Wed,  5 Aug 2020 13:43:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 367CEC0053;
	Wed,  5 Aug 2020 13:43:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7F0CC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 95B698445A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oF3y-OLJvN6e
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1B2948443E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HkyF/Dj2YbQk925n8jpSxZl3WTla4XTyR2sv7xNltEE=;
 b=MA5AWL7e1EI4Dg8WRWNo0JaIeHw+e/L9iBlwVP2oFtJOgufwQe6gRpJNdOte4BFQJrw0GZ
 LgCg/6LpsW5jCnUc0IFf6AMmyxXfQoT40uS82dbVPU6uHektQowzB0RXgcO5jQ/LBwTrLS
 VV7TL3tu01VSRyr4PKkUduw3mjjfZRA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-q4zalFAeP6mxfQXnMX4vDQ-1; Wed, 05 Aug 2020 09:43:23 -0400
X-MC-Unique: q4zalFAeP6mxfQXnMX4vDQ-1
Received: by mail-wm1-f71.google.com with SMTP id a5so2739838wmj.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HkyF/Dj2YbQk925n8jpSxZl3WTla4XTyR2sv7xNltEE=;
 b=MGzESETtSGh91H/wnmDaXjHxKwoxfPvuLTt6lyGVumKaZynvpcJIkLcmESGPOb45MH
 k542ljPy1flNa66Q0tDU1Q9YRKEE4ccnoQhZuroVsgs1nz2uW47saaRFT6zhc2W7xpyE
 zObgysVMYK/A0tXvxH5n9Zeeihb8bqR4qhrrw/PgmHU4f6QCLPJKz9HyO7SeqlK3p7CC
 Seb4eWf50afDqKeyuIV52SXv80ptbke21rGdbPLqJV9xTDDiDfaR/t4c9RnQd1SEqeN2
 d3xLTFMHB5NMdPZU1PdJ/ZRapLX4F9XZSkvXUT13n7Jt5lT+muW4UyFvU8TWDjhfjcsa
 CHKQ==
X-Gm-Message-State: AOAM53368VWgzTgofZ2WU4kBxzM4PxKLl9mSaw9sbkkU+kSfSWGzaeXD
 e32663Kj20sQf9OME6cApyqgx6vKiP99NWu8ANg/vW5eD41cKPDnYn9/jGsd90r+AkjBvHzkg32
 /VNA5CZ/8EboHldv6/5AAz1Ji64TYHU2JjDVCVQ/xvw==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr3293481wmh.23.1596635002270;
 Wed, 05 Aug 2020 06:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj0YQv1KBlUtTVuToDSecN05nzWcafaofE4HtyHWiYNZN2DH6Gv3yeUfPj+zB811yd1PZOAA==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr3293465wmh.23.1596635002027;
 Wed, 05 Aug 2020 06:43:22 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id 111sm2849048wrc.53.2020.08.05.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:21 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/38] virtio_ring: sparse warning fixup
Message-ID: <20200805134226.1106164-3-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Cornelia Huck <cohuck@redhat.com>,
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

virtio_store_mb was built with split ring in mind so it accepts
__virtio16 arguments. Packed ring uses __le16 values, so sparse
complains.  It's just a store with some barriers so let's convert it to
a macro, we don't loose too much type safety by doing that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 include/linux/virtio_ring.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 3dc70adfe5f5..b485b13fa50b 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -46,16 +46,15 @@ static inline void virtio_wmb(bool weak_barriers)
 		dma_wmb();
 }
 
-static inline void virtio_store_mb(bool weak_barriers,
-				   __virtio16 *p, __virtio16 v)
-{
-	if (weak_barriers) {
-		virt_store_mb(*p, v);
-	} else {
-		WRITE_ONCE(*p, v);
-		mb();
-	}
-}
+#define virtio_store_mb(weak_barriers, p, v) \
+do { \
+	if (weak_barriers) { \
+		virt_store_mb(*p, v); \
+	} else { \
+		WRITE_ONCE(*p, v); \
+		mb(); \
+	} \
+} while (0) \
 
 struct virtio_device;
 struct virtqueue;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
