Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F1B5B7B
	for <lists.virtualization@lfdr.de>; Wed, 18 Sep 2019 07:59:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 96BEEC03;
	Wed, 18 Sep 2019 05:58:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 75344A7F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 05:58:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2B2B1711
	for <virtualization@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 05:58:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98E773083363;
	Wed, 18 Sep 2019 05:58:56 +0000 (UTC)
Received: from [10.72.12.111] (ovpn-12-111.pek2.redhat.com [10.72.12.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72118600C8;
	Wed, 18 Sep 2019 05:58:44 +0000 (UTC)
Subject: Re: [RFC PATCH 2/4] mdev: introduce helper to set per device dma ops
To: Alex Williamson <alex.williamson@redhat.com>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-3-jasowang@redhat.com>
	<20190917130044.4fb97637@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f0df968e-9322-829a-11c7-ca62408b9bae@redhat.com>
Date: Wed, 18 Sep 2019 13:58:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917130044.4fb97637@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 18 Sep 2019 05:58:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	cohuck@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	xiao.w.wang@intel.com, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, haotian.wang@sifive.com,
	idos@mellanox.com, rob.miller@broadcom.com
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

Ck9uIDIwMTkvOS8xOCDkuIrljYgzOjAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gVHVl
LCAxMCBTZXAgMjAxOSAxNjoxOTozMyArMDgwMAo+IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0
LmNvbT4gIHdyb3RlOgo+Cj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBtZGV2X3NldF9kbWFfb3Bz
KCkgd2hpY2ggYWxsb3dzIHBhcmVudCB0byBzZXQKPj4gcGVyIGRldmljZSBETUEgb3BzLiBUaGlz
IGhlbHAgZm9yIHRoZSBrZXJuZWwgZHJpdmVyIHRvIHNldHVwIGEgY29ycmVjdAo+PiBETUEgbWFw
cGluZ3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNv
bT4KPj4gLS0tCj4+ICAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgfCA3ICsrKysrKysK
Pj4gICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICB8IDIgKysKPj4gICAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21k
ZXYvbWRldl9jb3JlLmMgYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+PiBpbmRleCBi
NTU4ZDRjZmQwODIuLmViMjg1NTIwODJkNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92ZmlvL21k
ZXYvbWRldl9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPj4g
QEAgLTEzLDYgKzEzLDcgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvdXVpZC5oPgo+PiAgICNpbmNs
dWRlIDxsaW51eC9zeXNmcy5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9tZGV2Lmg+Cj4+ICsjaW5j
bHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPj4gICAKPj4gICAjaW5jbHVkZSAibWRldl9wcml2
YXRlLmgiCj4+ICAgCj4+IEBAIC0yNyw2ICsyOCwxMiBAQCBzdGF0aWMgc3RydWN0IGNsYXNzX2Nv
bXBhdCAqbWRldl9idXNfY29tcGF0X2NsYXNzOwo+PiAgIHN0YXRpYyBMSVNUX0hFQUQobWRldl9s
aXN0KTsKPj4gICBzdGF0aWMgREVGSU5FX01VVEVYKG1kZXZfbGlzdF9sb2NrKTsKPj4gICAKPj4g
K3ZvaWQgbWRldl9zZXRfZG1hX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHN0cnVjdCBk
bWFfbWFwX29wcyAqb3BzKQo+PiArewo+PiArCXNldF9kbWFfb3BzKCZtZGV2LT5kZXYsIG9wcyk7
Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MKG1kZXZfc2V0X2RtYV9vcHMpOwo+PiArCj4gV2h5IGRv
ZXMgbWRldiBuZWVkIHRvIGJlIGludm9sdmVkIGhlcmU/ICBZb3VyIHNhbXBsZSBkcml2ZXIgaW4g
NC80IGNhbGxzCj4gdGhpcyBmcm9tIGl0cyBjcmVhdGUgY2FsbGJhY2ssIHdoZXJlIGl0IGNvdWxk
IGp1c3QgYXMgZWFzaWx5IGNhbGw6Cj4KPiAgICBzZXRfZG1hX29wcyhtZGV2X2RldihtZGV2KSwg
b3BzKTsKPgo+IFRoYW5rcywKPiBBbGV4CgoKWWVzLCBsZXQgbWUgd2l0aGRyYXcgdGhpcyBwYXRj
aC4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
