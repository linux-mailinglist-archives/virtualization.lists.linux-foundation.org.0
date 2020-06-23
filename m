Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 375542055B8
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 17:23:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E207022775;
	Tue, 23 Jun 2020 15:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVukAK43sU5D; Tue, 23 Jun 2020 15:23:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E8F0122CB0;
	Tue, 23 Jun 2020 15:23:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A145FC016F;
	Tue, 23 Jun 2020 15:23:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15518C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 10BF82DB63
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLxPKSTkE8Zt
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168])
 by silver.osuosl.org (Postfix) with ESMTPS id C5F0F22775
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:03 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /GrFiUnpMH0W1AmH16iOP4fF+hxzWdtD9D+GISmoRYqR9NUtqwq7oNSKz4sucvE9pe0J4q44B7
 YPhx3w0bbMe7At7SPDagk+W+pBlnB3922l+qjz6SB7+59/ApAY01JpymxYxQB/94hJVnwwx0hu
 mFWsCVB1OyWETH6EOQgYMgbq3BvnqklFn/9U3YmTb/P+RlHggHk+LCKhL2ufV+TQIExUPEF/c/
 iBObNjUKWYetodeXq+AyoWV8QwqwHww4DnX12xwYBQL5sOXqBlQ7a5064JbCHOcBXl3kQZ+uQp
 tKU=
X-SBRS: 2.7
X-MesageID: 20952771
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="20952771"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <jroedel@suse.de>
References: <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
 <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
 <20200623111443.GC4817@hirez.programming.kicks-ass.net>
 <20200623114324.GA14101@suse.de>
 <20200623115014.GE4817@hirez.programming.kicks-ass.net>
 <20200623121237.GC14101@suse.de>
 <20200623130322.GH4817@hirez.programming.kicks-ass.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9e3f9b2a-505e-dfd7-c936-461227b4033e@citrix.com>
Date: Tue, 23 Jun 2020 16:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623130322.GH4817@hirez.programming.kicks-ass.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>, Dave
 Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMjMvMDYvMjAyMCAxNDowMywgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gVHVlLCBKdW4g
