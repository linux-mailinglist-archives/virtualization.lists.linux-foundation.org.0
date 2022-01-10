Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9314890B2
	for <lists.virtualization@lfdr.de>; Mon, 10 Jan 2022 08:24:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFDA0408EA;
	Mon, 10 Jan 2022 07:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilPNxNzv6igg; Mon, 10 Jan 2022 07:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9BE24408E9;
	Mon, 10 Jan 2022 07:24:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07359C006E;
	Mon, 10 Jan 2022 07:24:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B36EC001E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 07:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11A1D60C00
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 07:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Fq2qDVKVx2X
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 07:23:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9092F60B71
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 07:23:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V1OfbT6_1641799434; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V1OfbT6_1641799434) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 10 Jan 2022 15:23:55 +0800
MIME-Version: 1.0
message-id: <1641799153.8704977-1-xuanzhuo@linux.alibaba.com>
subject: Re: [PATCH 2/6] virtio: split: alloc indirect desc with extra
date: Mon, 10 Jan 2022 15:19:13 +0800
from: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
to: Jason Wang <jasowang@redhat.com>
in-reply-to: <c649faa9-aa1f-e5ff-a448-0abce38eeff9@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

T24gTW9uLCAxMCBKYW4gMjAyMiAxNDo0MzozOSArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiDlnKggMjAyMi8xLzcg5LiL5Y2IMjozMywgWHVhbiBaaHVv
IOWGmemBkzoKPiA+IEluIHRoZSBzY2VuYXJpbyB3aGVyZSBpbmRpcmVjdCBpcyBub3QgdXNlZCwg
ZWFjaCBkZXNjIGNvcnJlc3BvbmRzIHRvIGFuCj4gPiBleHRyYSwgd2hpY2ggaXMgdXNlZCB0byBy
ZWNvcmQgaW5mb3JtYXRpb24gc3VjaCBhcyBkbWEsIGZsYWdzLCBhbmQKPiA+IG5leHQuCj4gPgo+
ID4gSW4gdGhlIHNjZW5hcmlvIG9mIHVzaW5nIGluZGlyZWN0LCB0aGUgYXNzaWduZWQgZGVzYyBk
b2VzIG5vdCBoYXZlIHRoZQo+ID4gY29ycmVzcG9uZGluZyBleHRyYSByZWNvcmQgZG1hIGluZm9y
bWF0aW9uLCBhbmQgdGhlIGRtYSBpbmZvcm1hdGlvbiBtdXN0Cj4gPiBiZSBvYnRhaW5lZCBmcm9t
IHRoZSBkZXNjIHdoZW4gdW5tYXAuCj4gPgo+ID4gVGhpcyBwYXRjaCBhbGxvY2F0ZXMgdGhlIGNv
cnJlc3BvbmRpbmcgZXh0cmEgYXJyYXkgd2hlbiBpbmRpcmVjdCBkZXNjIGlzCj4gPiBhbGxvY2F0
ZWQuIFRoaXMgaGFzIHRoZXNlIGFkdmFudGFnZXM6Cj4gPiAxLiBSZWNvcmQgdGhlIGRtYSBpbmZv
cm1hdGlvbiBvZiBkZXNjLCBubyBuZWVkIHRvIHJlYWQgZGVzYyB3aGVuIHVubWFwCj4gPiAyLiBJ
dCB3aWxsIGJlIG1vcmUgY29udmVuaWVudCBhbmQgdW5pZmllZCBpbiBwcm9jZXNzaW5nCj4gPiAz
LiBTb21lIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gY2FuIGJlIHJlY29yZGVkIGluIGV4dHJhLCB3
aGljaCB3aWxsIGJlCj4gPiAgICAgdXNlZCBpbiBzdWJzZXF1ZW50IHBhdGNoZXMuCj4KPgo+IFR3
byBxdWVzdGlvbnM6Cj4KPiAxKSBJcyB0aGVyZSBhbnkgcGVyZm9ybWFuY2UgbnVtYmVyIGZvciB0
aGlzIGNoYW5nZT8gSSBndWVzcyBpdCBnaXZlcwo+IG1vcmUgc3RyZXNzIG9uIHRoZSBjYWNoZS4K
Ckkgd2lsbCBhZGQgcGVyZm9ybWFuY2UgdGVzdCBkYXRhIGluIHRoZSBuZXh0IHZlcnNpb24uCgo+
IDIpIElzIHRoZXJlIGEgcmVxdWlyZW1lbnQgdG8gbWl4IHRoZSBwcmUgbWFwcGVkIHNnIHdpdGgg
dW5tYXBwZWQgc2c/IElmCj4gbm90LCBhIHBlciB2aXJ0cXVldWUgZmxhZyBsb29rcyBzdWZmaWNp
ZW50CgpUaGVyZSBpcyB0aGlzIHJlcXVpcmVtZW50LiBGb3IgZXhhbXBsZSwgaW4gdGhlIGNhc2Ug
b2YgQUZfWERQLCBhIHBhdGNrZXQKY29udGFpbnMgdHdvIHBhcnRzLCBvbmUgaXMgdmlydGlvX25l
dF9oZHIsIGFuZCB0aGUgb3RoZXIgaXMgdGhlIGFjdHVhbCBkYXRhCnBhY2tldCBmcm9tIEFGX1hE
UC4gVGhlIGZvcm1lciBpcyB1bm1hcHBlZCBzZywgYW5kIHRoZSBsYXR0ZXIgaXMgcHJlIG1hcHBl
ZCBzZy4KClRoYW5rcy4KCj4KPiBUaGFua3MKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
