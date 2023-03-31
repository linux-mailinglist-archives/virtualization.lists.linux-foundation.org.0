Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 465996D1938
	for <lists.virtualization@lfdr.de>; Fri, 31 Mar 2023 10:02:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3036844C7;
	Fri, 31 Mar 2023 08:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3036844C7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cw2nzRx7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X00GgWJpqcWw; Fri, 31 Mar 2023 08:02:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 778FF844C4;
	Fri, 31 Mar 2023 08:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778FF844C4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E33D5C0036;
	Fri, 31 Mar 2023 08:02:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7292C002F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2EFD41FAF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2EFD41FAF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cw2nzRx7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjRHkyNWEhVd
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:02:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0948D42017
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0948D42017
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680249734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z1bhGoNJZMSwcpQc6yTvdcUKf3R+huOZ4zfMlXF6R1k=;
 b=Cw2nzRx7FY3shFJ/RB2G1jCYZEBnizP2kJWyoqXyXQnxnMPGnwAH7VvK0elX3PjHkVan3q
 v8725+m2sZzIa8XU0FJMVc/XWFqN1YQVPnErIGFhQ6aEFBf+vKDP7KcQMJQ48ad7Ej4zgp
 v8ehiZFEB/rs6wlJEowsEAGuY+b52mc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-CDP7BzmkO5CdqAr-Krd-7Q-1; Fri, 31 Mar 2023 04:02:12 -0400
X-MC-Unique: CDP7BzmkO5CdqAr-Krd-7Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so30816332edf.16
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 01:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680249731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z1bhGoNJZMSwcpQc6yTvdcUKf3R+huOZ4zfMlXF6R1k=;
 b=Xk65je46lhCpTiyoRlC5N0nqCtLN1Dx+IPfwdrlKtjNmxUG7ASUmKFvRpEfVljlfhJ
 /+F9Wpq4eOGO8gZ8xmSLQtqG27Sc8W1WJRjj72E4FSqs/jfr6WDvVOrCKA8pw8ICX6Ra
 I/0vsuthOrqJLsIsIpRawZs/YQPcBkSk3HEX3N0JWrHoBIlVNbbYmZmqEXxfk7GvB2A0
 PiFU1xMfUtANftLdHUWnPj2DLPA8JQOc/kBi0rAPl1NvTeOForXgGtm3+Nr5mTE/EgHk
 S4sHP+HPfdV/71ykBxZuNBt2yVsMWJTH+xGffiBHrFhsUHPwCp3tkFzTo2TmqW9hd5kQ
 En+g==
X-Gm-Message-State: AAQBX9e+4rhnbhK/M7Yy7CkGoVmxODx6DQhEonVM6IxfrFN3OVWR5BKz
 vKkwbL7GjsnusllIZycy1Ov8tPkzT+oe/u9GwL9oWI9DYiA0fvklSviZ//qfSVE8hK9Axn7Scnu
 LZvSO091a+nGOAsScVuD2sChJfJdg7rtVvujVgxJPj6/UG0OfFvCD2m7ax9RXgDAyouV8proIHt
 yocmwuEwzNJxfVFnOjN8AgKgm7jA==
X-Received: by 2002:a17:906:3a83:b0:932:9502:4fd1 with SMTP id
 y3-20020a1709063a8300b0093295024fd1mr25804908ejd.43.1680249730900; 
 Fri, 31 Mar 2023 01:02:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YmxPDA5UW4cP8XQymOxzi1zIV1vQp/Pm9MW2epeKgfsHTsDIGjBuy3IHnIuIOwTawke5i8Zg==
X-Received: by 2002:a17:906:3a83:b0:932:9502:4fd1 with SMTP id
 y3-20020a1709063a8300b0093295024fd1mr25804873ejd.43.1680249730456; 
 Fri, 31 Mar 2023 01:02:10 -0700 (PDT)
Received: from step1.home (host-82-57-51-130.retail.telecomitalia.it.
 [82.57.51.130]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170906498600b009321cd80fdfsm689029eju.158.2023.03.31.01.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 01:02:09 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] vringh: fix typos in the vringh_init_* documentation
Date: Fri, 31 Mar 2023 10:02:08 +0200
Message-Id: <20230331080208.17002-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Simon Horman <simon.horman@corigine.com>
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

Replace `userpace` with `userspace`.

Cc: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vringh.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index a1e27da54481..694462ba3242 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -636,9 +636,9 @@ static inline int xfer_to_user(const struct vringh *vrh,
  * @features: the feature bits for this ring.
  * @num: the number of elements.
  * @weak_barriers: true if we only need memory barriers, not I/O.
- * @desc: the userpace descriptor pointer.
- * @avail: the userpace avail pointer.
- * @used: the userpace used pointer.
+ * @desc: the userspace descriptor pointer.
+ * @avail: the userspace avail pointer.
+ * @used: the userspace used pointer.
  *
  * Returns an error if num is invalid: you should check pointers
  * yourself!
@@ -911,9 +911,9 @@ static inline int kern_xfer(const struct vringh *vrh, void *dst,
  * @features: the feature bits for this ring.
  * @num: the number of elements.
  * @weak_barriers: true if we only need memory barriers, not I/O.
- * @desc: the userpace descriptor pointer.
- * @avail: the userpace avail pointer.
- * @used: the userpace used pointer.
+ * @desc: the userspace descriptor pointer.
+ * @avail: the userspace avail pointer.
+ * @used: the userspace used pointer.
  *
  * Returns an error if num is invalid.
  */
@@ -1306,9 +1306,9 @@ static inline int putused_iotlb(const struct vringh *vrh,
  * @features: the feature bits for this ring.
  * @num: the number of elements.
  * @weak_barriers: true if we only need memory barriers, not I/O.
- * @desc: the userpace descriptor pointer.
- * @avail: the userpace avail pointer.
- * @used: the userpace used pointer.
+ * @desc: the userspace descriptor pointer.
+ * @avail: the userspace avail pointer.
+ * @used: the userspace used pointer.
  *
  * Returns an error if num is invalid.
  */
-- 
2.39.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
