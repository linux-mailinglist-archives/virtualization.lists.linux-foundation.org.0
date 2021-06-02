Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CFA3980D8
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 07:59:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26857605DE;
	Wed,  2 Jun 2021 05:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX7sdVW4dKqp; Wed,  2 Jun 2021 05:59:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38126064C;
	Wed,  2 Jun 2021 05:59:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79F3DC0001;
	Wed,  2 Jun 2021 05:59:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75AC0C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 05:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D28882A9D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 05:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDiYAph0v8Gw
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 05:59:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE0EF82A7F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 05:59:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB97D61027;
 Wed,  2 Jun 2021 05:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622613570;
 bh=WFGn28PIenT8iwgpyo1Uh1UYGjMQG1gWUpqwqXSvJlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PfDD9zftySnlohgnH0popDk3aWgGYjbEafnbJopaPd7jvH+1yCL5jnQgWlZ2ahGI/
 34+u5QMuxWSbIYs+srYytLppF3vvE37DCrQquvxNh6bFaEUvCVJuvNVol36aXBnXd9
 2+V11/33toVh4lB/DD3MH/exJbS8sHyeTWICoCjUXdNtaHyPnXYTiUYG59NWugIJuk
 tEboug6LCa/Y5ByPtTBuFNgq9A2g5pbrmZpCbuW6Hr9o7nkHNglUBqVy009PIYUkvD
 dhlkBkRWpo5G+bN9nSd9y2mbpvEf9H6yCrMiSqRsQuPMyaM/9V4L9K44Dgz2mmvkdF
 ota0lbaMbWaLQ==
Date: Wed, 2 Jun 2021 08:59:26 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio_net: Remove BUG() to aviod machine dead
Message-ID: <YLcePtKhnt9gXq8E@unreal>
References: <a351fbe1-0233-8515-2927-adc826a7fb94@linux.alibaba.com>
 <20210518055336-mutt-send-email-mst@kernel.org>
 <4aaf5125-ce75-c72a-4b4a-11c91cb85a72@linux.alibaba.com>
 <72f284c6-b2f5-a395-a68f-afe801eb81be@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72f284c6-b2f5-a395-a68f-afe801eb81be@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Xianting Tian <xianting.tian@linux.alibaba.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kuba@kernel.org, davem@davemloft.net
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

T24gVHVlLCBNYXkgMjUsIDIwMjEgYXQgMDI6MTk6MDNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiDlnKggMjAyMS81LzE5IOS4i+WNiDEwOjE4LCBYaWFudGluZyBUaWFuIOWGmemBkzoK
PiA+IHRoYW5rcywgSSBzdWJtaXQgdGhlIHBhdGNoIGFzIGNvbW1lbnRlZCBieSBBbmRyZXcKPiA+
IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzUvMTgvMjU2Cj4gPiAKPiA+IEFjdHVhbGx5LCBp
ZiB4bWl0X3NrYigpIHJldHVybnMgZXJyb3IsIGJlbG93IGNvZGUgd2lsbCBnaXZlIGEgd2Fybmlu
Zwo+ID4gd2l0aCBlcnJvciBjb2RlLgo+ID4gCj4gPiDCoMKgwqDCoC8qIFRyeSB0byB0cmFuc21p
dCAqLwo+ID4gwqDCoMKgwqBlcnIgPSB4bWl0X3NrYihzcSwgc2tiKTsKPiA+IAo+ID4gwqDCoMKg
wqAvKiBUaGlzIHNob3VsZCBub3QgaGFwcGVuISAqLwo+ID4gwqDCoMKgwqBpZiAodW5saWtlbHko
ZXJyKSkgewo+ID4gwqDCoMKgwqDCoMKgwqAgZGV2LT5zdGF0cy50eF9maWZvX2Vycm9ycysrOwo+
ID4gwqDCoMKgwqDCoMKgwqAgaWYgKG5ldF9yYXRlbGltaXQoKSkKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X3dhcm4oJmRldi0+ZGV2LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIlVuZXhwZWN0ZWQgVFhRICglZCkgcXVldWUgZmFpbHVyZTogJWRcbiIsCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxbnVtLCBlcnIpOwo+ID4gwqDCoMKgwqDC
oMKgwqAgZGV2LT5zdGF0cy50eF9kcm9wcGVkKys7Cj4gPiDCoMKgwqDCoMKgwqDCoCBkZXZfa2Zy
ZWVfc2tiX2FueShza2IpOwo+ID4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5FVERFVl9UWF9PSzsK
PiA+IMKgwqDCoMKgfQo+ID4gCj4gPiAKPiA+IAo+ID4gCj4gPiAKPiA+IOWcqCAyMDIxLzUvMTgg
5LiL5Y2INTo1NCwgTWljaGFlbCBTLiBUc2lya2luIOWGmemBkzoKPiA+ID4gdHlwbyBpbiBzdWJq
ZWN0Cj4gPiA+IAo+ID4gPiBPbiBUdWUsIE1heSAxOCwgMjAyMSBhdCAwNTo0Njo1NlBNICswODAw
LCBYaWFudGluZyBUaWFuIHdyb3RlOgo+ID4gPiA+IFdoZW4gbWV0IGVycm9yLCB3ZSBvdXRwdXQg
YSBwcmludCB0byBhdm9pZCBhIEJVRygpLgo+IAo+IAo+IFNvIHlvdSBkb24ndCBleHBsYWluIHdo
eSB5b3UgbmVlZCB0byByZW1vdmUgQlVHKCkuIEkgdGhpbmsgaXQgZGVzZXJ2ZSBhCj4gQlVHKCku
CgpCVUcoKSB3aWxsIGNyYXNoIHRoZSBtYWNoaW5lIGFuZCB2aXJ0aW9fbmV0IGlzIG5vdCBrZXJu
ZWwgY29yZQpmdW5jdGlvbmFsaXR5IHRoYXQgbXVzdCBzdG9wIHRoZSBtYWNoaW5lIHRvIHByZXZl
bnQgYW55dGhpbmcgdHJ1bHkKaGFybWZ1bCBhbmQgYmFzaWMuCgpJIHdvdWxkIGFyZ3VlIHRoYXQg
Y29kZSBpbiBkcml2ZXJzLyogc2hvdWxkbid0IGNhbGwgQlVHKCkgbWFjcm9zIGF0IGFsbC4KCklm
IGl0IGlzIGltcG9zc2libGUsIGRvbid0IGNoZWNrIGZvciB0aGF0IG9yIGFkZCBXQVJOX09OKCkg
YW5kIHJlY292ZXIsCmJ1dCBkb24ndCBjcmFzaCB3aG9sZSBzeXN0ZW0uCgpUaGFua3MKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
