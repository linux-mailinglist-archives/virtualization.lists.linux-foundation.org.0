Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8911C105
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 05:38:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8613AB9E;
	Tue, 14 May 2019 03:38:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 92062B6C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 03:38:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2D20927B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 03:38:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95D9B307D92F;
	Tue, 14 May 2019 03:38:15 +0000 (UTC)
Received: from [10.72.12.59] (ovpn-12-59.pek2.redhat.com [10.72.12.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 815F2608BB;
	Tue, 14 May 2019 03:38:06 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] vsock/virtio: increase RX buffer size to 64 KiB
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-8-sgarzare@redhat.com>
	<bf0416f1-0e69-722d-75ce-3d101e6d7d71@redhat.com>
	<20190513175138.4yycad2xi65komw6@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fd934a4c-f7d2-8a04-ed93-a3b690ed0d79@redhat.com>
Date: Tue, 14 May 2019 11:38:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513175138.4yycad2xi65komw6@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 14 May 2019 03:38:15 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvNS8xNCDkuIrljYgxOjUxLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gT24g
TW9uLCBNYXkgMTMsIDIwMTkgYXQgMDY6MDE6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS81LzEwIOS4i+WNiDg6NTgsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4+
IEluIG9yZGVyIHRvIGluY3JlYXNlIGhvc3QgLT4gZ3Vlc3QgdGhyb3VnaHB1dCB3aXRoIGxhcmdl
IHBhY2tldHMsCj4+PiB3ZSBjYW4gdXNlIDY0IEtpQiBSWCBidWZmZXJzLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnphcmVAcmVkaGF0LmNvbT4KPj4+IC0t
LQo+Pj4gICAgaW5jbHVkZS9saW51eC92aXJ0aW9fdnNvY2suaCB8IDIgKy0KPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW9f
dnNvY2suaAo+Pj4gaW5kZXggODRiNzIwMjZkMzI3Li41YTlkMjViZTcyZGYgMTAwNjQ0Cj4+PiAt
LS0gYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4
L3ZpcnRpb192c29jay5oCj4+PiBAQCAtMTAsNyArMTAsNyBAQAo+Pj4gICAgI2RlZmluZSBWSVJU
SU9fVlNPQ0tfREVGQVVMVF9NSU5fQlVGX1NJWkUJMTI4Cj4+PiAgICAjZGVmaW5lIFZJUlRJT19W
U09DS19ERUZBVUxUX0JVRl9TSVpFCQkoMTAyNCAqIDI1NikKPj4+ICAgICNkZWZpbmUgVklSVElP
X1ZTT0NLX0RFRkFVTFRfTUFYX0JVRl9TSVpFCSgxMDI0ICogMjU2KQo+Pj4gLSNkZWZpbmUgVklS
VElPX1ZTT0NLX0RFRkFVTFRfUlhfQlVGX1NJWkUJKDEwMjQgKiA0KQo+Pj4gKyNkZWZpbmUgVklS
VElPX1ZTT0NLX0RFRkFVTFRfUlhfQlVGX1NJWkUJKDEwMjQgKiA2NCkKPj4+ICAgICNkZWZpbmUg
VklSVElPX1ZTT0NLX01BWF9CVUZfU0laRQkJMHhGRkZGRkZGRlVMCj4+PiAgICAjZGVmaW5lIFZJ
UlRJT19WU09DS19NQVhfUEtUX0JVRl9TSVpFCQkoMTAyNCAqIDY0KQo+Pgo+PiBXZSBwcm9iYWJs
eSBkb24ndCB3YW50IHN1Y2ggaGlnaCBvcmRlciBhbGxvY2F0aW9uLiBJdCdzIGJldHRlciB0byBz
d2l0Y2ggdG8KPj4gdXNlIG9yZGVyIDAgcGFnZXMgaW4gdGhpcyBjYXNlLiBTZWUgYWRkX3JlY3Zi
dWZfYmlnKCkgZm9yIHZpcnRpby1uZXQuIElmIHdlCj4+IGdldCBkYXRhcGF0aCB1bmlmaWVkLCB3
ZSB3aWxsIGdldCBtb3JlIHN0dWZmcyBzZXQuCj4gSUlVQywgeW91IGFyZSBzdWdnZXN0aW5nIHRv
IGFsbG9jYXRlIG9ubHkgcGFnZXMgYW5kIHB1dCB0aGVtIGluIGEKPiBzY2F0dGVybGlzdCwgdGhl
biBhZGQgdGhlbSB0byB0aGUgdmlydHF1ZXVlLgo+Cj4gSXMgaXQgY29ycmVjdD8KCgpZZXMgc2lu
Y2UgeW91IGFyZSB1c2luZzoKCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGt0LT5i
dWYgPSBrbWFsbG9jKGJ1Zl9sZW4sIEdGUF9LRVJORUwpOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghcGt0LT5idWYpIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdmlydGlvX3RyYW5zcG9ydF9mcmVlX3BrdChwa3QpOwogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9CgpUaGlzIGlzIGxpa2VseSB0byBmYWlsIHdoZW4gdGhl
IG1lbW9yeSBpcyBmcmFnbWVudGVkIHdoaWNoIGlzIGtpbmQgb2YgCmZyYWdpbGUuCgoKPgo+IFRo
ZSBpc3N1ZSB0aGF0IEkgaGF2ZSBoZXJlLCBpcyB0aGF0IHRoZSB2aXJ0aW8tdnNvY2sgZ3Vlc3Qg
ZHJpdmVyLCBzZWUKPiB2aXJ0aW9fdnNvY2tfcnhfZmlsbCgpLCBhbGxvY2F0ZXMgYSBzdHJ1Y3Qg
dmlydGlvX3Zzb2NrX3BrdCB0aGF0Cj4gY29udGFpbnMgdGhlIHJvb20gZm9yIHRoZSBoZWFkZXIs
IHRoZW4gYWxsb2NhdGVzIHRoZSBidWZmZXIgZm9yIHRoZSBwYXlsb2FkLgo+IEF0IHRoaXMgcG9p
bnQgaXQgZmlsbHMgdGhlIHNjYXR0ZXJsaXN0IHdpdGggdGhlICZ2aXJ0aW9fdnNvY2tfcGt0Lmhk
ciBhbmQgdGhlCj4gYnVmZmVyIGZvciB0aGUgcGF5bG9hZC4KCgpUaGlzIHBhcnQgc2hvdWxkIGJl
IGZpbmUgc2luY2Ugd2hhdCBpcyBuZWVkZWQgaXMganVzdCBhZGRpbmcgbW9yZSBwYWdlcyAKdG8g
c2dbXSBhbmQgY2FsbCB2aXJ0dXFldWV1X2FkZF9zZygpLgoKCj4KPiBDaGFuZ2luZyB0aGlzIHdp
bGwgcmVxdWlyZSBzZXZlcmFsIG1vZGlmaWNhdGlvbnMsIGFuZCBpZiB3ZSBnZXQgZGF0YXBhdGgK
PiB1bmlmaWVkLCBJJ20gbm90IHN1cmUgaXQncyB3b3J0aCBpdC4KPiBPZiBjb3Vyc2UsIGlmIHdl
IGxlYXZlIHRoZSBkYXRhcGF0aHMgc2VwYXJhdGVkLCBJJ2QgbGlrZSB0byBkbyB0aGF0IGxhdGVy
Lgo+Cj4gV2hhdCBkbyB5b3UgdGhpbms/CgoKRm9yIHRoZSBkcml2ZXIgaXQgc2VsZiwgaXQgc2hv
dWxkIG5vdCBiZSBoYXJkLiBCdXQgSSB0aGluayB5b3UgbWVhbiB0aGUgCmlzc3VlIG9mIGUuZyB2
aXJ0aW9fdnNvY2tfcGt0IGl0c2VsZiB3aGljaCBkb2Vzbid0IHN1cHBvcnQgc2cuIEZvciBzaG9y
dCAKdGltZSwgbWF5YmUgd2UgY2FuIHVzZSBrdmVjIGluc3RlYWQuCgpUaGFua3MKCgo+Cj4gVGhh
bmtzLAo+IFN0ZWZhbm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
