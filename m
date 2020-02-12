Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B00515AD99
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 17:43:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 05D1D20780;
	Wed, 12 Feb 2020 16:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kXXx+KfUwAs; Wed, 12 Feb 2020 16:43:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 37C7B2076E;
	Wed, 12 Feb 2020 16:43:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25F3AC0177;
	Wed, 12 Feb 2020 16:43:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5016C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DBA7720778
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vealh04m5UQ2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:43:48 +0000 (UTC)
X-Greylist: delayed 00:15:21 by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id D47532076E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 16:43:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A042FB071;
 Wed, 12 Feb 2020 16:28:23 +0000 (UTC)
Subject: Re: [PATCH 23/62] x86/idt: Move IDT to data segment
To: Andy Lutomirski <luto@amacapital.net>, Joerg Roedel <joro@8bytes.org>
References: <20200212115516.GE20066@8bytes.org>
 <EEAC8672-C98F-45D0-9F2D-0802516C3908@amacapital.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <879ace44-cee3-98aa-0dff-549b69355096@suse.com>
Date: Wed, 12 Feb 2020 17:28:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <EEAC8672-C98F-45D0-9F2D-0802516C3908@amacapital.net>
Content-Language: en-US
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMTIuMDIuMjAgMTc6MjMsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPiAKPiAKPj4gT24gRmVi
IDEyLCAyMDIwLCBhdCAzOjU1IEFNLCBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz4gd3Jv
dGU6Cj4+Cj4+IO+7v09uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDAyOjQxOjI1UE0gLTA4MDAsIEFu
ZHkgTHV0b21pcnNraSB3cm90ZToKPj4+PiBPbiBUdWUsIEZlYiAxMSwgMjAyMCBhdCA1OjUzIEFN
IEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPiB3cm90ZToKPj4+Pgo+Pj4+IEZyb206IEpv
ZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgo+Pj4+Cj4+Pj4gV2l0aCBTRVYtRVMsIGV4Y2Vw
dGlvbiBoYW5kbGluZyBpcyBuZWVkZWQgdmVyeSBlYXJseSwgZXZlbiBiZWZvcmUgdGhlCj4+Pj4g
a2VybmVsIGhhcyBjbGVhcmVkIHRoZSBic3Mgc2VnbWVudC4gSW4gb3JkZXIgdG8gcHJldmVudCBj
bGVhcmluZyB0aGUKPj4+PiBjdXJyZW50bHkgdXNlZCBJRFQsIG1vdmUgdGhlIElEVCB0byB0aGUg
ZGF0YSBzZWdtZW50Lgo+Pj4KPj4+IFVnaC4gIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgbmVlZHMg
YSBjb21tZW50IGluIHRoZSBjb2RlLgo+Pgo+PiBZZXMsIHJpZ2h0LCBhZGRlZCBhIGNvbW1lbnQg
Zm9yIHRoYXQuCj4+Cj4+PiBJIGhhZCBhIHBhdGNoIHRvIGZpeCB0aGUga2VybmVsIEVMRiBsb2Fk
ZXIgdG8gY2xlYXIgQlNTLCB3aGljaCB3b3VsZAo+Pj4gZml4IHRoaXMgcHJvYmxlbSBvbmNlIGFu
ZCBmb3IgYWxsLCBidXQgaXQgZGlkbid0IHdvcmsgZHVlIHRvIHRoZSBtZXNzeQo+Pj4gd2F5IHRo
YXQgdGhlIGRlY29tcHJlc3NvciBoYW5kbGVzIG1lbW9yeS4gIEkgbmV2ZXIgZ290IGFyb3VuZCB0
bwo+Pj4gZml4aW5nIHRoaXMsIHNhZGx5Lgo+Pgo+PiBBcmVuJ3QgdGhlcmUgb3RoZXIgd2F5cyBv
ZiBib290aW5nIChYZW4tUFY/KSB3aGljaCBkb24ndCB1c2UgdGhlIGtlcm5lbAo+PiBFTEYgbG9h
ZGVyPwo+IAo+IER1bm5vLiBJIHdvdWxkIGhvcGUgdGhlIGFueSBzYW5lIGxvYWRlciB3b3VsZCBj
bGVhciBCU1MgYmVmb3JlIGV4ZWN1dGluZyBhbnl0aGluZy4gVGhpcyBpc27igJl0IGN1cnJlbnRs
eSB0aGUgY2FzZSwgdGhvdWdoLiBPaCB3ZWxsLgoKWGVuLVBWIGlzIGNsZWFyaW5nIEJTUyBhcyB0
aGUgdmVyeSBmaXJzdCBhY3Rpb24uCgoKSnVlcmdlbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