MjMsIDIwMjAgYXQgMDI6MTI6MzdQTSArMDIwMCwgSm9lcmcgUm9lZGVsIHdyb3RlOgo+PiBPbiBU
dWUsIEp1biAyMywgMjAyMCBhdCAwMTo1MDoxNFBNICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90
ZToKPj4+IElmIFNOUCBpcyB0aGUgc29sZSByZWFzb24gI1ZDIG5lZWRzIHRvIGJlIElTVCwgdGhl
biBJJ2Qgc3Ryb25nbHkgdXJnZQo+Pj4geW91IHRvIG9ubHkgbWFrZSBpdCBJU1QgaWYvd2hlbiB5
b3UgdHJ5IGFuZCBtYWtlIFNOUCBoYXBwZW4sIG5vdCBiZWZvcmUuCj4+IEl0IGlzIG5vdCB0aGUg
b25seSByZWFzb24sIHdoZW4gRVMgZ3Vlc3RzIGdhaW4gZGVidWcgcmVnaXN0ZXIgc3VwcG9ydAo+
PiB0aGVuICNWQyBhbHNvIG5lZWRzIHRvIGJlIElTVCwgYmVjYXVzZSAjREIgY2FuIGJlIHByb21v
dGVkIGludG8gI1ZDCj4+IHRoZW4sIGFuZCBhcyAjREIgaXMgSVNUIGZvciBhIHJlYXNvbiwgI1ZD
IG5lZWRzIHRvIGJlIHRvby4KPiBEaWRuJ3QgSSByZWFkIHNvbWV3aGVyZSB0aGF0IHRoYXQgaXMg
b25seSBzbyBmb3IgUm9tZS9OYXBsZXMgYnV0IG5vdCBmb3IKPiB0aGUgbGF0ZXIgY2hpcHMgKE1p
bGFuKSB3aGljaCBoYXZlICNEQiBwYXNzLXRocm91Z2g/CgpJIGRvbid0IGtub3cgYWJvdXQgaGFy
ZHdhcmUgdGltZWxpbmVzLCBidXQgc29tZSBmdXR1cmUgcGFydCBjYW4gbm93IG9wdAppbiB0byBo
YXZpbmcgZGVidWcgcmVnaXN0ZXJzIGFzIHBhcnQgb2YgdGhlIGVuY3J5cHRlZCBzdGF0ZSwgYW5k
IHN3YXBwZWQKYnkgVk1FeGl0LCB3aGljaCB3b3VsZCBtYWtlIGRlYnVnIGZhY2lsaXRpZXMgZ2Vu
ZXJhbGx5IHVzYWJsZSwgYW5kCnN1cHBvc2VkbHkgc2FmZSB0byB0aGUgI0RCIGluZmluaXRlIGxv
b3AgaXNzdWVzLCBhdCB3aGljaCBwb2ludCB0aGUKaHlwZXJ2aXNvciBuZWVkIG5vdCBpbnRlcmNl
cHQgI0RCIGZvciBzYWZldHkgcmVhc29ucy4KCkl0cyB3b3J0aCBub3RoaW5nIHRoYXQgb24gY3Vy
cmVudCBwYXJ0cywgdGhlIGh5cGVydmlzb3IgY2FuIHNldCB1cCBkZWJ1ZwpmYWNpbGl0aWVzIG9u
IGJlaGFsZiBvZiB0aGUgZ3Vlc3QgKG9yIGJlaGluZCBpdHMgYmFjaykgYXMgdGhlIERSIHN0YXRl
CmlzIHVuZW5jcnlwdGVkLCBidXQgdGhhdCBhdHRlbXB0aW5nIHRvIGludGVyY2VwdCAjREIgd2ls
bCByZWRpcmVjdCB0bwojVkMgaW5zaWRlIHRoZSBndWVzdCBhbmQgY2F1c2UgZnVuLiAoQWxzbyBz
cGFyZSBhIHRob3VnaHQgZm9yIDMyYml0Cmtlcm5lbHMgd2hpY2ggaGF2ZSB0byBjb3BlIHdpdGgg
dXNlcnNwYWNlIHNpbmdsZXN0ZXBwaW5nIHRoZSBTWVNFTlRFUgpwYXRoIHdpdGggZXZlcnkgI0RC
IHR1cm5pbmcgaW50byAjVkMuKQoKPj4gQmVzaWRlcyB0aGF0LCBJIGFtIG5vdCBhIGZhbiBvZiBk
ZWxlZ2F0aW5nIHByb2JsZW1zIEkgYWxyZWFkeSBzZWUgY29taW5nCj4+IHRvIGZ1dHVyZS1Kb2Vy
ZyBhbmQgZnV0dXJlLVBldGVyLCBidXQgaWYgYXQgYWxsIHBvc3NpYmxlIGRlYWwgd2l0aCB0aGVt
Cj4+IG5vdyBhbmQgYmUgc2FmZSBsYXRlci4KPiBXZWxsLCB3ZSBjb3VsZCBqdXN0IHNheSBubyA6
LSkgQXQgc29tZSBwb2ludCBpbiB0aGUgdmVyeSBuZWFyIGZ1dHVyZQo+IHRoaXMgaG91c2Ugb2Yg
Y2FyZHMgaXMgZ29pbmcgdG8gaW1wbG9kZS4KCldoYXQgY3VycmVudGx5IGV4aXN0cyBpcyBhIHBp
Y3R1cmUgb2YgYSBob3VzZSBvZiBjYXJkcyBpbiBmcm9udCBvZgpzb21ldGhpbmcgd2hpY2ggaGFz
IGZhbGxlbiBkb3duLgoKPiBEaWQgc29tZW9uZSBmb3JnZXQgdG8gcGFzcyB0aGUgJ0lTVHMgYXJl
ICpFVklMKicgbWVtbyB0byB0aGUgaGFyZHdhcmUKPiBmb2xrcz8gSG93IGNvbWUgd2UncmUgZ2V0
dGluZyBtb3JlIGFuZCBtb3JlIG9mIHRoZW0/CgpJIGhhdmUgdHJpZWQgdG8gZ2V0IHRoaXMgcG9p
bnQgYWNyb3NzLsKgIFRoZW4gYWdhaW4gLSBpdHMgZmFyIGVhc2llciBmb3IKdGhlIHNvZnR3YXJl
IGZvbGsgaW4gdGhlIHNhbWUgY29tcGFueSBhcyB0aGUgaGFyZHdhcmUgZm9sayB0byBtYWtlIHRo
aXMKcG9pbnQuCgo+ICgvbWUgcHV0cyBmaW5nZXJzCj4gaW4gZWFycyBhbmQgZ29lcyBsYS1sYS1s
YS1sYSBpbiBhbnRpY2lwYXRpb24gb2YgQW5kcmV3IG1lbnRpb25pbmcgQ0VUKQoKSSB3YXNuJ3Qg
Z29pbmcgdG8gYnJpbmcgaXQgdXAsIGJ1dCBzZWVpbmcgYXMgeW91IGhhdmUgLSB3aGlsZSB0aGVy
ZSBhcmUKcHJvaGliaXRpdmVseS1jb21wbGljYXRpbmcgaXNzdWVzIHByZXZlbnRpbmcgaXQgZnJv
bSB3b3JraW5nIG9uIG5hdGl2ZSwKSSBkb24ndCBzZWUgYW55IHBvaW50IGV2ZW4gY29uc2lkZXJp
bmcgaXQgZm9yIHRoZSBtZXNzIHdoaWNoIGlzICNWQywgb3IKdGhlIGV2ZW4gYmlnZ2VyIG1lc3Mg
d2hpY2ggaXMgI0hWLgoKfkFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
