Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113E1A03F3
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:07:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3FD0F204D4;
	Tue,  7 Apr 2020 01:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrtQHBLG-SBe; Tue,  7 Apr 2020 01:07:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 982D8204E4;
	Tue,  7 Apr 2020 01:07:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A2A5C0177;
	Tue,  7 Apr 2020 01:07:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E498BC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CDE62204D4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YY7jCNoOCszp
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 347AA204AE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=cNdhUga6l79Iv5hQm3F55Mxf1s5KD8MiwIph7eYmHGKQkB4x6Lo2iKVBrtb3LC0CBx/4XM
 riowiFEXIRzkotAvWRQZEHbWkGFZQHRyCdg6CExkPEfaEQnQ3LpQzwNaA9knYtCj+6dJKo
 WhAlbphOGsaAgzIbXr9m5EX8ETnykBw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-1ot1Ggz2O5293UHQM8rjJw-1; Mon, 06 Apr 2020 21:07:33 -0400
X-MC-Unique: 1ot1Ggz2O5293UHQM8rjJw-1
Received: by mail-wr1-f69.google.com with SMTP id 88so867401wrq.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=Q3iyh5N8rJj+wm1WUrlKTf8sMc0rgECjTa7FfWZAxQ0vcWUmaeR8nS6i+22Acx8nUi
 /2CjX+fwZf5nub5W+KcFSxFQ7fkMXmzEVonW5I5bAvhNbfDvpYNf1+SC0zi64xzWQAaA
 SddxiKUdyKkxu1fkeMfyvqZSg7C7NZxAVUpCAvMw9nySNAgvtv69OER7TaqZSY+47Jde
 vpPlRPHmyUHwF4I9mo1NkILdyUNfWH9HvO3xR/YrfNThf0valXvSGYYR43Q/vrMmcpBA
 ZaqZaLHq0E/2/qi7jywCzHlODM5oRs4iBPACMk+APb8QB+EwDPhtvARp0qoP1LxTCCak
 pK+g==
X-Gm-Message-State: AGi0PuaCV3aBzrHDKIf6Bib96peF3l2cyYDbhZtELDtpPBenmtryY0Qi
 9f6caTUSWXnRbvt32pcw9aD0zn+W2qFFnN1FQ8JDk+gzjaTrZgnBfu0Q2Q9XQnIRb1Trm7AuzbV
 axau1MiS3aFrsogpreJjRnWLk+BR8kkLe1EQ1tibVNw==
X-Received: by 2002:a5d:4988:: with SMTP id r8mr1994152wrq.248.1586221652056; 
 Mon, 06 Apr 2020 18:07:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJtivYsg0cY33d8RdMzgiJx/R309eSMZK4FZ+i/kU2AyobBthaWz8wAQQB8wP7V80tAuPpK5Q==
X-Received: by 2002:a5d:4988:: with SMTP id r8mr1994141wrq.248.1586221651849; 
 Mon, 06 Apr 2020 18:07:31 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id z17sm18521513wru.39.2020.04.06.18.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:31 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/19] tools/virtio: make asm/barrier.h self contained
Message-ID: <20200407010700.446571-3-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
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
