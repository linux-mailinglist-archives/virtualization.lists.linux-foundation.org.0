Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D82292A1
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 09:55:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2AFF886A32;
	Wed, 22 Jul 2020 07:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1jjtezfjw5X; Wed, 22 Jul 2020 07:55:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3229A86A56;
	Wed, 22 Jul 2020 07:55:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C225C004C;
	Wed, 22 Jul 2020 07:55:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFD79C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 07:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A1EE1883C9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 07:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWKb6OR0zo64
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 07:55:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B75A3883A1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 07:55:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D778AEDA;
 Wed, 22 Jul 2020 07:55:56 +0000 (UTC)
Date: Wed, 22 Jul 2020 09:55:46 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Mike Stunes <mstunes@vmware.com>
Subject: Re: [PATCH v4 51/75] x86/sev-es: Handle MMIO events
Message-ID: <20200722075546.GG6132@suse.de>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-52-joro@8bytes.org>
 <40D5C698-1ED2-4CCE-9C1D-07620A021A6A@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40D5C698-1ED2-4CCE-9C1D-07620A021A6A@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

SGkgTWlrZSwKCk9uIFR1ZSwgSnVsIDIxLCAyMDIwIGF0IDA5OjAxOjQ0UE0gKzAwMDAsIE1pa2Ug
U3R1bmVzIHdyb3RlOgo+IEnigJltIHJ1bm5pbmcgaW50byBhbiBNTUlPLXJlbGF0ZWQgYnVnIHdo
ZW4gSSB0cnkgdGVzdGluZyB0aGlzIG9uIG91ciBoeXBlcnZpc29yLgo+IAo+IER1cmluZyBib290
LCBwcm9iZV9yb21zIChhcmNoL3g4Ni9rZXJuZWwvcHJvYmVfcm9tcy5jKSB1c2VzCj4gcm9tY2hl
Y2tzdW0gb3ZlciB0aGUgdmlkZW8gUk9NIGFuZCBleHRlbnNpb24gUk9NIHJlZ2lvbnMuIEluIG15
IHRlc3QKPiBWTSwgdGhlIHZpZGVvIFJPTSByb21jaGVja3N1bSBzdGFydHMgYXQgdmlydHVhbCBh
ZGRyZXNzCj4gMHhmZmZmODg4MDAwMGMwMDAwIGFuZCBoYXMgbGVuZ3RoIDY1NTM2LiBCdXQsIGF0
IGFkZHJlc3MKPiAweGZmZmY4ODgwMDAwYzQwMDAsIHdlIHN3aXRjaCBmcm9tIGJlaW5nIHZpZGVv
LVJPTS1iYWNrZWQgdG8gYmVpbmcKPiB1bmJhY2tlZCBieSBhbnl0aGluZy4KPiAKPiBXaXRoIFNF
Vi1FUyBlbmFibGVkLCBvdXIgcGxhdGZvcm0gaGFuZGxlcyByZWFkcyBhbmQgd3JpdGVzIHRvIHVu
YmFja2VkCj4gbWVtb3J5IGJ5IHRyZWF0aW5nIHRoZW0gYXMgTU1JTy4gU28sIHRoZSByZWFkIGZy
b20gMHhmZmZmODg4MDAwMGM0MDAwCj4gY2F1c2VzIGEgI1ZDLCB3aGljaCBpcyBoYW5kbGVkIGJ5
IGRvX2Vhcmx5X2V4Y2VwdGlvbi4KPiAKPiBJbiBoYW5kbGluZyB0aGUgI1ZDLCB2Y19zbG93X3Zp
cnRfdG9fcGh5cyBmYWlscyBmb3IgdGhhdCBhZGRyZXNzLiBNeQo+IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCB0aGUgI1ZDIGhhbmRsZXIgc2hvdWxkIHRoZW4gYWRkIGFuIGVudHJ5IHRvIHRoZQo+IHBh
Z2UgdGFibGVzIGFuZCByZXRyeSB0aGUgZmF1bHRpbmcgYWNjZXNzLiBTb21laG93LCB0aGF0IGlz
buKAmXQKPiBoYXBwZW5pbmcuIEZyb20gdGhlIGh5cGVydmlzb3Igc2lkZSwgaXQgbG9va3MgbGlr
ZSB0aGUgZ3Vlc3QgaXMKPiBsb29waW5nIHNvbWVob3cuIChJIHRoaW5rIHRoZSBWQ1BVIGlzIG1v
c3RseSB1bmhhbHRlZCBhbmQgbWFraW5nCj4gcHJvZ3Jlc3MsIGJ1dCB0aGUgZ3Vlc3QgbmV2ZXIg
Z2V0cyBwYXN0IHRoYXQgcm9tY2hlY2tzdW0uKSBUaGUgZ3Vlc3QKPiBuZXZlciBhY3R1YWxseSBt
YWtlcyBhbiBNTUlPIHZtZ2V4aXQgZm9yIHRoYXQgYWRkcmVzcy4KClRoYXQgc291bmRzIGxpa2Ug
eW91ciBndWVzdCBpcyBpbiBhIHBhZ2UtZmF1bHQgbG9vcCwgYnV0IEkgY2FuJ3QgeWV0CmV4cGxh
aW4gd2h5LiBDYW4geW91IHBsZWFzZSBmaW5kIG91dCB0aGUgaW5zdHJ1Y3Rpb24gd2hpY2ggaXMg
Y2F1c2luZwp0aGUgI1ZDIGV4Y2VwdGlvbj8KCklmIGEgcGFnZS1mYXVsdCBoYXBwZW5zIGR1cmlu
ZyAjVkMgZW11bGF0aW9uIGl0IGlzIGZvcndhcmVkIHRvIHRoZQpwYWdlLWZhdWx0IGhhbmRsZXIs
IHNvIHRoaXMgc2hvdWxkIHdvcmsuIEJ1dCBzb21laG93IHRoaXMgaXNuJ3QKaGFwcGVuaW5nIG9y
IHRoZSBwYWdlLWZhdWx0IGhhbmRsZXIgY2FuJ3QgbWFwIHRoZSBmYXVsdGluZyBhZGRyZXNzLgoK
ClJlZ2FyZHMsCgoJSm9lcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
