Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CDC71921
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 15:25:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A3266CC3;
	Tue, 23 Jul 2019 13:25:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D0494CB7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:25:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 78D23709
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:25:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EC44C057F2E;
	Tue, 23 Jul 2019 13:25:24 +0000 (UTC)
Received: from [10.72.12.26] (ovpn-12-26.pek2.redhat.com [10.72.12.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C709C5B685;
	Tue, 23 Jul 2019 13:25:18 +0000 (UTC)
Subject: Re: [PATCH 4/6] vhost: reset invalidate_count in
	vhost_set_vring_num_addr()
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-5-jasowang@redhat.com>
	<20190723042143-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4e52f1cb-f805-18f6-d50b-1379298de2e3@redhat.com>
Date: Tue, 23 Jul 2019 21:25:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723042143-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 23 Jul 2019 13:25:24 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvNy8yMyDkuIvljYg1OjE3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6NTc6MTZBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhlIHZob3N0X3NldF92cmluZ19udW1fYWRkcigpIGNvdWxkIGJlIGNhbGxlZCBpbiB0aGUg
bWlkZGxlIG9mCj4+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBhbmQgaW52YWxpZGF0ZV9yYW5n
ZV9lbmQoKS4gSWYgd2UgZG9uJ3QgcmVzZXQKPj4gaW52YWxpZGF0ZV9jb3VudCBhZnRlciB0aGUg
dW4tcmVnaXN0ZXJpbmcgb2YgTU1VIG5vdGlmaWVyLCB0aGUKPj4gaW52YWxpZGF0ZV9jb250IHdp
bGwgcnVuIG91dCBvZiBzeW5jIChlLmcgbmV2ZXIgcmVhY2ggemVybykuIFRoaXMgd2lsbAo+PiBp
biBmYWN0IGRpc2FibGUgdGhlIGZhc3QgYWNjZXNzb3IgcGF0aC4gRml4aW5nIGJ5IHJlc2V0IHRo
ZSBjb3VudCB0bwo+PiB6ZXJvLgo+Pgo+PiBSZXBvcnRlZC1ieTogTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4KPj4gRml4ZXM6IDdmNDY2MDMyZGM5ZSAoInZob3N0OiBhY2Nlc3Mg
dnEgbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwgdmlydHVhbCBhZGRyZXNzIikKPj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy92aG9zdC92aG9zdC5jIHwgNCArKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5jIGIvZHJpdmVycy92
aG9zdC92aG9zdC5jCj4+IGluZGV4IDAzNjY2YjcwMjQ5OC4uODljOWYwOGI1MTQ2IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9z
dC5jCj4+IEBAIC0yMDc0LDYgKzIwNzQsMTAgQEAgc3RhdGljIGxvbmcgdmhvc3RfdnJpbmdfc2V0
X251bV9hZGRyKHN0cnVjdCB2aG9zdF9kZXYgKmQsCj4+ICAgCQlkLT5oYXNfbm90aWZpZXIgPSBm
YWxzZTsKPj4gICAJfQo+PiAgIAo+PiArCS8qIHJlc2V0IGludmFsaWRhdGVfY291bnQgaW4gY2Fz
ZSB3ZSBhcmUgaW4gdGhlIG1pZGRsZSBvZgo+PiArCSAqIGludmFsaWRhdGVfc3RhcnQoKSBhbmQg
aW52YWxpZGF0ZV9lbmQoKS4KPj4gKwkgKi8KPj4gKwl2cS0+aW52YWxpZGF0ZV9jb3VudCA9IDA7
Cj4gSSB0aGluayB0aGF0IHRoZSBjb2RlIGlzIG9rIGJ1dCB0aGUgY29tbWVudHMgYXJlIG5vdCB2
ZXJ5IGNsZWFyOgo+IC0gd2UgYXJlIG5ldmVyIGluIHRoZSBtaWRkbGUgc2luY2Ugd2UganVzdCBy
ZW1vdmVkIHRoZSBub3RpZmllcgoKCklmIEkgcmVhZCB0aGUgY29kZSBjb3JyZWN0bHksIG1tdV9u
b3RpZmllcl91bnJlZ2lzdGVyKCkgY2FuIG9ubHkgCmd1YXJhbnRlZSB0byB3YWl0IGZvciB0aGUg
cGVuZGluZyBtZXRob2QgdG8gY29tcGxldGUuIFNvIHdlIGNhbiBoYXZlOgoKaW52YWxpZGF0ZV9z
dGFydCgpCgptbXVfbm90aWZpZXJfdW5yZWdpc3RlcigpCgppbnZhbGlkYXRlX2VuZCgpCgoKPiAt
IHRoZSByZXN1bHQgaXMgbm90IGp1c3QgZGlzYWJsaW5nIG9wdGltaXphdGlvbjoKPiAgICBpZiBu
b3RpZmllciBiZWNvbWVzIG5lZ2F0aXZlLCB0aGVuIGxhdGVyIHdlCj4gICAgY2FuIHRoaW5rIGl0
J3Mgb2sgdG8gbWFwIHdoZW4gaXQgaXNuJ3Qgc2luY2UKPiAgICBub3RpZmllciBpcyBhY3RpdmUu
CgoKSSBkb24ndCBnZXQgaG93IGl0IGNvdWxkIGJlIG5lZ2F0aXZlLCB0aGUgb25seSBwb3NzaWJs
ZSB0aGluZyBpcyB0byBoYXZlIAphIHBvc2l0aXZlIHZhbHVlLgoKVGhhbmtzCgoKPgo+PiAgIAl2
aG9zdF91bmluaXRfdnFfbWFwcyh2cSk7Cj4+ICAgI2VuZGlmCj4+ICAgCj4+IC0tIAo+PiAyLjE4
LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
