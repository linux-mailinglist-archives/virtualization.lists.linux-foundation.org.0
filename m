Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C4388163F85
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 09:43:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4260185DFD;
	Wed, 19 Feb 2020 08:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggm07oV3jRbG; Wed, 19 Feb 2020 08:43:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B628385DF6;
	Wed, 19 Feb 2020 08:43:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F4DCC013E;
	Wed, 19 Feb 2020 08:43:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63D4FC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 08:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4D06420020
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 08:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8g1vaXIh+RxW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 08:43:49 +0000 (UTC)
X-Greylist: delayed 00:14:04 by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id DBD401FC94
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 08:43:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15EADAD46;
 Wed, 19 Feb 2020 08:29:42 +0000 (UTC)
Subject: Re: [PATCH] x86/ioperm: add new paravirt function update_io_bitmap
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
 <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1617641-2106-cd81-628f-569b1a8cf1f7@suse.com>
Date: Wed, 19 Feb 2020 09:29:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
Content-Language: en-US
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

T24gMTkuMDIuMjAyMCAwNjozNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxOC4wMi4yMCAy
MjowMywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyaXRlczoKPj4+IENvbW1pdCAxMTFlN2IxNWNmMTBmNiAoIng4Ni9pb3Blcm06IEV4
dGVuZCBJT1BMIGNvbmZpZyB0byBjb250cm9sCj4+PiBpb3Blcm0oKSBhcyB3ZWxsIikgcmV3b3Jr
ZWQgdGhlIGlvcGwgc3lzY2FsbCB0byB1c2UgSS9PIGJpdG1hcHMuCj4+Pgo+Pj4gVW5mb3J0dW5h
dGVseSB0aGlzIGJyb2tlIFhlbiBQViBkb21haW5zIHVzaW5nIHRoYXQgc3lzY2FsbCBhcyB0aGVy
ZQo+Pj4gaXMgY3VycmVudGx5IG5vIEkvTyBiaXRtYXAgc3VwcG9ydCBpbiBQViBkb21haW5zLgo+
Pj4KPj4+IEFkZCBJL08gYml0bWFwIHN1cHBvcnQgdmlhIGEgbmV3IHBhcmF2aXJ0IGZ1bmN0aW9u
IHVwZGF0ZV9pb19iaXRtYXAKPj4+IHdoaWNoIFhlbiBQViBkb21haW5zIGNhbiB1c2UgdG8gdXBk
YXRlIHRoZWlyIEkvTyBiaXRtYXBzIHZpYSBhCj4+PiBoeXBlcmNhbGwuCj4+Pgo+Pj4gRml4ZXM6
IDExMWU3YjE1Y2YxMGY2ICgieDg2L2lvcGVybTogRXh0ZW5kIElPUEwgY29uZmlnIHRvIGNvbnRy
b2wgaW9wZXJtKCkgYXMgd2VsbCIpCj4+PiBSZXBvcnRlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+Pj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuNQo+Pj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IFRlc3RlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBEdWgsIHNvcnJ5IGFib3V0IHRoYXQg
YW5kIHRoYW5rcyBmb3IgZml4aW5nIGl0Lgo+Pgo+PiBCVFcsIHdoeSBpc24ndCBzdHVmZiBsaWtl
IHRoaXMgbm90IGNhdGNoZWQgZHVyaW5nIG5leHQgb3IgYXQgbGVhc3QKPj4gYmVmb3JlIHRoZSBm
aW5hbCByZWxlYXNlPyBJcyBub3RoaW5nIHJ1bm5pbmcgQ0kgb24gdXBzdHJlYW0gd2l0aCBhbGwK
Pj4gdGhhdCBYRU4gbXVjayBhY3RpdmU/Cj4gCj4gVGhpcyBwcm9ibGVtIHNob3dlZCB1cCBieSBu
b3QgYmVpbmcgYWJsZSB0byBzdGFydCB0aGUgWCBzZXJ2ZXIgKHByb2JhYmx5Cj4gbm90IHRoZSBm
cmVzaGVzdCBvbmUpIGluIGRvbTAgb24gYSBtb2RlcmF0ZSBhZ2VkIEFNRCBzeXN0ZW0uCgpOb3Qg
dGhlIGZyZXNoZXN0IG9uZSwgeWVzLCBidXQgYWxzbyBvbiBhIHN5c3RlbSB3aGVyZSBLTVMgd291
bGQgbm90CmJlIGF2YWlsYWJsZSAobXkgc3VjY2VzcyByYXRlIHdpdGggS01TIGlzIHJhdGhlciBs
b3cgb3ZlcmFsbCwgYW5kCndpdGggbmV3ZXIgTGludXggSSBzZWUgcmF0aGVyIG1vcmUgc3lzdGVt
cyB0byBzdG9wIHdvcmtpbmcgdGhhbiBvbmVzCnRvIGJlY29tZSB3b3JraW5nLCBidXQgSSBzaW1w
bHkgZG9uJ3QgaGF2ZSB0aGUgdGltZSB0byBpbnZlc3RpZ2F0ZSkuCgpKYW4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
