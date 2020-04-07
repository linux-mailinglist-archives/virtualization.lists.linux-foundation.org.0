Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7872A1A043D
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:16:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 23E0385BCF;
	Tue,  7 Apr 2020 01:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAwBcViWDv6s; Tue,  7 Apr 2020 01:16:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A5C5857D8;
	Tue,  7 Apr 2020 01:16:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90590C0177;
	Tue,  7 Apr 2020 01:16:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D6FFC1AE2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5E12E885E4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9XVT8HZ4W65
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CF642862B2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=aZSBfZiaSx0UpBpgRp0p/ht9Fwm0PusPo5WmvDsd7fjbjMOkMIhks1C3PLXFKKOuIaLpgB
 SgJfWUp6JjmbLDvQy6VWC+oUhyhQHxI1uk1dIIc2W5A9F/ILx41paHXjDBqXR1E0qccpA+
 U3FYxKCo7ul0+/R50sc0e2Q3DS8z11w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-9tdoen72O22HkOCuYXTprg-1; Mon, 06 Apr 2020 21:16:33 -0400
X-MC-Unique: 9tdoen72O22HkOCuYXTprg-1
Received: by mail-wr1-f72.google.com with SMTP id t13so874724wru.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=q+3i6GxOXB+jq1/jCRFJl3wrKq++/Ej80y++5Kw2I4vHcILtxfD9TA57zx/KtHxb/+
 iEWTFJ0rTcXwaKOO0z1RVGJou0870OsK4u+5omrCpxQFnSQWNWqtDxI1N5ZN6i8UL2Rc
 cjVo42s40dz1dwWQ3Y5th9KI25wptzk9GT/Rd1FSeOYTMBmNQtVWWhlo4E9+V1gBwgnB
 7Avu3Bxld5GI1+fIw8qXrHOadqDCCX9ReoOw/mlO1khgfH6xfmQeW8Q8Xz5fnG4P4SmE
 9IedVnRmKdmI/A3bd9jfgjfteKqrR39CoO7JvMPAffY04RGQzjPddHcmyEk372p/7n+f
 JP/Q==
X-Gm-Message-State: AGi0PuZN5w5+ur6Jo460QeuJKemteTf3QB8o5T8lidj812mB3BRYp/At
 lyz+hsMPG8l7FkgZYmsAPjufk1gNe4fl2mWkWL/Rm2BqSsasrOTLJTq7yQ5yvVVznffnQ+OhoOk
 EBRpLy2A8Akp8V2dOCqgD1ljpgojpDiaEp7hVsoUy8Q==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr2027880wrc.312.1586222192874; 
 Mon, 06 Apr 2020 18:16:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypI+JWtf7YPshaBQuWRec595zsX+nH2Kk4ZsLkTya0YF6KR2uoObNvntVD6J8RdRBlhJdc93fg==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr2027870wrc.312.1586222192735; 
 Mon, 06 Apr 2020 18:16:32 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id t16sm29828757wra.17.2020.04.06.18.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:32 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 02/19] tools/virtio: make asm/barrier.h self contained
Message-ID: <20200407011612.478226-3-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
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
