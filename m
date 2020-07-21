Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD3228BD9
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 00:12:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E157520443;
	Tue, 21 Jul 2020 22:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MW1l6BDexj4g; Tue, 21 Jul 2020 22:12:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D2618203E2;
	Tue, 21 Jul 2020 22:12:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA4C3C016F;
	Tue, 21 Jul 2020 22:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E984C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 22:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0D3D985C4C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 22:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbRtqlUFKOIP
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 22:12:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 97A7E85A00
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 22:12:53 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0005020717;
 Tue, 21 Jul 2020 22:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595369573;
 bh=dI9lxg58mjt0Vo60nW5Ycuenb3uhXCAR65ohWNLBhS4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=I/T/JAJuBiE5B7+bWgqxLEL/wIxAmm5LpWcCGwR20MNg7LBKmtL+VWlV6Cfj7QmrK
 T4UJl7jjdx3a3KyQJJlTe77bbPwZHG6/ynI+NNuY9INqcY0DBbA2DjGbTRetMP1qA+
 DjTGHTlTwjtO6v2YCYy4eIRCWLhq7AjxqJiECnyM=
Date: Tue, 21 Jul 2020 17:12:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] virtio-mmio: Reject invalid IRQ 0 command line
 argument
Message-ID: <20200721221251.GA1164301@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <032d0424-4876-6322-76d2-d733db28addb@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>
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

T24gVGh1LCBKdWwgMDIsIDIwMjAgYXQgMTE6MDY6MTFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDIwLzcvMiDkuIrljYg2OjEwLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gRnJv
bTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiA+IAo+ID4gVGhlICJ2aXJ0
aW9fbW1pby5kZXZpY2U9IiBjb21tYW5kIGxpbmUgYXJndW1lbnQgYWxsb3dzIGEgdXNlciB0byBz
cGVjaWZ5Cj4gPiB0aGUgc2l6ZSwgYWRkcmVzcywgYW5kIElSUSBvZiBhIHZpcnRpbyBkZXZpY2Uu
ICBQcmV2aW91c2x5IHRoZSBvbmx5Cj4gPiByZXF1aXJlbWVudCBmb3IgdGhlIElSUSB3YXMgdGhh
dCBpdCBiZSBhbiB1bnNpZ25lZCBpbnRlZ2VyLgo+ID4gCj4gPiBaZXJvIGlzIGFuIHVuc2lnbmVk
IGludGVnZXIgYnV0IGFuIGludmFsaWQgSVJRIG51bWJlciwgYW5kIGFmdGVyCj4gPiBhODVhNmM4
NmMyNWJlICgiZHJpdmVyIGNvcmU6IHBsYXRmb3JtOiBDbGFyaWZ5IHRoYXQgSVJRIDAgaXMgaW52
YWxpZCIpLAo+ID4gYXR0ZW1wdHMgdG8gdXNlIElSUSAwIGNhdXNlIHdhcm5pbmdzLgo+ID4gCj4g
PiBJZiB0aGUgdXNlciBzcGVjaWZpZXMgSVJRIDAsIHJldHVybiBmYWlsdXJlIGluc3RlYWQgb2Yg
cmVnaXN0ZXJpbmcgYSBkZXZpY2UKPiA+IHdpdGggSVJRIDAuCj4gPiAKPiA+IEZpeGVzOiBhODVh
NmM4NmMyNWJlICgiZHJpdmVyIGNvcmU6IHBsYXRmb3JtOiBDbGFyaWZ5IHRoYXQgSVJRIDAgaXMg
aW52YWxpZCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29n
bGUuY29tPgo+ID4gQ2M6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiBD
YzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+IENjOiB2aXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvdmlydGlv
L3ZpcnRpb19tbWlvLmMgfCA0ICsrLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlv
L3ZpcnRpb19tbWlvLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5jCj4gPiBpbmRleCA5
ZDE2YWFmZmNhOWQuLjYyN2FjMDQ4NzQ5NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlv
L3ZpcnRpb19tbWlvLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiA+
IEBAIC02NDEsMTEgKzY0MSwxMSBAQCBzdGF0aWMgaW50IHZtX2NtZGxpbmVfc2V0KGNvbnN0IGNo
YXIgKmRldmljZSwKPiA+ICAgCQkJJnZtX2NtZGxpbmVfaWQsICZjb25zdW1lZCk7Cj4gPiAgIAkv
Kgo+ID4gLQkgKiBzc2NhbmYoKSBtdXN0IHByb2Nlc3NlcyBhdCBsZWFzdCAyIGNodW5rczsgYWxz
byB0aGVyZQo+ID4gKwkgKiBzc2NhbmYoKSBtdXN0IHByb2Nlc3MgYXQgbGVhc3QgMiBjaHVua3M7
IGFsc28gdGhlcmUKPiA+ICAgCSAqIG11c3QgYmUgbm8gZXh0cmEgY2hhcmFjdGVycyBhZnRlciB0
aGUgbGFzdCBjaHVuaywgc28KPiA+ICAgCSAqIHN0cltjb25zdW1lZF0gbXVzdCBiZSAnXDAnCj4g
PiAgIAkgKi8KPiA+IC0JaWYgKHByb2Nlc3NlZCA8IDIgfHwgc3RyW2NvbnN1bWVkXSkKPiA+ICsJ
aWYgKHByb2Nlc3NlZCA8IDIgfHwgc3RyW2NvbnN1bWVkXSB8fCBpcnEgPT0gMCkKPiA+ICAgCQly
ZXR1cm4gLUVJTlZBTDsKPiA+ICAgCXJlc291cmNlc1swXS5mbGFncyA9IElPUkVTT1VSQ0VfTUVN
Owo+IAo+IEFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKVGhhbmtz
LCBJIGFwcGxpZWQgdGhpcyB0byBteSBmb3ItbGludXMgYnJhbmNoIGZvciB2NS44LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
