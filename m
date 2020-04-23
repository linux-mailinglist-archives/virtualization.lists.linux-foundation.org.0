Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E68F1B5A8F
	for <lists.virtualization@lfdr.de>; Thu, 23 Apr 2020 13:30:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB58F85FAE;
	Thu, 23 Apr 2020 11:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdwznRTUubTW; Thu, 23 Apr 2020 11:30:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 63E8586910;
	Thu, 23 Apr 2020 11:30:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55012C0175;
	Thu, 23 Apr 2020 11:30:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 452A9C0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 11:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3B4CD87E23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 11:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BindJMJfZw4D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 11:30:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B749D87DD9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 11:30:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C767B120;
 Thu, 23 Apr 2020 11:30:29 +0000 (UTC)
Date: Thu, 23 Apr 2020 13:30:27 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Bo Gan <ganb@vmware.com>
Subject: Re: Re: [PATCH 40/70] x86/sev-es: Setup per-cpu GHCBs for the
 runtime handler
Message-ID: <20200423113027.GL30814@suse.de>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-41-joro@8bytes.org>
 <A7DF63B4-6589-4386-9302-6B7F8BE0D9BA@vmware.com>
 <20200415155302.GD21899@suse.de>
 <1a164e55-19dd-a20b-6837-9f425cfac100@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a164e55-19dd-a20b-6837-9f425cfac100@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Wed, Apr 22, 2020 at 06:33:13PM -0700, Bo Gan wrote:
> On 4/15/20 8:53 AM, Joerg Roedel wrote:
> > Hi Mike,
> > 
> > On Tue, Apr 14, 2020 at 07:03:44PM +0000, Mike Stunes wrote:
> > > set_memory_decrypted needs to check the return value. I see it
> > > consistently return ENOMEM. I've traced that back to split_large_page
> > > in arch/x86/mm/pat/set_memory.c.
> > 
> > I agree that the return code needs to be checked. But I wonder why this
> > happens. The split_large_page() function returns -ENOMEM when
> > alloc_pages() fails. Do you boot the guest with minal RAM assigned?
> > 
> > Regards,
> > 
> > 	Joerg
> > 
> 
> I just want to add some context around this. The call path that lead to the
> failure is like the following:
> 
> 	__alloc_pages_slowpath
> 	__alloc_pages_nodemask
> 	alloc_pages_current
> 	alloc_pages
> 	split_large_page
> 	__change_page_attr
> 	__change_page_attr_set_clr
> 	__set_memory_enc_dec
> 	set_memory_decrypted
> 	sev_es_init_ghcbs
> 	trap_init   -> before mm_init (in init/main.c)
> 	start_kernel
> 	x86_64_start_reservations
> 	x86_64_start_kernel
> 	secondary_startup_64
> 
> At this time, mem_init hasn't been called yet (which would be called by
> mm_init). Thus, the free pages are still owned by memblock. It's in mem_init
> (x86/mm/init_64.c) that memblock_free_all gets called and free pages are
> released.
> 
> During testing, I've also noticed that debug_pagealloc=1 will make the issue
> disappear. That's because with debug_pagealloc=1, probe_page_size_mask in
> x86/mm/init.c will not allow large pages (2M/1G). Therefore, no
> split_large_page would happen. Similarly, if CPU doesn't have
> X86_FEATURE_PSE, there won't be large pages either.
> 
> Any thoughts? Maybe split_large_page should get pages from memblock at early
> boot?

Thanks for you analysis. I fixed it (verified by Mike) by using
early_set_memory_decrypted() instead of set_memory_decrypted(). I still
wonder why I didn't see that issue on my kernel. It has
DEBUG_PAGEALLOC=y set, but it is not enabled by default and I also
didn't pass the command-line parameter.

Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
