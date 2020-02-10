Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3927C158050
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 17:59:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 986EA83773;
	Mon, 10 Feb 2020 16:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-IDQD3ermnO; Mon, 10 Feb 2020 16:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CD7C843FA;
	Mon, 10 Feb 2020 16:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7166C1D87;
	Mon, 10 Feb 2020 16:59:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93CD7C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 823F683773
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hXEBNT3enMj
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:59:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D5EE9844D5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ll4buIJukwY/pRiSVbGMIX07/MqDt1FyJ94Rs6Q9sl4=; b=J+Sg4AGuBNxYvElc9L7vefYKPs
 t7Lxcyew/cLA5Ius46AMRmRtu/Y5RjQEXlkvIWPSCWfwsQFKux1z0A1lcCH9sXKXaU8WUBnvjMb8E
 mIID9Qcugu4oxZ3Hv3Y5qVYP/bCNsncldpBHG3U1ta+A0WVFdbQ3M+MQ3WblVON3jTjm8KylDL4Us
 PjFQUPEyFbXKEW6gj7VpzRVerxLnCfbV3lWRqEuLufe89m9wj2Qpbzo0/t2aZDONPppafGGoqvGWO
 flFtmZEymhOW8jxYG3wTsKA5/oYPwvVRBUC0iZeaziCar4/JaXFK0PQxMdyM135ESmmCwS80NNIJO
 yq62DgCQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61329
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j1CP3-0007bJ-7y; Mon, 10 Feb 2020 17:59:21 +0100
Subject: Re: [PATCH v2 2/2] drm/qxl: add drm_driver.release callback.
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20200210113753.5614-1-kraxel@redhat.com>
 <20200210113753.5614-3-kraxel@redhat.com>
 <20200210150633.GS43062@phenom.ffwll.local>
 <f83001ab-8017-0576-69fd-d5f62bda84fd@tronnes.org>
Message-ID: <8b28f881-ea8e-af70-3ce3-f1d9b4a7f31a@tronnes.org>
Date: Mon, 10 Feb 2020 17:59:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <f83001ab-8017-0576-69fd-d5f62bda84fd@tronnes.org>
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

