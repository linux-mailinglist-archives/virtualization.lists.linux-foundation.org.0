Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290E1A010B
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 00:26:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 19D10233B0;
	Mon,  6 Apr 2020 22:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpNtwdyjOhZp; Mon,  6 Apr 2020 22:26:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5278B23337;
	Mon,  6 Apr 2020 22:26:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B42AC0177;
	Mon,  6 Apr 2020 22:26:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38D14C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2672F86781
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mqu8U5kWWjYi
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E81C886640
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=h1L0q7/e2uivW3f/09H+Wlb49TCIPb2at8/Gav0TObmL9En+2bp9hodBfHCyVd+YQQt91f
 bpOvolsr/M4zIJVA7gPB1huL5txxpl4DCGd2acoX7TvvVHHXMDWUN33FBrCLZ1yevPWLq1
 IalKlm4bll4uRyCEPJI9nuzmF+NE8NY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-haB7zB9QPNeModwa_88Y8A-1; Mon, 06 Apr 2020 18:26:35 -0400
X-MC-Unique: haB7zB9QPNeModwa_88Y8A-1
Received: by mail-wr1-f72.google.com with SMTP id c8so633102wru.20
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FHleMq6gEYUibDa/C/J3JExco78nMtVdL74tcT52HVU=;
 b=rx7IAoIXwQToO6udEvX/W9plr/KGiIxUAoMPyY8SE3VykJNgBW54W8/uSOb73Co3nI
 8F4bF7qb4USN0vfmmhez6G/s1nYfXVhauR4EiSgfVnuH6VA7qAlDl3+l+OATUtXT0TDH
 +4P+Ga7EWG9KZ5uw5mXt77RU4lgwc2oPQHvS/yUYjUiaTyCXsJCBqxIpmdHkwSEENu/R
 Jy7NZmzNqkPZx7kmuFSN1P3Jv5eA0FfSrrD3FmK5WE5jbqzY2udwtAKcqpMvLfk0whwe
 p/UtW2Nd29UGxhGOnYDD7vOKW3kb3KQp3otzEVF4/Vws6CqGPoCFX8pvBtzztKEY0DWT
 ZMwA==
X-Gm-Message-State: AGi0PuZobHDV7u08J0AjOJ645ZdVyS0Tg8oYE48+DwbwfVX+QIuGzsqY
 DMzlIfbErNt+8NwZgPUmfuaUn83TbPnifco1pyNu30gDUXf/Yk0WLgRHFjX2lGiRNu+G7ndVsMO
 R0QsWBrXF/KpRqJqJMyXoYE0tcAQadHj/920Ws+ATJg==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr1383117wrv.97.1586211993720;
 Mon, 06 Apr 2020 15:26:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/VFZ1mv4Of1g8jNAhLYrAOvgnu9l3O0APxfllxbHO3R7GakNZrAOW/S0OBpH2/Vj2EDx6Rw==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr1383108wrv.97.1586211993583;
 Mon, 06 Apr 2020 15:26:33 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id z3sm1162185wma.22.2020.04.06.15.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:26:33 -0700 (PDT)
Date: Mon, 6 Apr 2020 18:26:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/12] tools/virtio: make asm/barrier.h self contained
Message-ID: <20200406222507.281867-3-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
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
