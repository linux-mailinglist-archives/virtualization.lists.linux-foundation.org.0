Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 601788E8A1
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 11:55:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C56AE110A;
	Thu, 15 Aug 2019 09:55:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 489B010FD
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 09:55:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E18B987B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 09:55:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B76E804F2;
	Thu, 15 Aug 2019 09:55:29 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B425608AB;
	Thu, 15 Aug 2019 09:55:20 +0000 (UTC)
Subject: Re: [PATCH v2] virtio-net: lower min ring num_free for efficiency
To: ? jiang <jiangkidd@hotmail.com>, "mst@redhat.com" <mst@redhat.com>
References: <BYAPR14MB32058F4B2AD162F5421BB9B4A6AC0@BYAPR14MB3205.namprd14.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f26c808a-180a-6c85-637c-17629f2906e4@redhat.com>
Date: Thu, 15 Aug 2019 17:55:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB32058F4B2AD162F5421BB9B4A6AC0@BYAPR14MB3205.namprd14.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 15 Aug 2019 09:55:29 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	"yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Ck9uIDIwMTkvOC8xNSDkuIvljYg1OjQyLCA/IGppYW5nIHdyb3RlOgo+IFRoaXMgY2hhbmdlIGxv
d2VycyByaW5nIGJ1ZmZlciByZWNsYWltIHRocmVzaG9sZCBmcm9tIDEvMipxdWV1ZSB0byBidWRn
ZXQKPiBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlLiBBY2NvcmRpbmcgdG8gb3VyIHRlc3Qgd2l0aCBx
ZW11ICsgZHBkaywgcGFja2V0Cj4gZHJvcHBpbmcgaGFwcGVucyB3aGVuIHRoZSBndWVzdCBpcyBu
b3QgYWJsZSB0byBwcm92aWRlIGZyZWUgYnVmZmVyIGluCj4gYXZhaWwgcmluZyB0aW1lbHkgd2l0
aCBkZWZhdWx0IDEvMipxdWV1ZS4gVGhlIHZhbHVlIGluIHRoZSBwYXRjaCBoYXMgYmVlbgo+IHRl
c3RlZCBhbmQgZG9lcyBzaG93IGJldHRlciBwZXJmb3JtYW5jZS4KPgo+IFRlc3Qgc2V0dXA6IGlw
ZXJmMyB0byBnZW5lcmF0ZSBwYWNrZXRzIHRvIGd1ZXN0ICh0b3RhbCAzMG1pbnMsIHBwcyA0MDBr
LCBVRFApCj4gYXZnIHBhY2tldHMgZHJvcCBiZWZvcmU6IDI4NDIKPiBhdmcgcGFja2V0cyBkcm9w
IGFmdGVyOiAzNjAoLTg3LjMlKQo+Cj4gU2lnbmVkLW9mZi1ieTogamlhbmdraWRkIDxqaWFuZ2tp
ZGRAaG90bWFpbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgfCAyICst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgYi9kcml2ZXJzL25ldC92aXJ0aW9f
bmV0LmMKPiBpbmRleCAwZDQxMTVjOWUyMGIuLmJjMDhiZTc5MjVlYiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiArKysgYi9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMK
PiBAQCAtMTMzMSw3ICsxMzMxLDcgQEAgc3RhdGljIGludCB2aXJ0bmV0X3JlY2VpdmUoc3RydWN0
IHJlY2VpdmVfcXVldWUgKnJxLCBpbnQgYnVkZ2V0LAo+ICAgCQl9Cj4gICAJfQo+ICAgCj4gLQlp
ZiAocnEtPnZxLT5udW1fZnJlZSA+IHZpcnRxdWV1ZV9nZXRfdnJpbmdfc2l6ZShycS0+dnEpIC8g
Mikgewo+ICsJaWYgKHJxLT52cS0+bnVtX2ZyZWUgPiBtaW4oKHVuc2lnbmVkIGludClidWRnZXQs
IHZpcnRxdWV1ZV9nZXRfdnJpbmdfc2l6ZShycS0+dnEpKSAvIDIpIHsKPiAgIAkJaWYgKCF0cnlf
ZmlsbF9yZWN2KHZpLCBycSwgR0ZQX0FUT01JQykpCj4gICAJCQlzY2hlZHVsZV9kZWxheWVkX3dv
cmsoJnZpLT5yZWZpbGwsIDApOwo+ICAgCX0KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
