Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE3688F2
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 14:36:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD6EBD9E;
	Mon, 15 Jul 2019 12:36:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6A61D93
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 12:36:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 552D471C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 12:36:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 7B99DAD14;
	Mon, 15 Jul 2019 12:36:38 +0000 (UTC)
Subject: Re: [PATCH 0/2] Remove 32-bit Xen PV guest support
To: Peter Zijlstra <peterz@infradead.org>
References: <20190715113739.17694-1-jgross@suse.com>
	<20190715123207.GE3419@hirez.programming.kicks-ass.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <83fd65e0-9b6f-39a0-4f10-4f535d523ac8@suse.com>
Date: Mon, 15 Jul 2019 14:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715123207.GE3419@hirez.programming.kicks-ass.net>
Content-Language: de-DE
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
	Alok Kataria <akataria@vmware.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 15.07.19 14:32, Peter Zijlstra wrote:
> On Mon, Jul 15, 2019 at 01:37:37PM +0200, Juergen Gross wrote:
>> The long term plan has been to replace Xen PV guests by PVH. The first
>> victim of that plan are now 32-bit PV guests, as those are used only
>> rather seldom these days. Xen on x86 requires 64-bit support and with
>> Grub2 now supporting PVH officially since version 2.04 there is no
>> need to keep 32-bit PV guest support alive in the Linux kernel.
>> Additionally Meltdown mitigation is not available in the kernel running
>> as 32-bit PV guest, so dropping this mode makes sense from security
>> point of view, too.
>>
>> Juergen Gross (2):
>>    x86/xen: remove 32-bit Xen PV guest support
>>    x86/paravirt: remove 32-bit support from PARAVIRT_XXL
> 
> Hooray!
> 

Always a pleasure to cheer the community up by sending Xen patches. :-D


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
