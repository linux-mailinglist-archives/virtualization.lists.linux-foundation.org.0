Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BF1B644
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 14:46:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4AF61DB4;
	Mon, 13 May 2019 12:46:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 696F4D9E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 12:46:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 00C53875
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 12:46:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 524E630832CC;
	Mon, 13 May 2019 12:46:28 +0000 (UTC)
Received: from [10.72.12.49] (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 551F36A48A;
	Mon, 13 May 2019 12:46:21 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] vsock/virtio: make the RX buffer size tunable
From: Jason Wang <jasowang@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-9-sgarzare@redhat.com>
	<eddb5a89-ed44-3a65-0181-84f7f27dd2cb@redhat.com>
Message-ID: <8e72ef5e-cf6a-a635-3f76-bdeac95761b8@redhat.com>
Date: Mon, 13 May 2019 20:46:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <eddb5a89-ed44-3a65-0181-84f7f27dd2cb@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 13 May 2019 12:46:28 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

Ck9uIDIwMTkvNS8xMyDkuIvljYg2OjA1LCBKYXNvbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAxOS81
LzEwIOS4i+WNiDg6NTgsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4gVGhlIFJYIGJ1ZmZl
ciBzaXplIGRldGVybWluZXMgdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBvZiB0aGUKPj4gdnNvY2sv
dmlydGlvIGd1ZXN0IGRyaXZlciwgc28gd2UgbWFrZSBpdCB0dW5hYmxlIHRocm91Z2gKPj4gYSBt
b2R1bGUgcGFyYW1ldGVyLgo+Pgo+PiBUaGUgc2l6ZSBhbGxvd2VkIGFyZSBiZXR3ZWVuIDQgS0Ig
YW5kIDY0IEtCIGluIG9yZGVyIHRvIGJlCj4+IGNvbXBhdGlibGUgd2l0aCBvbGQgaG9zdCBkcml2
ZXJzLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRo
YXQuY29tPgo+Cj4KPiBJIGRvbid0IHNlZSBtdWNoIHZhbHVlIG9mIGRvaW5nIHRoaXMgdGhyb3Vn
aCBrZXJuZWwgY29tbWFuZCBsaW5lLiBXZSAKPiBzaG91bGQgZGVhbCB3aXRoIHRoZW0gYXV0b21h
dGljYWxseSBsaWtlIHdoYXQgdmlydGlvLW5ldCBkaWQuIE9yIGV2ZW4gCj4gYSBtb2R1bGUgcGFy
YW1ldGVyIGlzIGJldHRlci4KPgo+IFRoYW5rcwoKClNvcnJ5LCBJIG1pc3JlYWQgdGhlIHBhdGNo
LiBCdXQgZXZlbiBtb2R1bGUgcGFyYW1ldGVyIGlzIHNvbWV0aGluZyBub3QgCmZsZXhpYmxlIGVu
b3VnaC4gV2Ugc2hvdWxkIGRlYWwgd2l0aCB0aGVtIHRyYW5zcGFyZW50bHkuCgpUaGFua3MKCgo+
Cj4KPj4gLS0tCj4+IMKgIGluY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmjCoMKgwqDCoCB8wqAg
MSArCj4+IMKgIG5ldC92bXdfdnNvY2svdmlydGlvX3RyYW5zcG9ydC5jIHwgMjcgKysrKysrKysr
KysrKysrKysrKysrKysrKystCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9f
dnNvY2suaCBiL2luY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmgKPj4gaW5kZXggNWE5ZDI1YmU3
MmRmLi5iOWY4YzNkOTFmODAgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvdmlydGlvX3Zz
b2NrLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fdnNvY2suaAo+PiBAQCAtMTMsNiAr
MTMsNyBAQAo+PiDCoCAjZGVmaW5lIFZJUlRJT19WU09DS19ERUZBVUxUX1JYX0JVRl9TSVpFwqDC
oMKgICgxMDI0ICogNjQpCj4+IMKgICNkZWZpbmUgVklSVElPX1ZTT0NLX01BWF9CVUZfU0laRcKg
wqDCoMKgwqDCoMKgIDB4RkZGRkZGRkZVTAo+PiDCoCAjZGVmaW5lIFZJUlRJT19WU09DS19NQVhf
UEtUX0JVRl9TSVpFwqDCoMKgwqDCoMKgwqAgKDEwMjQgKiA2NCkKPj4gKyNkZWZpbmUgVklSVElP
X1ZTT0NLX01JTl9QS1RfQlVGX1NJWkXCoMKgwqDCoMKgwqDCoCAoMTAyNCAqIDQpCj4+IMKgIMKg
IGVudW0gewo+PiDCoMKgwqDCoMKgIFZTT0NLX1ZRX1JYwqDCoMKgwqAgPSAwLCAvKiBmb3IgaG9z
dCB0byBndWVzdCBkYXRhICovCj4+IGRpZmYgLS1naXQgYS9uZXQvdm13X3Zzb2NrL3ZpcnRpb190
cmFuc3BvcnQuYyAKPj4gYi9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnQuYwo+PiBpbmRl
eCBhZjFkMmNlMTJmNTQuLjczMjM5OGI0ZTI4ZiAxMDA2NDQKPj4gLS0tIGEvbmV0L3Ztd192c29j
ay92aXJ0aW9fdHJhbnNwb3J0LmMKPj4gKysrIGIvbmV0L3Ztd192c29jay92aXJ0aW9fdHJhbnNw
b3J0LmMKPj4gQEAgLTY2LDYgKzY2LDMxIEBAIHN0cnVjdCB2aXJ0aW9fdnNvY2sgewo+PiDCoMKg
wqDCoMKgIHUzMiBndWVzdF9jaWQ7Cj4+IMKgIH07Cj4+IMKgICtzdGF0aWMgdW5zaWduZWQgaW50
IHJ4X2J1Zl9zaXplID0gVklSVElPX1ZTT0NLX0RFRkFVTFRfUlhfQlVGX1NJWkU7Cj4+ICsKPj4g
K3N0YXRpYyBpbnQgcGFyYW1fc2V0X3J4X2J1Zl9zaXplKGNvbnN0IGNoYXIgKnZhbCwgY29uc3Qg
c3RydWN0IAo+PiBrZXJuZWxfcGFyYW0gKmtwKQo+PiArewo+PiArwqDCoMKgIHVuc2lnbmVkIGlu
dCBzaXplOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBrc3RydG91
aW50KHZhbCwgMCwgJnNpemUpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+PiArCj4+ICvCoMKgwqAgaWYgKHNpemUgPCBWSVJUSU9fVlNPQ0tfTUlO
X1BLVF9CVUZfU0laRSB8fAo+PiArwqDCoMKgwqDCoMKgwqAgc2l6ZSA+IFZJUlRJT19WU09DS19N
QVhfUEtUX0JVRl9TSVpFKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsK
Pj4gK8KgwqDCoCByZXR1cm4gcGFyYW1fc2V0X3VpbnQodmFsLCBrcCk7Cj4+ICt9Owo+PiArCj4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbV9vcHMgcGFyYW1fb3BzX3J4X2J1Zl9z
aXplID0gewo+PiArwqDCoMKgIC5zZXQgPSBwYXJhbV9zZXRfcnhfYnVmX3NpemUsCj4+ICvCoMKg
wqAgLmdldCA9IHBhcmFtX2dldF91aW50LAo+PiArfTsKPj4gKwo+PiArbW9kdWxlX3BhcmFtX2Ni
KHJ4X2J1Zl9zaXplLCAmcGFyYW1fb3BzX3J4X2J1Zl9zaXplLCAmcnhfYnVmX3NpemUsIAo+PiAw
NjQ0KTsKPj4gKwo+PiDCoCBzdGF0aWMgc3RydWN0IHZpcnRpb192c29jayAqdmlydGlvX3Zzb2Nr
X2dldCh2b2lkKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIHRoZV92aXJ0aW9fdnNvY2s7
Cj4+IEBAIC0yNjEsNyArMjg2LDcgQEAgdmlydGlvX3RyYW5zcG9ydF9jYW5jZWxfcGt0KHN0cnVj
dCB2c29ja19zb2NrICp2c2spCj4+IMKgIMKgIHN0YXRpYyB2b2lkIHZpcnRpb192c29ja19yeF9m
aWxsKHN0cnVjdCB2aXJ0aW9fdnNvY2sgKnZzb2NrKQo+PiDCoCB7Cj4+IC3CoMKgwqAgaW50IGJ1
Zl9sZW4gPSBWSVJUSU9fVlNPQ0tfREVGQVVMVF9SWF9CVUZfU0laRTsKPj4gK8KgwqDCoCBpbnQg
YnVmX2xlbiA9IHJ4X2J1Zl9zaXplOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCB2aXJ0aW9fdnNvY2tf
cGt0ICpwa3Q7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHNjYXR0ZXJsaXN0IGhkciwgYnVmLCAqc2dz
WzJdOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCB2aXJ0cXVldWUgKnZxOwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
