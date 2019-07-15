Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E969A14
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 19:42:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 26C7AED3;
	Mon, 15 Jul 2019 17:42:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8D0FFED3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:42:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0211C8D7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:42:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 31FDDAF0D;
	Mon, 15 Jul 2019 17:42:36 +0000 (UTC)
Subject: Re: [PATCH 0/2] Remove 32-bit Xen PV guest support
To: Andy Lutomirski <luto@kernel.org>, Andi Kleen <ak@linux.intel.com>
References: <20190715113739.17694-1-jgross@suse.com>
	<87y30zfe9z.fsf@linux.intel.com>
	<CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <35d93381-7517-5741-0b81-0839dd46a1fa@suse.com>
Date: Mon, 15 Jul 2019 19:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
Content-Language: de-DE
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, X86 ML <x86@kernel.org>,
	Alok Kataria <akataria@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
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

On 15.07.19 19:28, Andy Lutomirski wrote:
> On Mon, Jul 15, 2019 at 9:34 AM Andi Kleen <ak@linux.intel.com> wrote:
>>
>> Juergen Gross <jgross@suse.com> writes:
>>
>>> The long term plan has been to replace Xen PV guests by PVH. The first
>>> victim of that plan are now 32-bit PV guests, as those are used only
>>> rather seldom these days. Xen on x86 requires 64-bit support and with
>>> Grub2 now supporting PVH officially since version 2.04 there is no
>>> need to keep 32-bit PV guest support alive in the Linux kernel.
>>> Additionally Meltdown mitigation is not available in the kernel running
>>> as 32-bit PV guest, so dropping this mode makes sense from security
>>> point of view, too.
>>
>> Normally we have a deprecation period for feature removals like this.
>> You would make the kernel print a warning for some releases, and when
>> no user complains you can then remove. If a user complains you can't.
>>
> 
> As I understand it, the kernel rules do allow changes like this even
> if there's a complaint: this is a patch that removes what is
> effectively hardware support.  If the maintenance cost exceeds the
> value, then removal is fair game.  (Obviously we weight the value to
> preserving compatibility quite highly, but in this case, Xen dropped
> 32-bit hardware support a long time ago.  If the Xen hypervisor says
> that 32-bit PV guest support is deprecated, it's deprecated.)
> 
> That being said, a warning might not be a bad idea.  What's the
> current status of this in upstream Xen?

Xen still supports that.

We have asked downstream for their opinion about dropping 32-bit PV
guest support in the kernel about 1 year ago and the common answer was:
no problem, but for users still wanting 32 bit guests we should wait
until PVH support is available in all related products. Grub2 was the
last one missing and as grub2 has released a version with PVH support
I posted this small series now.


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
