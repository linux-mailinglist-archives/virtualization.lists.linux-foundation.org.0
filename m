Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B7323EB1F
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 12:03:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AD9D120370;
	Fri,  7 Aug 2020 10:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-itHTZjwz1r; Fri,  7 Aug 2020 10:03:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C776255FC;
	Fri,  7 Aug 2020 10:03:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 671F4C088E;
	Fri,  7 Aug 2020 10:03:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4ECD2C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 10:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8AF3020370
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 10:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15v33sEzdeEd
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 10:03:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id EC19225281
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 10:03:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF6FAB9F;
 Fri,  7 Aug 2020 10:03:17 +0000 (UTC)
Subject: Re: [PATCH v3 4/7] x86/paravirt: remove 32-bit support from
 PARAVIRT_XXL
To: peterz@infradead.org
References: <20200807083826.16794-1-jgross@suse.com>
 <20200807083826.16794-5-jgross@suse.com>
 <20200807093916.GF2674@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3a0712ee-efca-5684-d321-3b789e01fc16@suse.com>
Date: Fri, 7 Aug 2020 12:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807093916.GF2674@hirez.programming.kicks-ass.net>
Content-Language: en-US
Cc: Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 07.08.20 11:39, peterz@infradead.org wrote:
> On Fri, Aug 07, 2020 at 10:38:23AM +0200, Juergen Gross wrote:
> 
>> -# else
>> -	const unsigned char	cpu_iret[1];
>> -# endif
>>   };
>>   
>>   static const struct patch_xxl patch_data_xxl = {
>> @@ -42,7 +38,6 @@ static const struct patch_xxl patch_data_xxl = {
>>   	.irq_save_fl		= { 0x9c, 0x58 },	// pushf; pop %[re]ax
>>   	.mmu_read_cr2		= { 0x0f, 0x20, 0xd0 },	// mov %cr2, %[re]ax
>>   	.mmu_read_cr3		= { 0x0f, 0x20, 0xd8 },	// mov %cr3, %[re]ax
>> -# ifdef CONFIG_X86_64
>>   	.mmu_write_cr3		= { 0x0f, 0x22, 0xdf },	// mov %rdi, %cr3
>>   	.irq_restore_fl		= { 0x57, 0x9d },	// push %rdi; popfq
>>   	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
>> @@ -50,19 +45,11 @@ static const struct patch_xxl patch_data_xxl = {
>>   				    0x48, 0x0f, 0x07 },	// swapgs; sysretq
>>   	.cpu_swapgs		= { 0x0f, 0x01, 0xf8 },	// swapgs
>>   	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
>> -# else
>> -	.mmu_write_cr3		= { 0x0f, 0x22, 0xd8 },	// mov %eax, %cr3
>> -	.irq_restore_fl		= { 0x50, 0x9d },	// push %eax; popf
>> -	.cpu_iret		= { 0xcf },		// iret
>> -# endif
> 
> I was looking at x86_64 paravirt the other day and found we actually
> have pv_ops.cpu.iret users there..

On x86_64 we have (without PARAVIRT_XXL):

#define INTERRUPT_RETURN        jmp native_iret

and with PARAVIRT_XXL this is basically a jmp *pv_ops.cpu.iret which
will then be patched to either jmp native_iret or jmp xen_iret.

On x86_32 INTERRUPT_RETURN was just "iret" for the non-paravirt case.
This is the reason for above dropping of the static patch data.

> So we want to change the above to also patch iret on x86_64 or do we
> need to fix x86_64 to not have pv-iret?

We want it to stay how it is. This will let both variants (PARVIRT y/n)
continue to work.


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
