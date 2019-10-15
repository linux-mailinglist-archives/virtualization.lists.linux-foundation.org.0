Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACDD764B
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 14:17:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D813CE25;
	Tue, 15 Oct 2019 12:17:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 72814E18
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:17:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E1C866D6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:17:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12DEBC05B00E;
	Tue, 15 Oct 2019 12:17:33 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99C9760BE2;
	Tue, 15 Oct 2019 12:17:02 +0000 (UTC)
Subject: Re: [PATCH V3 4/7] mdev: introduce device specific ops
To: Cornelia Huck <cohuck@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-5-jasowang@redhat.com>
	<20191015124137.4f948bd2.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eb7ecd99-7465-6be4-7ecd-84c11f66e0ac@redhat.com>
Date: Tue, 15 Oct 2019 20:17:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015124137.4f948bd2.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 15 Oct 2019 12:17:33 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTAvMTUg5LiL5Y2INjo0MSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBGcmks
IDExIE9jdCAyMDE5IDE2OjE1OjU0ICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gQ3VycmVudGx5LCBleGNlcHQgZm9yIHRoZSBjcmVhdGUgYW5kIHJl
bW92ZSwgdGhlIHJlc3Qgb2YKPj4gbWRldl9wYXJlbnRfb3BzIGlzIGRlc2lnbmVkIGZvciB2Zmlv
LW1kZXYgZHJpdmVyIG9ubHkgYW5kIG1heSBub3QgaGVscAo+PiBmb3Iga2VybmVsIG1kZXYgZHJp
dmVyLiBXaXRoIHRoZSBoZWxwIG9mIGNsYXNzIGlkLCB0aGlzIHBhdGNoCj4+IGludHJvZHVjZXMg
ZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcyBpbnNpZGUgbWRldl9kZXZpY2UKPj4gc3RydWN0dXJl
LiBUaGlzIGFsbG93cyBkaWZmZXJlbnQgc2V0IG9mIGNhbGxiYWNrIHRvIGJlIHVzZWQgYnkKPj4g
dmZpby1tZGV2IGFuZCB2aXJ0aW8tbWRldi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgLi4uL2RyaXZlci1hcGkvdmZpby1t
ZWRpYXRlZC1kZXZpY2UucnN0ICAgICAgIHwgMjIgKysrKystLS0KPj4gICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgIHwgMTggKysrKy0tLQo+PiAgIGRyaXZl
cnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAgICB8IDE4ICsrKystLS0KPj4g
ICBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMgICAgICAgICAgICAgfCAxNCArKyst
LQo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICB8ICA5
ICsrKy0KPj4gICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAg
fCAgMSArCj4+ICAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAg
IHwgMzcgKysrKysrLS0tLS0tLQo+PiAgIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDQyICsrKy0tLS0tLS0tLS0tLQo+PiAgIGluY2x1ZGUvbGludXgvdmZp
b19tZGV2LmggICAgICAgICAgICAgICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPj4g
ICBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAgICAgICAgICAgICAgICAgfCAyMCArKysr
LS0tCj4+ICAgc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAgICAgICAgICAgICAgICAgIHwg
MjEgKysrKystLS0KPj4gICBzYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgICAgICAgICAgICAgICAg
ICAgICAgfCAxOCArKysrLS0tCj4+ICAgMTMgZmlsZXMgY2hhbmdlZCwgMTc3IGluc2VydGlvbnMo
KyksIDk2IGRlbGV0aW9ucygtKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4
L3ZmaW9fbWRldi5oCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
dmZpby1tZWRpYXRlZC1kZXZpY2UucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8t
bWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiBpbmRleCAyMDM1ZTQ4ZGE3YjIuLjU1MzU3NGViYmE3MyAx
MDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2
aWNlLnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1k
ZXZpY2UucnN0Cj4+IEBAIC0xNTIsMTEgKzE1MiwyMCBAQCBjYWxsYmFja3MgcGVyIG1kZXYgcGFy
ZW50IGRldmljZSwgcGVyIG1kZXYgdHlwZSwgb3IgYW55IG90aGVyIGNhdGVnb3JpemF0aW9uLgo+
PiAgIFZlbmRvciBkcml2ZXJzIGFyZSBleHBlY3RlZCB0byBiZSBmdWxseSBhc3luY2hyb25vdXMg
aW4gdGhpcyByZXNwZWN0IG9yCj4+ICAgcHJvdmlkZSB0aGVpciBvd24gaW50ZXJuYWwgcmVzb3Vy
Y2UgcHJvdGVjdGlvbi4pCj4+ICAgCj4+IC1UaGUgY2FsbGJhY2tzIGluIHRoZSBtZGV2X3BhcmVu
dF9vcHMgc3RydWN0dXJlIGFyZSBhcyBmb2xsb3dzOgo+PiArSW4gb3JkZXIgdG8gc3VwcG9ydCBt
dWx0aXBsZSB0eXBlcyBvZiBkZXZpY2UvZHJpdmVyLCBkZXZpY2UgbmVlZHMgdG8KPj4gK3Byb3Zp
ZGUgYm90aCBjbGFzc19pZCBhbmQgZGV2aWNlX29wcyB0aHJvdWdoOgo+ICJBcyBtdWx0aXBsZSB0
eXBlcyBvZiBtZWRpYXRlZCBkZXZpY2VzIG1heSBiZSBzdXBwb3J0ZWQsIHRoZSBkZXZpY2UKPiBu
ZWVkcyB0byBzZXQgdXAgdGhlIGNsYXNzIGlkIGFuZCB0aGUgZGV2aWNlIHNwZWNpZmljIGNhbGxi
YWNrcyB2aWE6Igo+Cj4gPwo+Cj4+ICAgCj4+IC0qIG9wZW46IG9wZW4gY2FsbGJhY2sgb2YgbWVk
aWF0ZWQgZGV2aWNlCj4+IC0qIGNsb3NlOiBjbG9zZSBjYWxsYmFjayBvZiBtZWRpYXRlZCBkZXZp
Y2UKPj4gLSogaW9jdGw6IGlvY3RsIGNhbGxiYWNrIG9mIG1lZGlhdGVkIGRldmljZQo+PiArICAg
IHZvaWQgbWRldl9zZXRfY2xhc3Moc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWQsIGNv
bnN0IHZvaWQgKm9wcyk7Cj4+ICsKPj4gK1RoZSBjbGFzc19pZCBpcyB1c2VkIHRvIGJlIHBhaXJl
ZCB3aXRoIGlkcyBpbiBpZF90YWJsZSBpbiBtZGV2X2RyaXZlcgo+PiArc3RydWN0dXJlIGZvciBw
cm9iaW5nIHRoZSBjb3JyZWN0IGRyaXZlci4KPiAiVGhlIGNsYXNzIGlkICAoc3BlY2lmaWVkIGlu
IGlkKSBpcyB1c2VkIHRvIG1hdGNoIGEgZGV2aWNlIHdpdGggYW4gbWRldgo+IGRyaXZlciB2aWEg
aXRzIGlkIHRhYmxlLiIKPgo+ID8KPgo+PiBUaGUgZGV2aWNlX29wcyBpcyBkZXZpY2UKPj4gK3Nw
ZWNpZmljIGNhbGxiYWNrcyB3aGljaCBjYW4gYmUgZ2V0IHRocm91Z2ggbWRldl9nZXRfZGV2X29w
cygpCj4+ICtmdW5jdGlvbiBieSBtZGV2IGJ1cyBkcml2ZXIuCj4gIlRoZSBkZXZpY2Ugc3BlY2lm
aWMgY2FsbGJhY2tzIChzcGVjaWZpZWQgaW4gKm9wcykgYXJlIG9idGFpbmFibGUgdmlhCj4gbWRl
dl9nZXRfZGV2X29wcygpIChmb3IgdXNlIGJ5IHRoZSBtZGV2IGJ1cyBkcml2ZXIuKSIKPgo+ID8K
Pgo+PiBGb3IgdmZpby1tZGV2IGRldmljZSwgaXRzIGRldmljZSBzcGVjaWZpYwo+PiArb3BzIGFy
ZSBhcyBmb2xsb3dzOgo+ICJBIHZmaW8tbWRldiBkZXZpY2UgKGNsYXNzIGlkIE1ERVZfSURfVkZJ
TykgdXNlcyB0aGUgZm9sbG93aW5nCj4gZGV2aWNlLXNwZWNpZmljIG9wczoiCj4KPiA/CgoKQWxs
IHlvdSBwcm9wb3NlIGlzIGJldHRlciB0aGFuIHdoYXQgSSB3cm90ZSwgd2lsbCBjaGFuZ2UgdGhl
IGRvY3MuCgoKPgo+PiArCj4+ICsqIG9wZW46IG9wZW4gY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRl
ZCBkZXZpY2UKPj4gKyogY2xvc2U6IGNsb3NlIGNhbGxiYWNrIG9mIHZmaW8gbWVkaWF0ZWQgZGV2
aWNlCj4+ICsqIGlvY3RsOiBpb2N0bCBjYWxsYmFjayBvZiB2ZmlvIG1lZGlhdGVkIGRldmljZQo+
PiAgICogcmVhZCA6IHJlYWQgZW11bGF0aW9uIGNhbGxiYWNrCj4+ICAgKiB3cml0ZTogd3JpdGUg
ZW11bGF0aW9uIGNhbGxiYWNrCj4+ICAgKiBtbWFwOiBtbWFwIGVtdWxhdGlvbiBjYWxsYmFjawo+
PiBAQCAtMTY3LDkgKzE3NiwxMCBAQCByZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3Jl
IGRyaXZlcjo6Cj4+ICAgCWV4dGVybiBpbnQgIG1kZXZfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBk
ZXZpY2UgKmRldiwKPj4gICAJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKTsKPj4gICAKPj4gLUl0IGlzIGFsc28gcmVxdWly
ZWQgdG8gc3BlY2lmeSB0aGUgY2xhc3NfaWQgdGhyb3VnaDo6Cj4+ICtJdCBpcyBhbHNvIHJlcXVp
cmVkIHRvIHNwZWNpZnkgdGhlIGNsYXNzX2lkIGFuZCBkZXZpY2Ugc3BlY2lmaWMgb3BzIHRocm91
Z2g6Ogo+PiAgIAo+PiAtCWV4dGVybiBpbnQgbWRldl9zZXRfY2xhc3Moc3RydWN0IGRldmljZSAq
ZGV2LCB1MTYgaWQpOwo+PiArCWV4dGVybiBpbnQgbWRldl9zZXRfY2xhc3Moc3RydWN0IGRldmlj
ZSAqZGV2LCB1MTYgaWQsCj4+ICsJICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lk
ICpvcHMpOwo+IEFwb2xvZ2llcyBpZiB0aGF0IGhhcyBhbHJlYWR5IGJlZW4gZGlzY3Vzc2VkLCBi
dXQgZG8gd2Ugd2FudCBhIDE6MQo+IHJlbGF0aW9uc2hpcCBiZXR3ZWVuIGlkIGFuZCBvcHMsIG9y
IGNhbiBkaWZmZXJlbnQgZGV2aWNlcyB3aXRoIHRoZSBzYW1lCj4gaWQgcmVnaXN0ZXIgZGlmZmVy
ZW50IG9wcz8KCgpJIHRoaW5rIHdlIGhhdmUgYSBOOjEgbWFwcGluZyBiZXR3ZWVuIGlkIGFuZCBv
cHMsIGUuZyB3ZSB3YW50IGJvdGggCnZpcnRpby1tZGV2IGFuZCB2aG9zdC1tZGV2IHVzZSBhIHNp
bmdsZSBzZXQgb2YgZGV2aWNlIG9wcy4KClRoYW5rcwoKCj4gSWYgdGhlIGZvcm1lciwgd291bGQg
aXQgbWFrZSBzZW5zZSB0byBmaXJzdAo+IHJlZ2lzdGVyIHRoZSBvcHMgZm9yIGFuIGlkIChvbmNl
KSwgYW5kIHRoZW4gaGF2ZSB0aGUgLT5jcmVhdGUgY2FsbGJhY2sKPiBvbmx5IHNldCB0aGUgY2xh
c3MgaWQgKHdpdGggdGhlIGNvcmUgZG9pbmcgdGhlIGxvb2t1cCBvZiB0aGUgb3BzKT8KPgo+PiAg
IAo+PiAgIEhvd2V2ZXIsIHRoZSBtZGV2X3BhcmVudF9vcHMgc3RydWN0dXJlIGlzIG5vdCByZXF1
aXJlZCBpbiB0aGUgZnVuY3Rpb24gY2FsbAo+PiAgIHRoYXQgYSBkcml2ZXIgc2hvdWxkIHVzZSB0
byB1bnJlZ2lzdGVyIGl0c2VsZiB3aXRoIHRoZSBtZGV2IGNvcmUgZHJpdmVyOjoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
