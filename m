Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A2709C1
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 21:33:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 97CAAD9B;
	Mon, 22 Jul 2019 19:33:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 368F286D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 19:32:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D920EFE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 19:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zw0OzLY2qkyLgMJYZmR8YfjGW2oVP8VhhsbR5Yd/A7w=;
	b=TqldDQQlZ5ZIvVudiXOATvg8+6
	99A+Mn8ucymBMPFhYx39j7RhwEqzKlskYs7uBA2fXig+Bxy7FrABNjSPOmH4GIcSvZhdDn6/2+ZsJ
	VUg6cZbX8pBbqtj2bpRyU9Hzp/nnIWZowUX2X0jd2bLQuCjO1IrSHkq7ZpEA2agi1YNRwmTRLLboh
	67TOwpPTag0FdERZ4yZ/3XiWzg/K9OYALvLZ0986XmDMNqvH4LVlmKnnhtNsUUIsaVZ0eY6sn+2NN
	AtPJRQxOZ5Fl/h2Qzpox5vkgD09aPBondQwxq2tWQ+ZSFyHsqkgVr0smD7+AfjWNC6hLNxOuTf5H+
	UtPXJ1DA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=worktop.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hpe3J-0006Hn-Eh; Mon, 22 Jul 2019 19:32:53 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id A1F78980C59; Mon, 22 Jul 2019 21:32:51 +0200 (CEST)
Date: Mon, 22 Jul 2019 21:32:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v3 4/9] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Message-ID: <20190722193251.GF6698@worktop.programming.kicks-ass.net>
References: <20190719005837.4150-1-namit@vmware.com>
	<20190719005837.4150-5-namit@vmware.com>
	<20190722191433.GD6698@worktop.programming.kicks-ass.net>
	<58DA0841-33C2-4D16-A671-08064A15001C@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58DA0841-33C2-4D16-A671-08064A15001C@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDc6Mjc6MDlQTSArMDAwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiA+IE9uIEp1bCAyMiwgMjAxOSwgYXQgMTI6MTQgUE0sIFBldGVyIFppamxzdHJhIDxwZXRl
cnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cgo+ID4gQnV0IHRoZW4gd2UgY2FuIHN0aWxsIGRvIHNv
bWV0aGluZyBsaWtlIHRoZSBiZWxvdywgd2hpY2ggZG9lc24ndCBjaGFuZ2UKPiA+IHRoaW5ncyBh
bmQgc3RpbGwgZ2V0cyByaWQgb2YgdGhhdCBkdWFsIGZ1bmN0aW9uIGNydWQsIHNpbXBsaWZ5aW5n
Cj4gPiBzbXBfY2FsbF9mdW5jdGlvbl9tYW55IGFnYWluLgoKPiBOaWNlISBJIHdpbGwgYWRkIGl0
IG9uIHRvcCwgaWYgeW91IGRvbuKAmXQgbWluZCAoaW5zdGVhZCBzcXVhc2hpbmcgaXQpLgoKTm90
IGF0IGFsbC4KCj4gVGhlIG9yaWdpbmFsIGRlY2lzaW9uIHRvIGhhdmUgbG9jYWwvcmVtb3RlIGZ1
bmN0aW9ucyB3YXMgbW9zdGx5IHRvIHByb3ZpZGUKPiB0aGUgZ2VuZXJhbGl0eS4KPiAKPiBJIHdv
dWxkIGNoYW5nZSB0aGUgbGFzdCBhcmd1bWVudCBvZiBfX3NtcF9jYWxsX2Z1bmN0aW9uX21hbnko
KSBmcm9tIOKAnHdhaXTigJ0KPiB0byDigJxmbGFnc+KAnSB0aGF0IHdvdWxkIGluZGljYXRlIHdo
ZXRoZXIgdG8gcnVuIHRoZSBmdW5jdGlvbiBsb2NhbGx5LCBzaW5jZSBJCj4gZG9u4oCZdCB3YW50
IHRvIGNoYW5nZSB0aGUgc2VtYW50aWNzIG9mIHNtcF9jYWxsX2Z1bmN0aW9uX21hbnkoKSBhbmQg
ZGVjaWRlCj4gd2hldGhlciB0byBydW4gdGhlIGZ1bmN0aW9uIGxvY2FsbHkgcHVyZWx5IGJhc2Vk
IG9uIHRoZSBtYXNrLiBMZXQgbWUga25vdyBpZgo+IHlvdSBkaXNhZ3JlZS4KCkFncmVlZC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
