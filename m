Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478422C60C
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 15:15:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2236487008;
	Fri, 24 Jul 2020 13:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2c1p1DCwfXD; Fri, 24 Jul 2020 13:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CC4886FF1;
	Fri, 24 Jul 2020 13:15:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EC35C004E;
	Fri, 24 Jul 2020 13:15:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5CDFC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A1210203C8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tveT+soKZDxi
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 33845230FB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:14 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s26so5080804pfm.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 06:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHpBnVvFWixE9Yg0d0OK10tzA3221PSUyt4Cx2IH5+E=;
 b=myWsbPv3/UUglRzV+TMSS2ZZiFNk38LMgSBpDNrQsTIDc5WH7gUklbGO1enhGGySAz
 E7YzZBxilSJCpvzkCjCU/0CNuVBNZLByMjo8KxMsr1RuI7lIPVyR0vvJxZNF+vEP0Mzk
 Sn2h0sLrOt+aOi0ATgnWf89dVNz1bvDrQqo3cj6OoyWX8xCVLnNfJaAqKtDhCjUwNgA0
 5Y/+beDc9ULzpOBEBVXgkQuIV6fUalwLPPpQY5i02r9TLUCpOAqwCxnak+DcBatC0Jyv
 PKBIC5be55ZRIMw4PLKztz9Klrbzm6QA2rbct7J2sE+V6G3FLRbUvMgFLeL3276GLo0m
 WAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHpBnVvFWixE9Yg0d0OK10tzA3221PSUyt4Cx2IH5+E=;
 b=T2hnSiGArZE+vKHf9mFwOcZDtgZeGmRT7plb2setVKlCViMHRyxJjI04hwLrALPa7v
 F+c9m9g7YaIF0vZUMYrKMTvUehX/rmheve9jLOCi/DFkNmTQWFz+hI9cJIprG0z8Gkec
 vuL5Mi9i9qGzpYdLQoFXGqrxsvuBYec646Bn1tsMA7ujTfaZEsUSNIEEF7NO40IHIMIB
 K2NdrdUS7/hES38ZyMHyFOD0JTakQc08uPVZDY/yKDowRXsUSzX+HSZRrmFHDiue7Wmh
 y3HQPUpwEsm8lcxM39Go4dmozz67e8n/Je4sBGfICJRaoefvU8ko2vIOiwfVFmOuJwl6
 wRpA==
X-Gm-Message-State: AOAM531BkF/LU6R34vG2FIypu/OKeUwJe268IazLf/4LTKU67oWCFF0j
 8C9NJEpDNYHIgKc67gkph8k=
X-Google-Smtp-Source: ABdhPJyisx6hCRDrbmPNpGytS1qqjnTFZwITCd6wO1vkmRzyL31lFJNP7UVIeTdb2pnJAPV4vPWvTg==
X-Received: by 2002:aa7:942e:: with SMTP id y14mr8909386pfo.58.1595596512969; 
 Fri, 24 Jul 2020 06:15:12 -0700 (PDT)
Received: from bobo.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id az16sm5871998pjb.7.2020.07.24.06.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 06:15:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 6/6] powerpc: implement smp_cond_load_relaxed
Date: Fri, 24 Jul 2020 23:14:23 +1000
Message-Id: <20200724131423.1362108-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200724131423.1362108-1-npiggin@gmail.com>
References: <20200724131423.1362108-1-npiggin@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
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

This implements smp_cond_load_relaed with the slowpath busy loop using the
preferred SMT priority pattern.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/barrier.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index 123adcefd40f..9b4671d38674 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -76,6 +76,20 @@ do {									\
 	___p1;								\
 })
 
+#define smp_cond_load_relaxed(ptr, cond_expr) ({		\
+	typeof(ptr) __PTR = (ptr);				\
+	__unqual_scalar_typeof(*ptr) VAL;			\
+	VAL = READ_ONCE(*__PTR);				\
+	if (unlikely(!(cond_expr))) {				\
+		spin_begin();					\
+		do {						\
+			VAL = READ_ONCE(*__PTR);		\
+		} while (!(cond_expr));				\
+		spin_end();					\
+	}							\
+	(typeof(*ptr))VAL;					\
+})
+
 #ifdef CONFIG_PPC_BOOK3S_64
 #define NOSPEC_BARRIER_SLOT   nop
 #elif defined(CONFIG_PPC_FSL_BOOK3E)
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
