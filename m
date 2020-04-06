Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E11A0031
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6EF3787C5F;
	Mon,  6 Apr 2020 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OR8XPolzqfA; Mon,  6 Apr 2020 21:34:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBBF987C4A;
	Mon,  6 Apr 2020 21:34:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CED72C0177;
	Mon,  6 Apr 2020 21:34:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2A2EC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CF3B686640
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TC2bHpWB7BCf
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3EB9286472
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=SSoI0PW4Ek3UStnp99RWIpRI5I84sKSvZQQ1Wa/5sBgf48ZIra85HP2YQPIv5F5/qitomM
 3ZusEn70td3wa1uNRKT8PNjq2zNbpfoRYvUcXa68LxXjvFuAMTXjQp+3nGTs+OTm3h8hAu
 UmuFp39oDyJP2gE+nlIt66nND/l6mtI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-jfYDnvRQPBi7F8eJSHLxrg-1; Mon, 06 Apr 2020 17:34:33 -0400
X-MC-Unique: jfYDnvRQPBi7F8eJSHLxrg-1
Received: by mail-wm1-f70.google.com with SMTP id a4so415306wmb.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=qOyZRDTD5MZQ5kpl92gN5KE/RDOkSq7HS3Rb3OtvtNEAaBOQHdAGChSaF7oWpczKHG
 zWIg8HavYd0ZfVvI3LihMuqzgylEAc8lKuJYZt8CRA+hBDICjLFv92yZHpOgRJ9s8R9O
 BmY72I6Kqx6xp5v8c+MNldoBZktvK1W5ir4SyrVA1GUKRJZuDYJltxaQhWTZBXkPIRma
 ifaziHDyhxCxoDHL2onis43Kh/ghzAmgcIJ3J8cg3gcy/+bDZ5cQq0MVEo1CFEFW9bmI
 QAEEiSAXe9iwtrQOxUCPD6OhYCHe7HCfVQZdf8Mwf2C9raPAqSyvO0mQPhhYZyi0i7CV
 XvUA==
X-Gm-Message-State: AGi0Pub39a5n++7Lm6NoS/F9BupeyBN8VUFO4BJddd0J5fXGVmnu9pvc
 QtHg6sdmswRCa6wF+5XY9HBSy6pp7p3OZOqV5t7BPHQa7h/ukIi+hpmY0owj+0kHKAj7NUhC7e3
 5zWgKaJsr3Z4RdDUkeai7dDZeDKG9akwg0QjAHG5dnA==
X-Received: by 2002:a1c:4805:: with SMTP id v5mr1344527wma.98.1586208870530;
 Mon, 06 Apr 2020 14:34:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypIPZi3gtX7Pt/4KiWWhtz117je7cNyTelzpyCcElCBiIj7ZMXAYdNZGgah2e+dZblNCDgVHrQ==
X-Received: by 2002:a1c:4805:: with SMTP id v5mr1344514wma.98.1586208870379;
 Mon, 06 Apr 2020 14:34:30 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id o9sm27494529wrx.48.2020.04.06.14.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:29 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:28 -0400
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
