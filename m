Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0672055F6
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 17:32:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8626726426;
	Tue, 23 Jun 2020 15:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4fUGOa2ShUv; Tue, 23 Jun 2020 15:32:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 912B022CB0;
	Tue, 23 Jun 2020 15:32:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A18CC016F;
	Tue, 23 Jun 2020 15:32:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76DA3C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6154726426
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAqk63cmfQJw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:32:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155])
 by silver.osuosl.org (Postfix) with ESMTPS id C263D22CB0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:32:28 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QP9Jx3H+HhvZhhEt4ggfsozV10N6bYVBVidEhPpOSKd2Kt2OP2Y8D1tWVy640iW+66S4ExUr29
 3JB3pFSLJftaItQlzTtDyzPlpXNy/W/T9+L+ZFgV14wTPrvC6XS7AuiDPdi1jxIxAzVAbCfu5M
 Wi9kMDH32VcQn1yx3GawArowkMnTUV+a0Z+YTDF9aj3mgsowvLagbbd5j5V50TxYrIF/rlg3p1
 7vyqf2bzbYlLiGxnmqC1s4QyuG9wzWCCA2OkMvKoLqQ9juszSl2yG5y7WK+owAQ4QX+oxC8Rpm
 kC4=
X-SBRS: 2.7
X-MesageID: 20733007
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="20733007"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <jroedel@suse.de>
References: <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
 <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
 <20200623111443.GC4817@hirez.programming.kicks-ass.net>
 <20200623114324.GA14101@suse.de>
 <20200623115014.GE4817@hirez.programming.kicks-ass.net>
 <20200623121237.GC14101@suse.de>
 <20200623130322.GH4817@hirez.programming.kicks-ass.net>
 <20200623144940.GE14101@suse.de>
 <20200623151607.GJ4817@hirez.programming.kicks-ass.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe0af2c8-92c8-8d66-e9f3-5a50d64837e5@citrix.com>
