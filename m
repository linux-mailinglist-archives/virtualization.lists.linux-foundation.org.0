Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF374211D5A
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 09:49:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 645928B195;
	Thu,  2 Jul 2020 07:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dhfmypp53MXi; Thu,  2 Jul 2020 07:49:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D0518B196;
	Thu,  2 Jul 2020 07:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43D85C0733;
	Thu,  2 Jul 2020 07:49:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2408EC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0AC90265B2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NIPkKAXloX8e
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:48:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 788662655A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:48:59 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id k71so8583604pje.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 00:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=n2X2tl2t1Z2jMbL8ftjNC8UfbtwIZAGcSuTp5qN1FvmOYuwgjX5KnJtALwmUyd5wHW
 HuWBDqPjKQ3jhWx7H0ve063UAbqIvU5T7BGPTxwObqeD3U77dQibTYtK7uFzOozjPGfj
 bqB8JF4dxa4GjyuRRMYu5EMlwn3xeK0QOSdBMDCvw8FDXDVxaVEpDX8z3F6bD427EoFk
 NGrFGc4CXku52XHrp65RvqF6vcc9sga6E2Jes0IIyw6uUSeZxHAJK37keYVe0X3ky8Ft
 4wfJ8U29IEzSKtDV/aWIswgU/itkss0JJydb1Xz5o6YooNXTyY/jjqd8bfdVUb1nuhum
 iHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=FZkfH2DQt0at4TdTixZQx1UBuHIPTVv3F6l3RNPLQNPTs5+MKdixIVlV1KyOCuXsuU
 j6x8QnhAg6KlXaB7k1kHM0O2z8c0jG3xqQrnndXU/bW+zLKnpuxpxt0PSSvSKYwvm1gh
 TsU4klSfjbfl1kcnwYwGWuRey68xQVcVa+wwxooLQLuQEcD1aED93fFt4Yphj45ENgrV
 UjhZJgzZJuoSizc0ezEwobFWlLn15nzzwAA/BmiTKSENcXnjTZqpHogiw3ZOSC4RNSXc
 t7f6DsPhtWkseJvD7hxenP2Fw8+OjLWdafX7ncXjCBEdtea5S9gLO2y+gxCp+23ljWSE
 fE6Q==
X-Gm-Message-State: AOAM5309LlnchYU6vzuTP5sqQouFYyUCPohwViYnrzCyZ79zq28rZWcO
 +dGQBDDVQdwMLccw/7Xcy2s=
X-Google-Smtp-Source: ABdhPJyrX8ZqLoSxDfScS/c0oudlkWwFEh6ZwhILTvmdjNw4QT7UUZQ1EYJPbV20RtW1fhoz7YmYKg==
X-Received: by 2002:a17:902:b205:: with SMTP id
 t5mr13521549plr.7.1593676139118; 
 Thu, 02 Jul 2020 00:48:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 1/8] powerpc/powernv: must include hvcall.h to get PAPR defines
Date: Thu,  2 Jul 2020 17:48:32 +1000
Message-Id: <20200702074839.1057733-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200702074839.1057733-1-npiggin@gmail.com>
References: <20200702074839.1057733-1-npiggin@gmail.com>
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
