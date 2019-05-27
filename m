Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F12B5AE
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 14:45:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 463D918AB;
	Mon, 27 May 2019 12:45:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E71C4189E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:45:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B630C13A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:45:20 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so16784806wrq.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 05:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=q2cYYgwiWVJJBJqLCSUSB4vY9rqs6lWWDF70rTeYp2I=;
	b=PQWa2nldpihqzaKCDlO9gyFpayvYZfTNsiqYor/TaIRtgzmQyy3VEc7/TDRqC2Qt0s
	INZyRzRrSGV5gR+IE4N4Muc4r7vbpelSgLt4yPzGLzlj+sDIpxrjo/8izunImwX9JOSN
	wTnygOX/2cNd9hvTRRIRihJx5HMVs2JSf3rHjSfWei7zOnIBhGgxaYDzZU7oVs5+Sh2A
	2b/jh7K4vxdSji0ZjnQ5ZX5GBOMsjSzKMC9X+9pZHEqLUOHdzcW0Kv0NaviWDbJ9yfoh
	GBkVWMbyBGcWTcnplS2B5ooig1XTTRD4taoeA8rR4E+PbujSLx2VO+PEda/+SDw+woYz
	qy5g==
X-Gm-Message-State: APjAAAUn+rS+U3PbbCDW2K9G2BFCUXSRIrZYso7MKzR26ueB1ktDqrjE
	mRWu2ksbhPBnjh0d8s68/O37PA==
X-Google-Smtp-Source: APXvYqygU7qP4o2dkcY70xoK+YyGPQ+ieDW7hA+ZGXuE8LRMvLdpuQeC+BnMGifi0won+RJCrdExpA==
X-Received: by 2002:adf:bc94:: with SMTP id g20mr21574548wrh.206.1558961119322;
	Mon, 27 May 2019 05:45:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c92d:f9e8:f150:3553?
	([2001:b07:6468:f312:c92d:f9e8:f150:3553])
	by smtp.gmail.com with ESMTPSA id
	o20sm13139362wro.2.2019.05.27.05.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 05:45:18 -0700 (PDT)
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
To: Peter Zijlstra <peterz@infradead.org>
References: <20190525082203.6531-1-namit@vmware.com>
	<20190525082203.6531-6-namit@vmware.com>
	<08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
	<20190527094710.GU2623@hirez.programming.kicks-ass.net>
	<e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
	<20190527123206.GC2623@hirez.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <81a67fa3-309d-79cc-5009-5c4908b18ba3@redhat.com>
Date: Mon, 27 May 2019 14:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527123206.GC2623@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
	linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	xen-devel@lists.xenproject.org, Nadav Amit <namit@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 27/05/19 14:32, Peter Zijlstra wrote:
> On Mon, May 27, 2019 at 12:21:59PM +0200, Paolo Bonzini wrote:
>> On 27/05/19 11:47, Peter Zijlstra wrote:
> 
>>> --- a/arch/x86/kernel/kvm.c
>>> +++ b/arch/x86/kernel/kvm.c
>>> @@ -580,7 +580,7 @@ static void __init kvm_apf_trap_init(voi
>>>  
>>>  static DEFINE_PER_CPU(cpumask_var_t, __pv_tlb_mask);
>>>  
>>> -static void kvm_flush_tlb_others(const struct cpumask *cpumask,
>>> +static void kvm_flush_tlb_multi(const struct cpumask *cpumask,
>>>  			const struct flush_tlb_info *info)
>>>  {
>>>  	u8 state;
>>> @@ -594,6 +594,9 @@ static void kvm_flush_tlb_others(const s
>>>  	 * queue flush_on_enter for pre-empted vCPUs
>>>  	 */
>>>  	for_each_cpu(cpu, flushmask) {
>>> +		if (cpu == smp_processor_id())
>>> +			continue;
>>> +
>>
>> Even this would be just an optimization; the vCPU you're running on
>> cannot be preempted.  You can just change others to multi.
> 
> Yeah, I know, but it felt weird so I added the explicit skip. No strong
> feelings though.

Neither here, and it would indeed deserve a comment if you left the if out.

Paolo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