Date: Tue, 23 Jun 2020 16:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623151607.GJ4817@hirez.programming.kicks-ass.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gMjMvMDYvMjAyMCAxNjoxNiwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gVHVlLCBKdW4g
MjMsIDIwMjAgYXQgMDQ6NDk6NDBQTSArMDIwMCwgSm9lcmcgUm9lZGVsIHdyb3RlOgo+Pj4gV2Un
cmUgdGFsa2luZyBhYm91dCB0aGUgM3JkIGNhc2Ugd2hlcmUgdGhlIG9ubHkgcmVhc29uIHRoaW5n
cyAnd29yaycgaXMKPj4+IGJlY2F1c2Ugd2UnbGwgaGF2ZSB0byBwYW5pYygpOgo+Pj4KPj4+ICAt
ICNNQwo+PiBPa2F5LCAjTUMgaXMgc3BlY2lhbCBhbmQgY2FuIG9ubHkgYmUgaGFuZGxlZCBvbiBh
IGJlc3QtZWZmb3J0IGJhc2lzLCBhcwo+PiAjTUMgY291bGQgaGFwcGVuIGFueXRpbWUsIGFsc28g
d2hpbGUgYWxyZWFkeSBleGVjdXRpbmcgdGhlICNNQyBoYW5kbGVyLgo+IEkgdGhpbmsgdGhlIGhh
cmR3YXJlIGhhcyBhIE1DRS1tYXNrIGJpdCBzb21ld2hlcmUuIEZsYWt5IHRob3VnaCBiZWNhdXNl
Cj4gY2xlYXJpbmcgaXQgaXNuJ3QgJ2F0b21pYycgd2l0aCBJUkVULCBzbyB0aGVyZSdzIGEgJ2Z1
bm55JyB3aW5kb3cuCgpNU1JfTUNHX1NUQVRVUy5NQ0lQLCBhbmQgeWVzIC0gYW55ICNNQyBiZWZv
cmUgdGhhdCBwb2ludCB3aWxsCmltbWVkaWF0ZWx5IFNodXRkb3duLsKgIEFueSAjTUMgYmV0d2Vl
biB0aGF0IHBvaW50IGFuZCBJUkVUIHdpbGwgY2xvYmJlcgppdHMgSVNUIHN0YWNrIGFuZCBlbmQg
dXAgc2FkLgoKPiBJdCBhbHNvIGludGVyYWN0cyByZWFsbHkgYmFkIHdpdGggdGhlIE5NSSBoYW5k
bGVyLiBJZiB3ZSBnZXQgYW4gI01DCj4gZWFybHkgaW4gdGhlIE5NSSwgd2hlcmUgd2UgaGFyZC1y
ZWx5IG9uIHRoZSBOTUktbWFzayBiZWluZyBzZXQgdG8gc2V0LXVwCj4gdGhlIHJlY3Vyc2lvbiBz
dGFjaywgdGhlbiB0aGUgI01DIElSRVQgd2lsbCBjbGVhciB0aGUgTk1JLW1hc2ssIGFuZAo+IHdl
J3JlIHRvYXN0Lgo+Cj4gQW5keSBoYXMgd2lsZCBhbmQgY3JhenkgaWRlYXMsIGJ1dCBJIGRvbid0
IHRoaW5rIHdlIG5lZWQgbW9yZSBjcmF6eQo+IGhlcmUuCgpXYW50LCBjZXJ0YWlubHkgbm90LsKg
IE5lZWQsIG1heWJlIDotLwo+Pj4gIC0gI0RCIHdpdGggQlVTIExPQ0sgREVCVUcgRVhDRVBUSU9O
Cj4+IElmIEkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSBjb3JyZWN0bHksIHRoaXMgY2FuIGJlIHNv
bHZlZCBieSBtb3Zpbmcgb2ZmCj4+IHRoZSBJU1Qgc3RhY2sgdG8gdGhlIGN1cnJlbnQgdGFzayBz
dGFjayBpbiB0aGUgI0RCIGhhbmRsZXIsIGxpa2UgSSBwbGFuCj4+IHRvIGRvIGZvciAjVkMsIG5v
Pwo+IEhtbSwgcHJvYmFibHkuIFdvdWxkIHRha2UgYSBiaXQgb2YgY2FyZSwgYnV0IHNob3VsZCBi
ZSBkb2FibGUuCgpBbmR5IGFuZCBJIGhhdmUgc3BlbnQgc29tZSB0aW1lIGNvbnNpZGVyaW5nIHRo
aXMuCgpIYXZpbmcgZXhhY3RseSBvbmUgdmVjdG9yIG1vdmUgb2ZmIElTVCBhbmQgb250byBhbiBp
bi11c2UgdGFzay1zdGFjayBpcwpkb2FibGUsIEkgdGhpbmssIHNvIGxvbmcgYXMgaXQgY2FuIHNv
cnQgb3V0IHNlbGYtcmVjdXJzaW9uIHByb3RlY3Rpb25zLgoKSGF2aW5nIG1vcmUgdGhhbiBvbmUg
dmVjdG9yIGRvIHRoaXMgaXMgdmVyeSBjb21wbGljYXRlZC7CoCBZb3UndmUgZ290IHRvCnRha2Ug
Y2FyZSB0byB3YWxrIHVwIHRoZSBsaXN0IG9mIElTVC1uZXN0aW5nIHRvIHNlZSBpZiBhbnkgaW50
ZXJydXB0ZWQKY29udGV4dCBpcyBpbiB0aGUgbWlkZGxlIG9mIHRyeWluZyB0byBjb3B5IHRoZW1z
ZWx2ZXMgb250byB0aGUgc3RhY2ssIHNvCnlvdSBkb24ndCBjbG9iYmVyIHRoZSBmcmFtZSB0aGV5
J3JlIGluIHRoZSBtaWRkbGUgb2YgY29weWluZy4KCn5BbmRyZXcKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
