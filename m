Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A8724C1E73
	for <lists.virtualization@lfdr.de>; Mon, 30 Sep 2019 11:51:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4882616B0;
	Mon, 30 Sep 2019 09:51:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3ED7B1687
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 09:51:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 94EFA71C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 09:51:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBAC53061423;
	Mon, 30 Sep 2019 09:51:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDC3A6012A;
	Mon, 30 Sep 2019 09:51:08 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com
	(zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 913601808878;
	Mon, 30 Sep 2019 09:51:08 +0000 (UTC)
Date: Mon, 30 Sep 2019 05:51:07 -0400 (EDT)
From: Frediano Ziglio <fziglio@redhat.com>
To: Christian Koenig <Christian.Koenig@amd.com>
Message-ID: <859065241.3666996.1569837067022.JavaMail.zimbra@redhat.com>
In-Reply-To: <3da66dc5-d78a-4aa7-4ecc-d28085d99502@amd.com>
References: <20190927132458.4359-1-christian.koenig@amd.com>
	<2008023935.3565992.1569601905303.JavaMail.zimbra@redhat.com>
	<3da66dc5-d78a-4aa7-4ecc-d28085d99502@amd.com>
Subject: Re: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
	driver internal functions
MIME-Version: 1.0
X-Originating-IP: [10.33.32.17, 10.4.195.4]
Thread-Topic: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
	driver internal functions
Thread-Index: AQHVd3FePLizV3BOzkihcGVBzkmeldDquPb5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 30 Sep 2019 09:51:08 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	daniel@ffwll.ch, airlied@redhat.com, spice-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

PiAKPiBBbSAyNy4wOS4xOSB1bSAxODozMSBzY2hyaWViIEZyZWRpYW5vIFppZ2xpbzoKPiA+PiBU
aGUgdHRtX21lbV9pb18qIGZ1bmN0aW9ucyBhcmUgYWN0dWFsbHkgaW50ZXJuYWwgdG8gVFRNIGFu
ZCBzaG91bGRuJ3QgYmUKPiA+PiB1c2VkIGluIGEgZHJpdmVyLgo+ID4+Cj4gPiBBcyBmYXIgYXMg
SSBjYW4gc2VlIGJ5IHlvdXIgc2Vjb25kIHBhdGNoIFFYTCBpcyBqdXN0IHVzaW5nIGV4cG9ydGVk
Cj4gPiAodGhhdCBpcyBub3QgaW50ZXJuYWwpIGZ1bmN0aW9ucy4KPiA+IE5vdCB0aGF0IHRoZSBp
ZGVhIG9mIG1ha2luZyB0aGVtIGludGVybmFsIGlzIGJhZCBidXQgdGhpcyBjb21tZW50IGlzCj4g
PiBhIHdyb25nIHN0YXRlbWVudC4KPiAKPiBTZWUgdGhlIGhpc3Rvcnkgb2YgZXhwb3J0aW5nIHRo
b3NlLCB0aGF0IHdhcyBkb25lIHNwZWNpZmljYWxseSBzbyB0aGF0Cj4gUVhMIGNhbiBjYWxsIHRo
ZW0gKGNvbW1pdCBhZmU2ODA0YzA0NWZiZDY5YTFiNzVjNjgxMTA3YjVkNmRmOTE5MGRlKS4KPiAK
PiBCdXQgdGhvc2UgYXJlIHRoZSBpbnRlcm5hbCBmdW5jdGlvbnMgd2hpY2ggVFRNIHVzZXMgdG8g
Y2FsbCBpbnRvIHRoZQo+IGRyaXZlci4gVGhhdCBhIGRyaXZlciB1c2VzIHRoZW0gdG8gY2FsbCBp
bnRvIGl0c2VsZiBkb2Vzbid0IHNlZW0gdG8gbWFrZQo+IHNlbnNlLgo+IAoKVGhlIGNvbW1pdCB3
YXMgbWVyZ2VkIGFuZCByZWxlYXNlIGluIExpbnV4IDMuMTAgNiB5ZWFycyBhZ28sIHNpbmNlCnRo
ZW4gdGhlc2UgZnVuY3Rpb25zIGhhdmUgYmVlbiBleHBvcnRlZC4gTm90IHNheWluZyB0aGF0IHRo
ZSBRWEwgY2hhbmdlCndhcyB3cm9uZyBhbmQgc2hvdWxkIG5vdCBoYXZlIGJlZW4gYWNrZWQgYW5k
IG1lcmdlZCBidXQgYWZ0ZXIgNiB5ZWFycwpzYXlpbmcgdGhhdCB0aGVzZSBmdW5jdGlvbnMgYXJl
IGludGVybmFsIGl0J3Mgbm90IGNvcnJlY3QuCgpTb21ldGhpbmcgbGlrZQoKIlRoZSB0dG1fbWVt
X2lvXyogZnVuY3Rpb25zIHdlcmUgaW50ZW5kZWQgdG8gYmUgaW50ZXJuYWwgdG8gVFRNIGFuZApz
aG91bGRuJ3QgaGF2ZSBiZWVuIHVzZWQgaW4gYSBkcml2ZXIuIFRoZXkgd2VyZSBleHBvcnRlZCBp
biBjb21taXQKYWZlNjgwNGMwNDVmYmQ2OWExYjc1YzY4MTEwN2I1ZDZkZjkxOTBkZSBqdXN0IGZv
ciBRWEwuIgoKPiA+PiBJbnN0ZWFkIGNhbGwgdGhlIHF4bF90dG1faW9fbWVtX3Jlc2VydmUoKSBm
dW5jdGlvbiBkaXJlY3RseS4KPiA+Pgo+ID4gSSB3b3VsZCBhZGQgdGhhdCBxeGxfdHRtX2lvX21l
bV9mcmVlIGlzIGVtcHR5IHNvIHRoZSByZW1vdmFsIG9mCj4gPiB0dG1fbWVtX2lvX2ZyZWUgaXMg
ZmluZS4KPiAKPiBHb29kIHBvaW50LCBnb2luZyB0byBhZGQgdGhhdC4KPiAKPiBUaGFua3MsCj4g
Q2hyaXN0aWFuLgo+IAoKRnJlZGlhbm8KCj4gPgo+ID4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oICAgIHwgIDIgKysKPiA+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX29iamVjdC5jIHwgMTEgKy0tLS0tLS0tLS0KPiA+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3R0bS5jICAgIHwgIDQgKystLQo+ID4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmgK
PiA+PiBpbmRleCA5ZTAzNGM1ZmE4N2QuLjhhMjRmOGUxMDFkYSAxMDA2NDQKPiA+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX2Rydi5oCj4gPj4gQEAgLTM1NCw2ICszNTQsOCBAQCBpbnQgcXhsX21vZGVfZHVtYl9t
bWFwKHN0cnVjdCBkcm1fZmlsZSAqZmlscCwKPiA+PiAgIC8qIHF4bCB0dG0gKi8KPiA+PiAgIGlu
dCBxeGxfdHRtX2luaXQoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYpOwo+ID4+ICAgdm9pZCBxeGxf
dHRtX2Zpbmkoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYpOwo+ID4+ICtpbnQgcXhsX3R0bV9pb19t
ZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiA+PiArCQkJICAgc3RydWN0
IHR0bV9tZW1fcmVnICptZW0pOwo+ID4+ICAgaW50IHF4bF9tbWFwKHN0cnVjdCBmaWxlICpmaWxw
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gPj4gICAKPiA+PiAgIC8qIHF4bCBpbWFn
ZSAqLwo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYwo+
ID4+IGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKPiA+PiBpbmRleCA1NDhkZmU2
ZjNiMjYuLjI5OWU2M2E5NTFjNSAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9vYmplY3QuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5j
Cj4gPj4gQEAgLTE0OCw3ICsxNDgsNiBAQCBpbnQgcXhsX2JvX2ttYXAoc3RydWN0IHF4bF9ibyAq
Ym8sIHZvaWQgKipwdHIpCj4gPj4gICB2b2lkICpxeGxfYm9fa21hcF9hdG9taWNfcGFnZShzdHJ1
Y3QgcXhsX2RldmljZSAqcWRldiwKPiA+PiAgIAkJCSAgICAgIHN0cnVjdCBxeGxfYm8gKmJvLCBp
bnQgcGFnZV9vZmZzZXQpCj4gPj4gICB7Cj4gPj4gLQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFn
ZXIgKm1hbiA9Cj4gPj4gJmJvLT50Ym8uYmRldi0+bWFuW2JvLT50Ym8ubWVtLm1lbV90eXBlXTsK
PiA+PiAgIAl2b2lkICpycHRyOwo+ID4+ICAgCWludCByZXQ7Cj4gPj4gICAJc3RydWN0IGlvX21h
cHBpbmcgKm1hcDsKPiA+PiBAQCAtMTYwLDkgKzE1OSw3IEBAIHZvaWQgKnF4bF9ib19rbWFwX2F0
b21pY19wYWdlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAo+ID4+ICAgCWVsc2UKPiA+PiAgIAkJ
Z290byBmYWxsYmFjazsKPiA+PiAgIAo+ID4+IC0JKHZvaWQpIHR0bV9tZW1faW9fbG9jayhtYW4s
IGZhbHNlKTsKPiA+PiAtCXJldCA9IHR0bV9tZW1faW9fcmVzZXJ2ZShiby0+dGJvLmJkZXYsICZi
by0+dGJvLm1lbSk7Cj4gPj4gLQl0dG1fbWVtX2lvX3VubG9jayhtYW4pOwo+ID4+ICsJcmV0ID0g
cXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShiby0+dGJvLmJkZXYsICZiby0+dGJvLm1lbSk7Cj4gPj4g
ICAKPiA+PiAgIAlyZXR1cm4gaW9fbWFwcGluZ19tYXBfYXRvbWljX3djKG1hcCwgYm8tPnRiby5t
ZW0uYnVzLm9mZnNldCArCj4gPj4gICAJcGFnZV9vZmZzZXQpOwo+ID4+ICAgZmFsbGJhY2s6Cj4g
Pj4gQEAgLTE5MywxNyArMTkwLDExIEBAIHZvaWQgcXhsX2JvX2t1bm1hcChzdHJ1Y3QgcXhsX2Jv
ICpibykKPiA+PiAgIHZvaWQgcXhsX2JvX2t1bm1hcF9hdG9taWNfcGFnZShzdHJ1Y3QgcXhsX2Rl
dmljZSAqcWRldiwKPiA+PiAgIAkJCSAgICAgICBzdHJ1Y3QgcXhsX2JvICpibywgdm9pZCAqcG1h
cCkKPiA+PiAgIHsKPiA+PiAtCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0KPiA+
PiAmYm8tPnRiby5iZGV2LT5tYW5bYm8tPnRiby5tZW0ubWVtX3R5cGVdOwo+ID4+IC0KPiA+PiAg
IAlpZiAoKGJvLT50Ym8ubWVtLm1lbV90eXBlICE9IFRUTV9QTF9WUkFNKSAmJgo+ID4+ICAgCSAg
ICAoYm8tPnRiby5tZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1BSSVYpKQo+ID4+ICAgCQlnb3RvIGZh
bGxiYWNrOwo+ID4+ICAgCj4gPj4gICAJaW9fbWFwcGluZ191bm1hcF9hdG9taWMocG1hcCk7Cj4g
Pj4gLQo+ID4+IC0JKHZvaWQpIHR0bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsKPiA+PiAtCXR0
bV9tZW1faW9fZnJlZShiby0+dGJvLmJkZXYsICZiby0+dGJvLm1lbSk7Cj4gPj4gLQl0dG1fbWVt
X2lvX3VubG9jayhtYW4pOwo+ID4+ICAgCXJldHVybjsKPiA+PiAgICBmYWxsYmFjazoKPiA+PiAg
IAlxeGxfYm9fa3VubWFwKGJvKTsKPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwo+ID4+IGluZGV4IDli
MjQ1MTRjNzVhYS4uY2I4MGU1MTJkZDQ2IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3R0bS5jCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMK
PiA+PiBAQCAtMTU5LDggKzE1OSw4IEBAIHN0YXRpYyBpbnQgcXhsX3ZlcmlmeV9hY2Nlc3Moc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0Cj4gPj4gKmJvLCBzdHJ1Y3QgZmlsZSAqZmlscCkKPiA+PiAg
IAkJCQkJICBmaWxwLT5wcml2YXRlX2RhdGEpOwo+ID4+ICAgfQo+ID4+ICAgCj4gPj4gLXN0YXRp
YyBpbnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwK
PiA+PiAtCQkJCSAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCj4gPj4gK2ludCBxeGxfdHRtX2lv
X21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ID4+ICsJCQkgICBzdHJ1
Y3QgdHRtX21lbV9yZWcgKm1lbSkKPiA+PiAgIHsKPiA+PiAgIAlzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bbWVtLT5tZW1fdHlwZV07Cj4gPj4gICAJc3RydWN0
IHF4bF9kZXZpY2UgKnFkZXYgPSBxeGxfZ2V0X3FkZXYoYmRldik7Cj4gPiBPdGhlcndpc2UgZmlu
ZSBmb3IgbWUuCj4gPgo+ID4gRnJlZGlhbm8KPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
