Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3A6788E1
	for <lists.virtualization@lfdr.de>; Mon, 23 Jan 2023 21:58:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C35D44010F;
	Mon, 23 Jan 2023 20:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C35D44010F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LthrIcTz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TguxK7TLE9Ix; Mon, 23 Jan 2023 20:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9D31740B74;
	Mon, 23 Jan 2023 20:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D31740B74
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81B5EC002D;
	Mon, 23 Jan 2023 20:58:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E7EDC0081
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 20:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC90460FCA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 20:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC90460FCA
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=LthrIcTz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuZdqkIFZToV
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 20:58:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E5460FC7
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87E5460FC7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Jan 2023 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=LKrP1wtwDwtGfmqJdEblQavVdQZHYUX7Rw9EhYSY0po=; b=LthrIcTz/vqS1NeYOD0uryIINK
 L5KA0bgSmcB9KMp+I7aQ5EwxmG5qOTNqwwDMaLS8PmkuBC4HSTBPEsoS2bdKiHPtGPN4OFBPidnr2
 5zbVMyZP0Y8odEb60DwuQfxT2Eaq/NUfnc1krSs7fj+svrKOAiOd/c5YRTY+/4PYC1xoidVDbYSli
 ORaftVjMZwg4jYvWLzMGWTGKhY1mBn3TA0jGQksHIcZZqt2zQz/rCGybV3JcBvrHQ6IxXmwVkth8l
 d1NqgwluXNaHMVCrlyKf/lsJuQ5S//P74orZosbW8IQc/Q1n2PXtJaHc/YqKiZHWCmUT8RmH7O4/Q
 FhSIaXXw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pK3sA-001dtm-02; Mon, 23 Jan 2023 20:57:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6025C3002BF;
 Mon, 23 Jan 2023 21:57:24 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id C4CC620754993; Mon, 23 Jan 2023 21:57:24 +0100 (CET)
Message-ID: <20230123205515.001913664@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 23 Jan 2023 21:50:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Subject: [PATCH 2/6] x86/pvclock: improve atomic update of last_value in
 pvclock_clocksource_read
References: <20230123205009.790550642@infradead.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 wanpengli@tencent.com, kvm@vger.kernel.org, rafael@kernel.org,
 peterz@infradead.org, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org, bsegall@google.com,
 amakhalov@vmware.com, will@kernel.org, tglx@linutronix.de, vschneid@redhat.com,
 hpa@zytor.com, x86@kernel.org, Uros Bizjak <ubizjak@gmail.com>,
 pv-drivers@vmware.com, mgorman@suse.de, linux-trace-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, boqun.feng@gmail.com, rostedt@goodmis.org,
 bp@alien8.de, vincent.guittot@linaro.org, boris.ostrovsky@oracle.com,
 dietmar.eggemann@arm.com, jgross@suse.com, seanjc@google.com,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, pbonzini@redhat.com,
 bristot@redhat.com
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

From: Uros Bizjak <ubizjak@gmail.com>

Improve atomic update of last_value in pvclock_clocksource_read:

- Atomic update can be skipped if the "last_value" is already
  equal to "ret".

- The detection of atomic update failure is not correct. The value,
  returned by atomic64_cmpxchg should be compared to the old value
  from the location to be updated. If these two are the same, then
  atomic update succeeded and "last_value" location is updated to
  "ret" in an atomic way. Otherwise, the atomic update failed and
  it should be retried with the value from "last_value" - exactly
  what atomic64_try_cmpxchg does in a correct and more optimal way.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20230118202330.3740-1-ubizjak@gmail.com
---
 arch/x86/kernel/pvclock.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index eda37df016f0..5a2a517dd61b 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -102,10 +102,9 @@ u64 pvclock_clocksource_read(struct pvclock_vcpu_time_info *src)
 	 */
 	last = atomic64_read(&last_value);
 	do {
-		if (ret < last)
+		if (ret <= last)
 			return last;
-		last = atomic64_cmpxchg(&last_value, last, ret);
-	} while (unlikely(last != ret));
+	} while (!atomic64_try_cmpxchg(&last_value, &last, ret));
 
 	return ret;
 }
-- 
2.39.0



_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
