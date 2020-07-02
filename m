Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A1211D5F
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 09:49:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ECFF989062;
	Thu,  2 Jul 2020 07:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W07pXJZ_iKoc; Thu,  2 Jul 2020 07:49:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94CBD89057;
	Thu,  2 Jul 2020 07:49:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77042C0733;
	Thu,  2 Jul 2020 07:49:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B912BC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A871C8AA3D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y65s2d130qTS
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7EAB68AA1D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:04 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id c1so4909693pja.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fa9T6PNML2/xkl0bGh/Ztj2VCHxJI+rGnDXzulQp9g4=;
 b=PCTOgeyXmxCRHqkPbdWbNCD5RF4HWZdbQyTIojx6EjkOEWF+8/wPlG+BElrR7+YXPZ
 sLjTHouTQD0P60dVOilWpe+9ScH0g0t3DQfrJjVACgVsaQop6YHakwMXx0bTb/i9Kpyr
 IfE7/orhNh+x85icci2L+rRczXIMxKvjeObHUliBHpTheYNK4UHn2US9x2BpsMUNug+I
 EusvpjUPF/4LJKVp6u8AbSLcPZwrmIIEF3Y1b5zCKSh3qKcVdNqSh8SeyDBvoKorJgff
 xdbFqgnTG+Pi2peG6cNEYSMF+oKs2l5g3Bon66SblCaVCGRP5jxZmJeOVkncsl3jVmza
 hxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fa9T6PNML2/xkl0bGh/Ztj2VCHxJI+rGnDXzulQp9g4=;
 b=PYOVHJG+KymsFA57N3MXKn08wztC3a8idfYnS4Xi0fQRe52LC0BQWBzu5w3my6hkBj
 QPb01kxb8HUpPc0GYfvTV1ah7u5a39u3Yjrtd7S1R6ZiFGXxZL+JBDhl+wJTeLcyUGwV
 DtQqiDLvWLbrPGAU8KGcUpdcgMNbic7TV3IokQv6qIEMm4Hiko6/UquytpW65RICdquQ
 KzHZX6NDtTbOZfBRC/XsRPl4SZPVVoEAvrWP8Gd+keYctqeYuOHoDZl34Ztm+/SImqBZ
 bbur36QJJ1IsyhdeODWVnT8kY30cvUKXPBssUXKb40oT8n47nPuazhR1meM2Doae4N9F
 wHng==
X-Gm-Message-State: AOAM532l3hy7hRTwYq3ijdQ2Qd2By4pwuT9QiLKQEr/cVHlALat1eFJk
 n/zwBCp2Y2C2nnvWKijbL28=
X-Google-Smtp-Source: ABdhPJz0DrYb1pN7ZPb0vDXXXEcS0FJvLihL6IDzUc7haMlJV7H/L6XRfoSOyJ9cS7kxACtRgiESpQ==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr32900004pjo.173.1593676144195; 
 Thu, 02 Jul 2020 00:49:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:49:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 2/8] powerpc/pseries: use smp_rmb() in H_CONFER spin yield
Date: Thu,  2 Jul 2020 17:48:33 +1000
Message-Id: <20200702074839.1057733-3-npiggin@gmail.com>
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

There is no need for rmb(), this allows faster lwsync here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/locks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/locks.c b/arch/powerpc/lib/locks.c
index 6440d5943c00..47a530de733e 100644
--- a/arch/powerpc/lib/locks.c
+++ b/arch/powerpc/lib/locks.c
@@ -30,7 +30,7 @@ void splpar_spin_yield(arch_spinlock_t *lock)
 	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
-	rmb();
+	smp_rmb();
 	if (lock->slock != lock_value)
 		return;		/* something has changed */
 	plpar_hcall_norets(H_CONFER,
@@ -56,7 +56,7 @@ void splpar_rw_yield(arch_rwlock_t *rw)
 	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
-	rmb();
+	smp_rmb();
 	if (rw->lock != lock_value)
 		return;		/* something has changed */
 	plpar_hcall_norets(H_CONFER,
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
