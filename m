Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E69332E99
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 19:57:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1FC6F4E3;
	Tue,  9 Mar 2021 18:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id muSSew6kDdDb; Tue,  9 Mar 2021 18:57:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA176F4F7;
	Tue,  9 Mar 2021 18:57:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B7DCC0010;
	Tue,  9 Mar 2021 18:57:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAEF7C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 18:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE93243101
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 18:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=alien8.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgRRm-XiI2pv
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 18:57:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82D304308F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 18:57:44 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d1e00d0c5a693a55ce411.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:1e00:d0c5:a693:a55c:e411])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 69B591EC0472;
 Tue,  9 Mar 2021 19:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1615316261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=XORSsete5wDAuj0qz8rNhfE7ztUreCnJFjyEgtuEEKM=;
 b=azPU0PhRnMmVMUehnvtIjy9yn/D1YnQz5gJG/iSyo655LhqKHIlSxCuwCq1j715vh3uovh
 NFWAIPqleg2xfS2vuxq5ytUA3EO2hDYspG0gNDGondbClyxv39iE018r97NVYuPLrjYwrs
 2iCwWZ5mRvfKVA+fNRbyRBboOODaGyY=
Date: Tue, 9 Mar 2021 19:57:37 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 02/12] x86/paravirt: switch time pvops functions to
 use static_call()
Message-ID: <20210309185737.GE699@zn.tnic>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-3-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309134813.23912-3-jgross@suse.com>
Cc: linux-hyperv@vger.kernel.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, "VMware, Inc." <pv-drivers@vmware.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, Mar 09, 2021 at 02:48:03PM +0100, Juergen Gross wrote:
> @@ -167,6 +168,17 @@ static u64 native_steal_clock(int cpu)
>  	return 0;
>  }
>  
> +DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
> +DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
> +
> +bool paravirt_using_native_sched_clock = true;
> +
> +void paravirt_set_sched_clock(u64 (*func)(void))
> +{
> +	static_call_update(pv_sched_clock, func);
> +	paravirt_using_native_sched_clock = (func == native_sched_clock);
> +}

What's the point of this function if there's a global
paravirt_using_native_sched_clock variable now?

Looking how the bit of information whether native_sched_clock is used,
is needed in tsc.c, it probably would be cleaner if you add a

set_sched_clock_native(void);

or so, to tsc.c instead and call that here and make that long var name a
a shorter and static one in tsc.c instead.

Hmm?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
