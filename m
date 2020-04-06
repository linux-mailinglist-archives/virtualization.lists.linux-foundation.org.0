Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1719FFC1
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D424E86472;
	Mon,  6 Apr 2020 21:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOGdrxHUG4E5; Mon,  6 Apr 2020 21:02:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 08B5C86407;
	Mon,  6 Apr 2020 21:02:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E30BAC0177;
	Mon,  6 Apr 2020 21:01:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53D22C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4091E20023
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuF2a3Xl9vkm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 2E3D52000F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=JBipwPfXuCH2xO2tN1EL/SvMK5EQEYM+Bhn10vKm+o+E8EaIQzRt0r35Zy4dkBCfcgzYxk
 IFz6N/8LlF8Pd6hYylphNRw47CCrY+80fJp7Yv6jbU08Ttk0t6XPznkrHShbQBKyf5LpHf
 HhrqkdYwfOxQBVbVl64YEiWo53rwQY8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ZWlpcPKzP0aZru3BNPRZiw-1; Mon, 06 Apr 2020 17:01:53 -0400
X-MC-Unique: ZWlpcPKzP0aZru3BNPRZiw-1
Received: by mail-wr1-f72.google.com with SMTP id h14so524718wrr.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=LWzi/JAkEaoxSrGSPkpIc3IixFccwmDYJpghaehtMADQKD7B9nEx2oQUW9iJSreaPB
 Rmpynx1U0ioptRB/IKxsS/5kRZy0YBRClsx+ER9ApjFfZHF6RFHTCJg+ezwOg4VyxN4W
 fNO0D8inZAgrtTSnrPNrmhV+f3YsRGNq9Yjl0Qqt8hXsGuR3RKP716Nw8DPf4d7P105J
 AULovKLppoY+VULq0qtcpowvvlonR8i2t1ek8AvQhma0ezzxUnWeI9TxFxofxZ1XYjSA
 9odptdIpc3UKHiduKFfxmeKC+bTsYAOox7maeei8YNQzI2qNP/kJEuAccu5s5oxYUmuz
 EOPQ==
X-Gm-Message-State: AGi0PuZeXf07S6stjR81TQDx3hih/GQuXFZA1FVIZlh1AVZgMM74Swv4
 SsBFWVoV4yucp3ZLDhj6D8TR9r+779GHnuQLJA9c4WC2IyJfoLzN2xHN8Fxq/9pVsv3wCHlwsEE
 gsILPQ6hmPwz8UPWzIZh3AM3WJa/2AXSrxzOM+45wWA==
X-Received: by 2002:adf:828f:: with SMTP id 15mr1162191wrc.59.1586206912166;
 Mon, 06 Apr 2020 14:01:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ26JCMTvoHOJS339prjMyie7WY4xBIXnYpqwkeSr+H09nCHLrKn/QkamrIw58/gMEebn7Ylg==
X-Received: by 2002:adf:828f:: with SMTP id 15mr1162175wrc.59.1586206912009;
 Mon, 06 Apr 2020 14:01:52 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id q9sm10447252wrp.61.2020.04.06.14.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:01:51 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:01:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/12] tools/virtio: make asm/barrier.h self contained
Message-ID: <20200406210108.148131-3-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
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
