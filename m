Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 973142559D9
	for <lists.virtualization@lfdr.de>; Fri, 28 Aug 2020 14:12:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 48C7E86E5C;
	Fri, 28 Aug 2020 12:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwDSrAJltOXh; Fri, 28 Aug 2020 12:12:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D5D1286E35;
	Fri, 28 Aug 2020 12:12:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC531C0893;
	Fri, 28 Aug 2020 12:12:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 812F9C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 12:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70720885E3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 12:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNRdPbPj-vh7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 12:12:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3CB0C885B5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 12:12:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 45AC82E1; Fri, 28 Aug 2020 14:12:29 +0200 (CEST)
Date: Fri, 28 Aug 2020 14:12:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH v6 13/76] x86/boot/compressed/64: Add IDT Infrastructure
Message-ID: <20200828121226.GC13881@8bytes.org>
References: <20200824085511.7553-1-joro@8bytes.org>
 <20200824085511.7553-14-joro@8bytes.org>
 <20200827152657.GA669574@rani.riverdale.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827152657.GA669574@rani.riverdale.lan>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
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

SGkgQXJ2aW5kLAoKT24gVGh1LCBBdWcgMjcsIDIwMjAgYXQgMTE6MjY6NTdBTSAtMDQwMCwgQXJ2
aW5kIFNhbmthciB3cm90ZToKPiBPbiBNb24sIEF1ZyAyNCwgMjAyMCBhdCAxMDo1NDowOEFNICsw
MjAwLCBKb2VyZyBSb2VkZWwgd3JvdGU6Cj4gPiArCXB1c2hxCSVyc2kKPiA+ICsJY2FsbAlsb2Fk
X3N0YWdlMV9pZHQKPiA+ICsJcG9wcQklcnNpCj4gPiArCj4gCj4gRG8gd2UgbmVlZCB0aGUgZnVu
Y3Rpb25zIGxhdGVyIGluIHRoZSBzZXJpZXMgb3IgY291bGQgdGhpcyBqdXN0IHVzZSBsaWR0Cj4g
ZGlyZWN0bHk/CgpUaGUgZnVuY3Rpb24gYWxzbyBzZXRzIHVwIHRoZSBhY3R1YWwgSURUIGVudHJp
ZXMgaW4gdGhlIHRhYmxlIGJlZm9yZQpkb2luZyB0aGUgbGlkdCwgc28gdGhpcyBuZWVkcyB0byBi
ZSBhIGNhbGwgdG8gYSBDIGZ1bmN0aW9uLiBTZXR0aW5nIHVwCklEVCBlbnRyaWVzIGluIGFzc2Vt
Ymx5IGRvZXMgbm90IHJlc3VsdCBpbiByZWFkYWJsZSBjb2RlLgoKPiBJcyB0aGVyZSBhbnkgcmlz
ayBvZiBleGNlcHRpb25zIGdldHRpbmcgdHJpZ2dlcmVkIGR1cmluZyB0aGUgbW92ZSBvZiB0aGUK
PiBjb21wcmVzc2VkIGtlcm5lbCwgYmVmb3JlIHRoZSBzdGFnZTIgcmVsb2FkPwoKTm8sIHRoYXQg
d291bGQgYmUgYSBidWcgaW4gZWl0aGVyIHRoZSBVRUZJIEJJT1Mgb3IgaW4gdGhlIGJvb3QgY29k
ZS4KV2hlbiB0aGUga2VybmVsIGltYWdlIGlzIG1vdmVkIHRvIHRoZSBlbmQgb2YgdGhlIGRlY29t
cHJlc3Npb24gYnVmZmVyIGl0CnN0aWxsIHJ1bnMgb24gdGhlIEVGSSBwYWdlLXRhYmxlLgoKV2l0
aCB0aGUgY2hhbmdlcyBpbiB0aGlzIHBhdGNoLXNldCB0aGVyZSB3aWxsIGJlIHBhZ2UtZmF1bHRz
IHdoZW4gdGhlCmtlcm5lbCBpcyBhY3R1YWxseSBkZWNvbXByZXNzZWQuIEJ1dCB0aGF0IGhhcHBl
bnMgYWZ0ZXIgdGhlIHN0YWdlMi1pZHQKaXMgbG9hZGVkLgoKPiA+ICtTWU1fREFUQV9TVEFSVChi
b290X2lkdF9kZXNjKQo+ID4gKwkud29yZAlib290X2lkdF9lbmQgLSBib290X2lkdAo+IAo+IEkg
dGhpbmsgdGhpcyBzaG91bGQgYmUgYm9vdF9pZHRfZW5kIC0gYm9vdF9pZHQgLSAxLCByaWdodD8K
PiAgIFRoZSBsaW1pdCB2YWx1ZSBpcyBleHByZXNzZWQgaW4gYnl0ZXMgYW5kIGlzIGFkZGVkIHRv
IHRoZSBiYXNlIGFkZHJlc3MKPiAgIHRvIGdldCB0aGUgYWRkcmVzcyBvZiB0aGUgbGFzdCB2YWxp
ZCBieXRlLiBBIGxpbWl0IHZhbHVlIG9mIDAgcmVzdWx0cwo+ICAgaW4gZXhhY3RseSAxIHZhbGlk
IGJ5dGUuIEJlY2F1c2UgSURUIGVudHJpZXMgYXJlIGFsd2F5cyBlaWdodCBieXRlcwo+ICAgbG9u
ZywgdGhlIGxpbWl0IHNob3VsZCBhbHdheXMgYmUgb25lIGxlc3MgdGhhbiBhbiBpbnRlZ3JhbCBt
dWx0aXBsZSBvZgo+ICAgZWlnaHQgKHRoYXQgaXMsIDhOIOKAkyAxKS4KCllvdSBhcmUgcmlnaHQs
IEkgd2lsbCBmaXggdGhhdCwgdGhhbmtzLgoKUmVnYXJkcywKCglKb2VyZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
