Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 440B315AA97
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 14:59:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C87FA86961;
	Wed, 12 Feb 2020 13:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id us-HCO3PP+K7; Wed, 12 Feb 2020 13:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6771186B6F;
	Wed, 12 Feb 2020 13:59:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4832BC0177;
	Wed, 12 Feb 2020 13:59:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07F60C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EB1D1840BF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4txZR2bx4TP
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:59:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6648F84069
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:59:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BE6EC20E; Wed, 12 Feb 2020 14:59:42 +0100 (CET)
Date: Wed, 12 Feb 2020 14:59:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [RFC PATCH 00/62] Linux as SEV-ES Guest Support
Message-ID: <20200212135934.GL20066@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <BD48E405-8E3F-4EEE-A72A-8A7EDCB6A376@amacapital.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BD48E405-8E3F-4EEE-A72A-8A7EDCB6A376@amacapital.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDc6NDg6MTJQTSAtMDgwMCwgQW5keSBMdXRvbWlyc2tp
IHdyb3RlOgo+IAo+IAo+ID4gT24gRmViIDExLCAyMDIwLCBhdCA1OjUzIEFNLCBKb2VyZyBSb2Vk
ZWwgPGpvcm9AOGJ5dGVzLm9yZz4gd3JvdGU6Cj4gCj4gPiAKPiA+IAo+ID4gICAgKiBQdXR0aW5n
IHNvbWUgTk1JLWxvYWQgb24gdGhlIGd1ZXN0IHdpbGwgbWFrZSBpdCBjcmFzaCB1c3VhbGx5Cj4g
PiAgICAgIHdpdGhpbiBhIG1pbnV0ZQo+IAo+IFN1cHBvc2UgeW91IGRvIENQVUlEIG9yIHNvbWUg
TU1JTyBhbmQgZ2V0ICNWQy4gWW91IGZpbGwgaW4gdGhlIEdIQ0IgdG8KPiBhc2sgZm9yIGhlbHAu
IFNvbWUgdGltZSBiZXR3ZWVuIHdoZW4geW91IHN0YXJ0IGZpbGxpbmcgaXQgb3V0IGFuZCB3aGVu
Cj4geW91IGRvIFZNR0VYSVQsIHlvdSBnZXQgTk1JLiBJZiB0aGUgTk1JIGRvZXMgaXRzIG93biBH
SENCIGFjY2VzcyBbMF0sCj4gaXQgd2lsbCBjbG9iYmVyIHRoZSBvdXRlciAjVkPigJlhIHN0YXRl
LCByZXN1bHRpbmcgaW4gYSBmYWlsdXJlIHdoZW4KPiBWTUdFWElUIGhhcHBlbnMuIFRoZXJl4oCZ
cyBhIHJlbGF0ZWQgZmFpbHVyZSBtb2RlIGlmIHRoZSBOTUkgaXMgYWZ0ZXIKPiB0aGUgVk1HRVhJ
VCBidXQgYmVmb3JlIHRoZSByZXN1bHQgaXMgcmVhZC4KPiAKPiBJIHN1c3BlY3QgeW91IGNhbiBm
aXggdGhpcyBieSBzYXZpbmcgdGhlIEdIQ0IgYXQgdGhlIGJlZ2lubmluZyBvZgo+IGRvX25taSBh
bmQgcmVzdG9yaW5nIGl0IGF0IHRoZSBlbmQuIFRoaXMgaGFzIHRoZSBtYWpvciBjYXZlYXQgdGhh
dCBpdAo+IHdpbGwgbm90IHdvcmsgaWYgZG9fbm1pIGNvbWVzIGZyb20gdXNlciBtb2RlIGFuZCBz
Y2hlZHVsZXMsIGJ1dCBJCj4gZG9u4oCZdCBiZWxpZXZlIHRoaXMgY2FuIGhhcHBlbi4KPiAKPiBb
MF0gRHVlIHRvIHRoZSBOTUlfQ09NUExFVEUgY2F0YXN0cm9waGUsIHRoZXJlIGlzIGEgMTAwJSBj
aGFuY2UgdGhhdAo+IHRoaXMgaGFwcGVucy4KClZlcnkgdHJ1ZSwgdGhhbmsgeW91ISBZb3UgcHJv
YmFibHkgc2F2ZWQgbWUgYSBmZXcgaG91cnMgb2YgZGVidWdnaW5nCnRoaXMgZnVydGhlciA6KQpJ
IHdpbGwgaW1wbGVtZW50IGJldHRlciBoYW5kbGluZyBmb3IgbmVzdGVkICNWQyBleGNlcHRpb25z
LCB3aGljaApob3BlZnVsbHkgc29sdmVzIHRoZSBOTUkgY3Jhc2hlcy4KClRoYW5rcyBhZ2FpbiwK
CiAgICAgICBKb2VyZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
