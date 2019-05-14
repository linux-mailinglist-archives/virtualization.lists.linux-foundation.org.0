Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E01C0E0
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 05:25:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E55D8BB3;
	Tue, 14 May 2019 03:25:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 491F3B6C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 03:25:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A973A27B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 03:25:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9C6530832C8;
	Tue, 14 May 2019 03:25:43 +0000 (UTC)
Received: from [10.72.12.59] (ovpn-12-59.pek2.redhat.com [10.72.12.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C01E5C1B4;
	Tue, 14 May 2019 03:25:36 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] vsock/virtio: limit the memory used per-socket
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-2-sgarzare@redhat.com>
	<3b275b52-63d9-d260-1652-8e8bf7dd679f@redhat.com>
	<20190513172322.vcgenx7xk4v6r2ay@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f834c9e9-5d0e-8ebb-44e0-6d99b6284e5c@redhat.com>
Date: Tue, 14 May 2019 11:25:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513172322.vcgenx7xk4v6r2ay@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 14 May 2019 03:25:44 +0000 (UTC)
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

Ck9uIDIwMTkvNS8xNCDkuIrljYgxOjIzLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gT24g
TW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6NTg6NTNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS81LzEwIOS4i+WNiDg6NTgsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4+
IFNpbmNlIHZpcnRpby12c29jayB3YXMgaW50cm9kdWNlZCwgdGhlIGJ1ZmZlcnMgZmlsbGVkIGJ5
IHRoZSBob3N0Cj4+PiBhbmQgcHVzaGVkIHRvIHRoZSBndWVzdCB1c2luZyB0aGUgdnJpbmcsIGFy
ZSBkaXJlY3RseSBxdWV1ZWQgaW4KPj4+IGEgcGVyLXNvY2tldCBsaXN0IGF2b2lkaW5nIHRvIGNv
cHkgaXQuCj4+PiBUaGVzZSBidWZmZXJzIGFyZSBwcmVhbGxvY2F0ZWQgYnkgdGhlIGd1ZXN0IHdp
dGggYSBmaXhlZAo+Pj4gc2l6ZSAoNCBLQikuCj4+Pgo+Pj4gVGhlIG1heGltdW0gYW1vdW50IG9m
IG1lbW9yeSB1c2VkIGJ5IGVhY2ggc29ja2V0IHNob3VsZCBiZQo+Pj4gY29udHJvbGxlZCBieSB0
aGUgY3JlZGl0IG1lY2hhbmlzbS4KPj4+IFRoZSBkZWZhdWx0IGNyZWRpdCBhdmFpbGFibGUgcGVy
LXNvY2tldCBpcyAyNTYgS0IsIGJ1dCBpZiB3ZSB1c2UKPj4+IG9ubHkgMSBieXRlIHBlciBwYWNr
ZXQsIHRoZSBndWVzdCBjYW4gcXVldWUgdXAgdG8gMjYyMTQ0IG9mIDQgS0IKPj4+IGJ1ZmZlcnMs
IHVzaW5nIHVwIHRvIDEgR0Igb2YgbWVtb3J5IHBlci1zb2NrZXQuIEluIGFkZGl0aW9uLCB0aGUK
Pj4+IGd1ZXN0IHdpbGwgY29udGludWUgdG8gZmlsbCB0aGUgdnJpbmcgd2l0aCBuZXcgNCBLQiBm
cmVlIGJ1ZmZlcnMKPj4+IHRvIGF2b2lkIHN0YXJ2YXRpb24gb2YgaGVyIHNvY2tldHMuCj4+Pgo+
Pj4gVGhpcyBwYXRjaCBzb2x2ZXMgdGhpcyBpc3N1ZSBjb3B5aW5nIHRoZSBwYXlsb2FkIGluIGEg
bmV3IGJ1ZmZlci4KPj4+IFRoZW4gaXQgaXMgcXVldWVkIGluIHRoZSBwZXItc29ja2V0IGxpc3Qs
IGFuZCB0aGUgNEtCIGJ1ZmZlciB1c2VkCj4+PiBieSB0aGUgaG9zdCBpcyBmcmVlZC4KPj4+Cj4+
PiBJbiB0aGlzIHdheSwgdGhlIG1lbW9yeSB1c2VkIGJ5IGVhY2ggc29ja2V0IHJlc3BlY3RzIHRo
ZSBjcmVkaXQKPj4+IGF2YWlsYWJsZSwgYW5kIHdlIHN0aWxsIGF2b2lkIHN0YXJ2YXRpb24sIHBh
eWluZyB0aGUgY29zdCBvZiBhbgo+Pj4gZXh0cmEgbWVtb3J5IGNvcHkuIFdoZW4gdGhlIGJ1ZmZl
ciBpcyBjb21wbGV0ZWx5IGZ1bGwgd2UgZG8gYQo+Pj4gInplcm8tY29weSIsIG1vdmluZyB0aGUg
YnVmZmVyIGRpcmVjdGx5IGluIHRoZSBwZXItc29ja2V0IGxpc3QuCj4+Cj4+IEkgd29uZGVyIGlu
IHRoZSBsb25nIHJ1biB3ZSBzaG91bGQgdXNlIGdlbmVyaWMgc29ja2V0IGFjY291dGluZyBtZWNo
YW5pc20KPj4gcHJvdmlkZWQgYnkga2VybmVsIChlLmcgc29ja2V0LCBza2IsIHNuZGJ1ZiwgcmVj
dmJ1ZywgdHJ1ZXNpemUpIGluc3RlYWQgb2YKPj4gdnNvY2sgc3BlY2lmaWMgdGhpbmcgdG8gYXZv
aWQgZHVwbGljYXRpbmcgZWZmb3J0cy4KPiBJIGFncmVlLCB0aGUgaWRlYSBpcyB0byBzd2l0Y2gg
dG8gc2tfYnVmZiBidXQgdGhpcyBzaG91bGQgcmVxdWlyZSBhbiBodWdlCj4gY2hhbmdlLiBJZiB3
ZSB3aWxsIHVzZSB0aGUgdmlydGlvLW5ldCBkYXRhcGF0aCwgaXQgd2lsbCBiZWNvbWUgc2ltcGxl
ci4KCgpZZXMsIHVuaXggZG9tYWluIHNvY2tldCBpcyBvbmUgZXhhbXBsZSB0aGF0IHVzZXMgZ2Vu
ZXJhbCBza2IgYW5kIHNvY2tldCAKc3RydWN0dXJlLiBBbmQgd2UgcHJvYmFibHkgbmVlZCBzb21l
IGtpbmQgb2Ygc29ja2V0IHBhaXIgb24gaG9zdC4gVXNpbmcgCnNvY2tldCBjYW4gYWxzbyBzaW1w
bGlmeSB0aGUgdW5pZmljYXRpb24gd2l0aCB2aG9zdC1uZXQgd2hpY2ggZGVwZW5kcyBvbiAKdGhl
IHNvY2tldCBwcm90b19vcHMgdG8gd29yay4gSSBhZG1pdCBpdCdzIGEgaHVnZSBjaGFuZ2UgcHJv
YmFibHksIHdlIApjYW4gZG8gaXQgZ3JhZHVhbGx5LgoKCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4+PiAtLS0KPj4+ICAgIGRy
aXZlcnMvdmhvc3QvdnNvY2suYyAgICAgICAgICAgICAgICAgICB8ICAyICsKPj4+ICAgIGluY2x1
ZGUvbGludXgvdmlydGlvX3Zzb2NrLmggICAgICAgICAgICB8ICA4ICsrKwo+Pj4gICAgbmV0L3Zt
d192c29jay92aXJ0aW9fdHJhbnNwb3J0LmMgICAgICAgIHwgIDEgKwo+Pj4gICAgbmV0L3Ztd192
c29jay92aXJ0aW9fdHJhbnNwb3J0X2NvbW1vbi5jIHwgOTUgKysrKysrKysrKysrKysrKysrLS0t
LS0tLQo+Pj4gICAgNCBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92c29jay5jIGIvZHJpdmVy
cy92aG9zdC92c29jay5jCj4+PiBpbmRleCBiYjVmYzBlOWZiYzIuLjc5NjRlMmRhZWUwOSAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdnNvY2suYwo+Pj4gKysrIGIvZHJpdmVycy92aG9z
dC92c29jay5jCj4+PiBAQCAtMzIwLDYgKzMyMCw4IEBAIHZob3N0X3Zzb2NrX2FsbG9jX3BrdChz
dHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKPj4+ICAgIAkJcmV0dXJuIE5VTEw7Cj4+PiAgICAJ
fQo+Pj4gKwlwa3QtPmJ1Zl9sZW4gPSBwa3QtPmxlbjsKPj4+ICsKPj4+ICAgIAluYnl0ZXMgPSBj
b3B5X2Zyb21faXRlcihwa3QtPmJ1ZiwgcGt0LT5sZW4sICZpb3ZfaXRlcik7Cj4+PiAgICAJaWYg
KG5ieXRlcyAhPSBwa3QtPmxlbikgewo+Pj4gICAgCQl2cV9lcnIodnEsICJFeHBlY3RlZCAldSBi
eXRlIHBheWxvYWQsIGdvdCAlenUgYnl0ZXNcbiIsCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC92aXJ0aW9fdnNvY2suaCBiL2luY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmgKPj4+IGlu
ZGV4IGUyMjNlMjYzMmVkZC4uMzQ1ZjA0ZWU5MTkzIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9s
aW51eC92aXJ0aW9fdnNvY2suaAo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fdnNvY2su
aAo+Pj4gQEAgLTU0LDkgKzU0LDE3IEBAIHN0cnVjdCB2aXJ0aW9fdnNvY2tfcGt0IHsKPj4+ICAg
IAl2b2lkICpidWY7Cj4+PiAgICAJdTMyIGxlbjsKPj4+ICAgIAl1MzIgb2ZmOwo+Pj4gKwl1MzIg
YnVmX2xlbjsKPj4+ICAgIAlib29sIHJlcGx5Owo+Pj4gICAgfTsKPj4+ICtzdHJ1Y3QgdmlydGlv
X3Zzb2NrX2J1ZiB7Cj4+PiArCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKPj4+ICsJdm9pZCAqYWRk
cjsKPj4+ICsJdTMyIGxlbjsKPj4+ICsJdTMyIG9mZjsKPj4+ICt9Owo+Pj4gKwo+Pj4gICAgc3Ry
dWN0IHZpcnRpb192c29ja19wa3RfaW5mbyB7Cj4+PiAgICAJdTMyIHJlbW90ZV9jaWQsIHJlbW90
ZV9wb3J0Owo+Pj4gICAgCXN0cnVjdCB2c29ja19zb2NrICp2c2s7Cj4+PiBkaWZmIC0tZ2l0IGEv
bmV0L3Ztd192c29jay92aXJ0aW9fdHJhbnNwb3J0LmMgYi9uZXQvdm13X3Zzb2NrL3ZpcnRpb190
cmFuc3BvcnQuYwo+Pj4gaW5kZXggMTVlYjVkM2Q0NzUwLi5hZjFkMmNlMTJmNTQgMTAwNjQ0Cj4+
PiAtLS0gYS9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnQuYwo+Pj4gKysrIGIvbmV0L3Zt
d192c29jay92aXJ0aW9fdHJhbnNwb3J0LmMKPj4+IEBAIC0yODAsNiArMjgwLDcgQEAgc3RhdGlj
IHZvaWQgdmlydGlvX3Zzb2NrX3J4X2ZpbGwoc3RydWN0IHZpcnRpb192c29jayAqdnNvY2spCj4+
PiAgICAJCQlicmVhazsKPj4+ICAgIAkJfQo+Pj4gKwkJcGt0LT5idWZfbGVuID0gYnVmX2xlbjsK
Pj4+ICAgIAkJcGt0LT5sZW4gPSBidWZfbGVuOwo+Pj4gICAgCQlzZ19pbml0X29uZSgmaGRyLCAm
cGt0LT5oZHIsIHNpemVvZihwa3QtPmhkcikpOwo+Pj4gZGlmZiAtLWdpdCBhL25ldC92bXdfdnNv
Y2svdmlydGlvX3RyYW5zcG9ydF9jb21tb24uYyBiL25ldC92bXdfdnNvY2svdmlydGlvX3RyYW5z
cG9ydF9jb21tb24uYwo+Pj4gaW5kZXggNjAyNzE1ZmM5YTc1Li4wMjQ4ZDY4MDg3NTUgMTAwNjQ0
Cj4+PiAtLS0gYS9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnRfY29tbW9uLmMKPj4+ICsr
KyBiL25ldC92bXdfdnNvY2svdmlydGlvX3RyYW5zcG9ydF9jb21tb24uYwo+Pj4gQEAgLTY1LDYg
KzY1LDkgQEAgdmlydGlvX3RyYW5zcG9ydF9hbGxvY19wa3Qoc3RydWN0IHZpcnRpb192c29ja19w
a3RfaW5mbyAqaW5mbywKPj4+ICAgIAkJcGt0LT5idWYgPSBrbWFsbG9jKGxlbiwgR0ZQX0tFUk5F
TCk7Cj4+PiAgICAJCWlmICghcGt0LT5idWYpCj4+PiAgICAJCQlnb3RvIG91dF9wa3Q7Cj4+PiAr
Cj4+PiArCQlwa3QtPmJ1Zl9sZW4gPSBsZW47Cj4+PiArCj4+PiAgICAJCWVyciA9IG1lbWNweV9m
cm9tX21zZyhwa3QtPmJ1ZiwgaW5mby0+bXNnLCBsZW4pOwo+Pj4gICAgCQlpZiAoZXJyKQo+Pj4g
ICAgCQkJZ290byBvdXQ7Cj4+PiBAQCAtODYsNiArODksNDYgQEAgdmlydGlvX3RyYW5zcG9ydF9h
bGxvY19wa3Qoc3RydWN0IHZpcnRpb192c29ja19wa3RfaW5mbyAqaW5mbywKPj4+ICAgIAlyZXR1
cm4gTlVMTDsKPj4+ICAgIH0KPj4+ICtzdGF0aWMgc3RydWN0IHZpcnRpb192c29ja19idWYgKgo+
Pj4gK3ZpcnRpb190cmFuc3BvcnRfYWxsb2NfYnVmKHN0cnVjdCB2aXJ0aW9fdnNvY2tfcGt0ICpw
a3QsIGJvb2wgemVyb19jb3B5KQo+Pj4gK3sKPj4+ICsJc3RydWN0IHZpcnRpb192c29ja19idWYg
KmJ1ZjsKPj4+ICsKPj4+ICsJaWYgKHBrdC0+bGVuID09IDApCj4+PiArCQlyZXR1cm4gTlVMTDsK
Pj4+ICsKPj4+ICsJYnVmID0ga3phbGxvYyhzaXplb2YoKmJ1ZiksIEdGUF9LRVJORUwpOwo+Pj4g
KwlpZiAoIWJ1ZikKPj4+ICsJCXJldHVybiBOVUxMOwo+Pj4gKwo+Pj4gKwkvKiBJZiB0aGUgYnVm
ZmVyIGluIHRoZSB2aXJ0aW9fdnNvY2tfcGt0IGlzIGZ1bGwsIHdlIGNhbiBtb3ZlIGl0IHRvCj4+
PiArCSAqIHRoZSBuZXcgdmlydGlvX3Zzb2NrX2J1ZiBhdm9pZGluZyB0aGUgY29weSwgYmVjYXVz
ZSB3ZSBhcmUgc3VyZSB0aGF0Cj4+PiArCSAqIHdlIGFyZSBub3QgdXNlIG1vcmUgbWVtb3J5IHRo
YW4gdGhhdCBjb3VudGVkIGJ5IHRoZSBjcmVkaXQgbWVjaGFuaXNtLgo+Pj4gKwkgKi8KPj4+ICsJ
aWYgKHplcm9fY29weSAmJiBwa3QtPmxlbiA9PSBwa3QtPmJ1Zl9sZW4pIHsKPj4+ICsJCWJ1Zi0+
YWRkciA9IHBrdC0+YnVmOwo+Pj4gKwkJcGt0LT5idWYgPSBOVUxMOwo+Pj4gKwl9IGVsc2Ugewo+
Pgo+PiBJcyB0aGUgY29weSBzdGlsbCBuZWVkZWQgaWYgd2UncmUganVzdCBmZXcgYnl0ZXMgbGVz
cz8gV2UgbWVldCBzaW1pbGFyIGlzc3VlCj4+IGZvciB2aXJpdG8tbmV0LCBhbmQgdmlydGlvLW5l
dCBzb2x2ZSB0aGlzIGJ5IGFsd2F5cyBjb3B5IGZpcnN0IDEyOGJ5dGVzIGZvcgo+PiBiaWcgcGFj
a2V0cy4KPj4KPj4gU2VlIHJlY2VpdmVfYmlnKCkKPiBJJ20gc2VlaW5nLCBJdCBpcyBtb3JlIHNv
cGhpc3RpY2F0ZWQuCj4gSUlVQywgdmlydGlvLW5ldCBhbGxvY2F0ZXMgYSBza19idWZmIHdpdGgg
MTI4IGJ5dGVzIG9mIGJ1ZmZlciwgdGhlbiBjb3BpZXMgdGhlCj4gZmlyc3QgMTI4IGJ5dGVzLCB0
aGVuIGFkZHMgdGhlIGJ1ZmZlciB1c2VkIHRvIHJlY2VpdmUgdGhlIHBhY2tldCBhcyBhIGZyYWcg
dG8KPiB0aGUgc2tiLgoKClllcyBhbmQgdGhlIHBvaW50IGlzIGlmIHRoZSBwYWNrZXQgaXMgc21h
bGxlciB0aGFuIDEyOCBieXRlcyB0aGUgcGFnZXMgCndpbGwgYmUgcmVjeWNsZWQuCgoKPgo+IERv
IHlvdSBzdWdnZXN0IHRvIGltcGxlbWVudCBzb21ldGhpbmcgc2ltaWxhciwgb3IgZm9yIG5vdyB3
ZSBjYW4gdXNlIG15Cj4gYXBwcm9hY2ggYW5kIGlmIHdlIHdpbGwgbWVyZ2UgdGhlIGRhdGFwYXRo
IHdlIGNhbiByZXVzZSB0aGUgdmlydGlvLW5ldAo+IGFwcHJvYWNoPwoKCkkgdGhpbmsgd2UgbmVl
ZCBhIGJldHRlciB0aHJlc2hvbGQuIElmIEkgdW5kZXJzdGFuZCB0aGUgcGF0Y2ggY29ycmVjdGx5
LCAKd2Ugd2lsbCBkbyBjb3B5IHVubGVzcyB0aGUgcGFja2V0IGlzIDY0SyB3aGVuIGd1ZXN0IGlz
IGRvaW5nIHJlY2VpdmluZy4gCjEgYnl0ZSBwYWNrZXQgaXMgaW5kZWVkIGEgcHJvYmxlbSwgYnV0
IHdlIG5lZWQgdG8gc29sdmUgaXQgd2l0aG91dCAKbG9zaW5nIHRvbyBtdWNoIHBlcmZvcm1hbmNl
LgoKVGhhbmtzCgoKPgo+IFRoYW5rcywKPiBTdGVmYW5vCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