KGFkZGluZyBiYWNrIERhbmllbCkKCkRlbiAxMC4wMi4yMDIwIDE3LjU3LCBza3JldiBOb3JhbGYg
VHLDuG5uZXM6Cj4gCj4gCj4gRGVuIDEwLjAyLjIwMjAgMTYuMDYsIHNrcmV2IERhbmllbCBWZXR0
ZXI6Cj4+IE9uIE1vbiwgRmViIDEwLCAyMDIwIGF0IDEyOjM3OjUyUE0gKzAxMDAsIEdlcmQgSG9m
Zm1hbm4gd3JvdGU6Cj4+PiBNb3ZlIGZpbmFsIGNsZWFudXBzIHRvIHF4bF9kcm1fcmVsZWFzZSgp
IGNhbGxiYWNrLgo+Pj4gQWRkIGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKCkgY2FsbCB0byBx
eGxfcGNpX3JlbW92ZSgpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2
LmMgfCAyNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAx
OSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5j
Cj4+PiBpbmRleCAxZDYwMWY1N2E2YmEuLjRmZGEzZjliMjlmNCAxMDA2NDQKPj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kcnYuYwo+Pj4gQEAgLTM0LDYgKzM0LDcgQEAKPj4+ICAjaW5jbHVkZSA8bGludXgvcGNp
Lmg+Cj4+PiAgCj4+PiAgI2luY2x1ZGUgPGRybS9kcm0uaD4KPj4+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmg+Cj4+PiAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4+PiAgI2lu
Y2x1ZGUgPGRybS9kcm1fZmlsZS5oPgo+Pj4gICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVs
cGVyLmg+Cj4+PiBAQCAtMTMyLDIxICsxMzMsMzAgQEAgcXhsX3BjaV9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKPj4+ICAJcmV0dXJu
IHJldDsKPj4+ICB9Cj4+PiAgCj4+PiArc3RhdGljIHZvaWQgcXhsX2RybV9yZWxlYXNlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCj4+PiArewo+Pj4gKwlzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiA9
IGRldi0+ZGV2X3ByaXZhdGU7Cj4+PiArCj4+PiArCS8qCj4+PiArCSAqIFRPRE86IHF4bF9kZXZp
Y2VfZmluaSgpIGNhbGwgc2hvdWxkIGJlIGluIHF4bF9wY2lfcmVtb3ZlKCksCj4+PiArCSAqIHJl
b2RlcmluZyBxeGxfbW9kZXNldF9maW5pKCkgKyBxeGxfZGV2aWNlX2ZpbmkoKSBjYWxscyBpcwo+
Pj4gKwkgKiBub24tdHJpdmlhbCB0aG91Z2guCj4+PiArCSAqLwo+Pj4gKwlxeGxfbW9kZXNldF9m
aW5pKHFkZXYpOwo+Pgo+PiBTbyB0aGUgZHJtX21vZGVfY29uZmlnX2NsZWFudXAgY2FsbCBpbiBo
ZXJlIGJlbG9uZ3MgaW4gLT5yZWxlYXNlLCBidXQgdGhlCj4+IHF4bF9kZXN0cm95X21vbml0b3Jz
X29iamVjdCBmZWVscyBsaWtlIHNob3VsZCBiZSBwZXJmZWN0bHkgZmluZSBpbiB0aGUKPj4gcmVt
b3ZlIGhvb2suIFlvdSBtaWdodCBuZWVkIHRvIHNwcmlua2xlIGEgZmV3IGRybV9kZXZfZW50ZXIv
ZXhpdCBhcm91bmQgdG8KPj4gcHJvdGVjdCBjb2RlIHBhdGhzIHRob3VnaHQuCj4+Cj4+IEFzaWRl
IGZyb20gdGhpcyBsZ3RtLCBmb3IgdGhlIHNlcmllcwo+Pgo+PiBBY2tlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4KPj4gQW5kIHVwIHRvIHlvdSB3aGV0aGVy
IHlvdSB3YW50IHRvIGZpeCB0aGlzIG9yIG5vdCByZWFsbHkuCj4+Cj4+IEJ0dyBmb3IgdGVzdGlu
ZyBhbGwgdGhlc2UgcGF0Y2hlcyB0aGF0IGFkZCBhIC0+cmVsZWFzZSBob29rIEkgdGhpbmsgaXQn
ZAo+PiBiZSBnb29kIGlmIHRoZSBkcm0gY29yZSBjaGVja3MgdGhhdCBkcm1fZGV2aWNlLT5kZXYg
aXMgc2V0IHRvIE5VTEwsIGFuZAo+PiB0aGF0IHdlIGRvIHRoaXMgaW4gdGhlIHJlbW92ZSBob29r
LiBTaW5jZSB0aGF0J3MgZ3VhcmFudGVlZCB0byBiZSBnb25lIGF0Cj4+IHRoYXQgcG9pbnQsIHNv
IGFueXRoaW5nIGluIC0+cmVsZWFzZSB0aGF0IHN0aWxsIG5lZWRzIHRoZSBkZXZpY2UgaXMKPj4g
YnJva2VuLiBPZmMgbWF5YmUgZG8gdGhhdCBjaGVjayBvbmx5IGZvciBkcml2ZXJzIHdoaWNoIGhh
dmUgYSAtPnJlbGVhc2UKPj4gaG9vaywgYW5kIHdlIG1pZ2h0IG5lZWQgYSBmZXcgZml4dXBzLgo+
Pgo+IAo+IFdlIHRha2UgYSByZWYgb24gdGhlIHBhcmVudCBkZXZpY2UgaW4gZHJtX2Rldl9pbml0
KCkgYW5kIHJlbGVhc2UgaXQgaW4KPiBkcm1fZGV2X2ZpbmkoKS4gSSBhZGRlZCB0aGlzIGJlY2F1
c2Ugb2YgdGhlIERSTV9ERVZfKiBtYWNyb3Mgd2UgaGF2ZSwgdG8KPiBwcm90ZWN0IGFjY2VzcyB0
byB0aGUgZGV2aWNlIHN0cnVjdCBhZnRlciBpdCB3YXMgdW5yZWdpc3RlcmVkLiBTZXR0aW5nCj4g
ZHJtX2RldmljZS0+ZGV2IHRvIE5VTEwgaW4gZHJtX2Rldl91bnJlZ2lzdGVyKCkgaW5zdGVhZCB3
aWxsIHByb3ZpZGUgdGhlCj4gc2FtZSBwcm90ZWN0aW9uIEkgdGhpbmsuCj4gCj4gY29tbWl0IDU2
YmU2NTAzYWFiMgo+IGRybS9kcnY6IEhvbGQgcmVmIG9uIHBhcmVudCBkZXZpY2UgZHVyaW5nIGRy
bV9kZXZpY2UgbGlmZXRpbWUKPiAKPiBOb3JhbGYuCj4gCj4+IENoZWVycywgRGFuaWVsCj4+Cj4+
PiArCXF4bF9kZXZpY2VfZmluaShxZGV2KTsKPj4+ICsJZGV2LT5kZXZfcHJpdmF0ZSA9IE5VTEw7
Cj4+PiArCWtmcmVlKHFkZXYpOwo+Pj4gK30KPj4+ICsKPj4+ICBzdGF0aWMgdm9pZAo+Pj4gIHF4
bF9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+Pj4gIHsKPj4+ICAJc3RydWN0IGRy
bV9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPj4+IC0Jc3RydWN0IHF4bF9k
ZXZpY2UgKnFkZXYgPSBkZXYtPmRldl9wcml2YXRlOwo+Pj4gIAo+Pj4gIAlkcm1fZGV2X3VucmVn
aXN0ZXIoZGV2KTsKPj4+IC0KPj4+IC0JcXhsX21vZGVzZXRfZmluaShxZGV2KTsKPj4+IC0JcXhs
X2RldmljZV9maW5pKHFkZXYpOwo+Pj4gKwlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihkZXYp
Owo+Pj4gIAlpZiAoaXNfdmdhKHBkZXYpKQo+Pj4gIAkJdmdhX3B1dChwZGV2LCBWR0FfUlNSQ19M
RUdBQ1lfSU8pOwo+Pj4gLQo+Pj4gLQlkZXYtPmRldl9wcml2YXRlID0gTlVMTDsKPj4+IC0Ja2Zy
ZWUocWRldik7Cj4+PiAgCWRybV9kZXZfcHV0KGRldik7Cj4+PiAgfQo+Pj4gIAo+Pj4gQEAgLTI3
OSw2ICsyODksOCBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgcXhsX2RyaXZlciA9IHsKPj4+
ICAJLm1ham9yID0gMCwKPj4+ICAJLm1pbm9yID0gMSwKPj4+ICAJLnBhdGNobGV2ZWwgPSAwLAo+
Pj4gKwo+Pj4gKwkucmVsZWFzZSA9IHF4bF9kcm1fcmVsZWFzZSwKPj4+ICB9Owo+Pj4gIAo+Pj4g
IHN0YXRpYyBpbnQgX19pbml0IHF4bF9pbml0KHZvaWQpCj4+PiAtLSAKPj4+IDIuMTguMQo+Pj4K
Pj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
