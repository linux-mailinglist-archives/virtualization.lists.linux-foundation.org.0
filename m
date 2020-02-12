Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5115AC04
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 16:36:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5A3285D8F;
	Wed, 12 Feb 2020 15:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AfZ0TGkQzKT; Wed, 12 Feb 2020 15:36:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99EC18545F;
	Wed, 12 Feb 2020 15:36:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75994C0177;
	Wed, 12 Feb 2020 15:36:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F31E2C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 15:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EB0E220013
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 15:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-tiKofejXH3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 15:36:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 60F1F20362
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 15:36:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 56BB03D3; Wed, 12 Feb 2020 16:36:19 +0100 (CET)
Date: Wed, 12 Feb 2020 16:36:17 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 46/62] x86/sev-es: Handle INVD Events
Message-ID: <20200212153617.GD22063@8bytes.org>
References: <20200211135256.24617-47-joro@8bytes.org>
 <EA510462-A43C-4F7E-BFE8-B212003B3627@amacapital.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EA510462-A43C-4F7E-BFE8-B212003B3627@amacapital.net>
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

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDQ6MTI6MTlQTSAtMDgwMCwgQW5keSBMdXRvbWlyc2tp
IHdyb3RlOgo+IAo+IAo+ID4gT24gRmViIDExLCAyMDIwLCBhdCA1OjUzIEFNLCBKb2VyZyBSb2Vk
ZWwgPGpvcm9AOGJ5dGVzLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IO+7v0Zyb206IFRvbSBMZW5kYWNr
eSA8dGhvbWFzLmxlbmRhY2t5QGFtZC5jb20+Cj4gPiAKPiA+IEltcGxlbWVudCBhIGhhbmRsZXIg
Zm9yICNWQyBleGNlcHRpb25zIGNhdXNlZCBieSBJTlZEIGluc3RydWN0aW9ucy4KPiAKPiBVaCwg
d2hhdD8gIFN1cmVseSB0aGUgI1ZDIGNvZGUgY2FuIGhhdmUgYSBjYXRjaC1hbGwgT09QUyBwYXRo
IGZvciB0aGluZ3MgbGlrZSB0aGlzLiBMaW51eCBzaG91bGQgbmV2ZXIgZXZlciBkbyBJTlZELgoK
UmlnaHQsIGl0cyBoYXJkIHRvIGNvbWUgdXAgd2l0aCBhIHZhbGlkIHVzZS1jYXNlIGZvciBJTlZE
IGluIHRoZSBMaW51eAprZXJuZWwuIEkgY2hhbmdlZCB0aGUgcGF0Y2ggdG8gbWFyayBJTlZEIGFz
IHVuc3VwcG9ydGVkIGFuZCBwcmludCBhbgplcnJvciBtZXNzYWdlLgoKUmVnYXJkcywKCglKb2Vy
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
