Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 860AE213510
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 09:35:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B11932639E;
	Fri,  3 Jul 2020 07:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeDcKwiz8kXj; Fri,  3 Jul 2020 07:35:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6F88425043;
	Fri,  3 Jul 2020 07:35:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54D40C0895;
	Fri,  3 Jul 2020 07:35:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1C5AC088E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C05C987D70
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id daUe3t9PO72F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 33EB487D6F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:34 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b16so13623542pfi.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 00:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=LPJ9kOrR/DVOvIvwHOyv2EvxvH2mWm1cTxw9pMagbdFf9Yf/o5YqVhwLZxlm4zMzB0
 BupvO34NgK3WU5FusVXN3LG1KZEmguQH+5WTUWXoEsEr0RjWXGLP0Ixc8TEqeeT6lVZN
 WsPOzbDKE4F33Gwek0i4ekNv+nVM6tYRDmjW4ojHXc4ANZghx4n39tGew1CqNAPQKTMw
 YLAag0hi/6/ZIqQRe4jaFochEOd0Hjq4hDBYBwaui6RvinZrC2mtHhJfIZ/yrLu1gwor
 mCQwkmxixNVC8IyJn8QQbryDYT5OUMEzfJcaRC7zrD+8ntI7y8IhZGKDc/ADG9oGWhN1
 1vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=S5HV9xKhtOaz2DN5HCMC5K3q8M9FBX66EYp4kcorhioJAeeGUWtwgVD1EqGPht4Qt8
 rymH48FEvUPN1fxx/ZRS458oZ0DpqzWstbo/6tgCEuLKnLIG17FRi+lvxnVLi8GcOCQS
 KDBIlN+RATGwADnMeRAgaSM0Vz5jHvZcllDGUbonGmSwiMhZYsJxEsmbpJkTNwHHNLss
 3EkD1NV/UZtXiy+P+GcHra+/qCKnLafwnh7BYTwvtXyF8oBz+2G0Wofs38KQEj9H1EZP
 jWzYBGFgCIISaWNzeHT2PHGZpwtKiVCG96TlnwNdOd6pEsHbW5gXMCdNhKtm7FMdhyZQ
 zpGQ==
X-Gm-Message-State: AOAM5334iZt673vGP2NHqhb5bMwmkVOjdjL8T0DixsThTatfESKT/+3b
 nBQcEq7WAPqKig67JAKe9IA=
X-Google-Smtp-Source: ABdhPJxSb50XzIXPJCZ5aFL/fPOkGNSVYnLGWYBsj4lJ5hpdQfsLdm3sGDjF2UwCTSWxhcuQ8/5rHw==
X-Received: by 2002:a63:b06:: with SMTP id 6mr27000920pgl.116.1593761733846;
 Fri, 03 Jul 2020 00:35:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id y7sm10218499pgk.93.2020.07.03.00.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:35:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH v2 1/6] powerpc/powernv: must include hvcall.h to get PAPR
 defines
Date: Fri,  3 Jul 2020 17:35:11 +1000
Message-Id: <20200703073516.1354108-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200703073516.1354108-1-npiggin@gmail.com>
References: <20200703073516.1354108-1-npiggin@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, Will Deacon <will@kernel.org>
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

An include goes away in future patches which breaks compilation
without this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index f923359d8afc..8eba6ece7808 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -15,6 +15,7 @@
 
 #include <asm/iommu.h>
 #include <asm/tce.h>
+#include <asm/hvcall.h> /* share error returns with PAPR */
 #include "pci.h"
 
 unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb)
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
