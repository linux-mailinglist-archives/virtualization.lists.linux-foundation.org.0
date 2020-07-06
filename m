Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DDA2151B4
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 06:36:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A81768765A;
	Mon,  6 Jul 2020 04:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNHxzNy5sMaZ; Mon,  6 Jul 2020 04:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2663387648;
	Mon,  6 Jul 2020 04:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10DB0C08A8;
	Mon,  6 Jul 2020 04:36:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98AE2C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9448C87648
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6k7Lv5U1frBs
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C0EFA87601
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:35:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so39295216wrs.11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jul 2020 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=r0qcJkYVBFZ2S/jjHBZPVsifAxriF1l6iC8Ws0UsFZny73sUoKEE9CqbKDZno2z2QG
 lg6fKKT35QjJ1DLpp/JSMynDpogNIz+CCh26h60gza9Fn1XW1CPzO+duWz9PPxscS0Eb
 vw4OkSGUhtsi9uUYSZAVD0Fm71aRBdhL8TFksRO07dbOCZi7jwsZyHvumnn9UThLXS9F
 dhx26XZ2iJKpywfeIYj1DPc5gbdIv/pGsjQv1hoszdSJ84ULU/6Xa6kzr6ZEJR5nC2WH
 o0n7Cdw948tbLx+ElRVsC7tDSY3LK4R/8XPNEvq0RVIBeixVmu5oTXl8wkLrUOXbpkxi
 /JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=D4uNWEjxxZiLxBwZ137OhV0s9IoDoHvnVDbIaqfISafSMfiR/Dt4TJtIijpG95nsWi
 S8BAF3/k3AWwEflh71i0xdbS0McDynXofnxVuDRg9e+b7P83SQrMQn4LvvCwyDYxBkVc
 Vo9ERk3ECuFFChhtaMYBad4Hz1ypB4IuECqwATK0OFkdaivBWIY+fVx0arlj0plAtu0h
 SaE2Y1w3UkcQAjmOnHP+ZjESaHen9nFscAk53BS9F/X+cvFHxIpe8YgU0E2TwLCtBLtB
 K6gvdG9beKnWSwOidBo/0T7pjFe5on4pYVSV7cgZiCLU+14ON+dTpH3m/ikwH429edaE
 8fIw==
X-Gm-Message-State: AOAM5322kGqLmxMINLOXSdQwKBI1xBY6ljCkPyIKCShDz+Yao++Z9kAt
 TjENDV/qsZYxe/Gu8a61hFI=
X-Google-Smtp-Source: ABdhPJy47TWafr98nA5kPAewPrXPzWqc1AM5FjP4Ab0wPcRF+By6mw6/WW3J5fbQja0fcsMN77GF+w==
X-Received: by 2002:adf:df10:: with SMTP id y16mr47302000wrl.225.1594010158173; 
 Sun, 05 Jul 2020 21:35:58 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id r10sm22202309wrm.17.2020.07.05.21.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 21:35:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/6] powerpc/powernv: must include hvcall.h to get PAPR
 defines
Date: Mon,  6 Jul 2020 14:35:35 +1000
Message-Id: <20200706043540.1563616-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200706043540.1563616-1-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
 Will Deacon <will@kernel.org>
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
