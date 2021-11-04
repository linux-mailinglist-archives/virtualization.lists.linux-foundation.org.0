Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A8631445AFA
	for <lists.virtualization@lfdr.de>; Thu,  4 Nov 2021 21:12:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0404050F;
	Thu,  4 Nov 2021 20:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2Iu3dXt5gpP; Thu,  4 Nov 2021 20:11:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CE84940505;
	Thu,  4 Nov 2021 20:11:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D502C0021;
	Thu,  4 Nov 2021 20:11:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8D4EC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7E9B40504
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkzTIvyN0rLG
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:11:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F91040502
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:11:55 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1636056711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rq//ut4GNk9KUt1BHn8gasqjbgmlCpHJg3dIkQ8uM8g=;
 b=GON8hScVE2iUKKwrSU7sTAMM7zZWJWra5M84/tllypuRLFypXmOG3ImwMS1G93boao59J9
 7fquYC1zlIjVUDLGWuq2RAnHO5Y8z5Yu0xyYmDF63lslw/CsU1NhKPVTsq7xgAwL6cm/R/
 UtpayV1bZnHKEtCTxWfLP1EkG3MQWs4Q9oI8+SqlBqVxn1djJFblgmje0/smn51a3ofKdb
 HsEuiDQhgsAZr8NtxOZW6qBdxaTr4kAp0tlUtZD1joIgAngoOxxF1yea9U1VXmAk/uJLnO
 0xd+65ZxXXkbLYXP5Z+uGVNxVE0YocsgWriglzXQYN0Enz1+IoEz+joLko5olA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1636056711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rq//ut4GNk9KUt1BHn8gasqjbgmlCpHJg3dIkQ8uM8g=;
 b=VdN/jkT+2+Zn/VgqiDT/5pGTWw6f+a/FCkkCzHZXGWrjKRhCt8+z2u4RMg/EaLULegMgYp
 qrR7HZM2ojYGLFDQ==
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, Juergen Gross
 <jgross@suse.com>, X86 ML <x86@kernel.org>, Linux Virtualization
 <virtualization@lists.linux-foundation.org>
Subject: Re: Which tree for paravirt related patches?
In-Reply-To: <b4288d2d-8300-6d1f-f4d1-8d922f46fb70@csail.mit.edu>
References: <60a2037d-2d4d-e9e9-edfd-b889c4bd3fb6@suse.com>
 <874k8s5lgz.ffs@tglx> <87zgqk46u7.ffs@tglx>
 <b4288d2d-8300-6d1f-f4d1-8d922f46fb70@csail.mit.edu>
Date: Thu, 04 Nov 2021 21:11:51 +0100
Message-ID: <87o86z4r5k.ffs@tglx>
MIME-Version: 1.0
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Pv-drivers <Pv-drivers@vmware.com>,
 IngoMolnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jan Beulich <JBeulich@suse.com>, amakhalov@vmware.com
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

Srivatsa,

On Thu, Nov 04 2021 at 12:09, Srivatsa S. Bhat wrote:
> On a related note, I'll be stepping in soon to assist (in place of
> Deep) as a co-maintainer of the PARAVIRT_OPS interface. I had the same
> query about which tree would be best for patches to the paravirt-ops
> code, so I'm glad to see that it got clarified on this thread.

Welcome to the club.

> I'll also be taking over the maintainership of the VMware hypervisor
> interface. Looking at the git logs, I believe those patches have
> also been handled via the tip tree; so would it be okay to add the
> x86 ML and the tip tree to the VMware hypervisor interface entry too
> in the MAINTAINERS file?

We've routed them through tip, yes. So yes, that's fine to have a
separate entry in the maintainers file which has you and x86@kernel.org
plus the tip tree mentioned.

Thanks,

        tglx


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
