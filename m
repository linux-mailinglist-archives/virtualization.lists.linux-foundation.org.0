Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E650BEB16
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 06:06:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E6829CB0;
	Thu, 26 Sep 2019 04:06:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 916F2CA5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 04:06:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A34CFD0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 04:06:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DC00308FBFC;
	Thu, 26 Sep 2019 04:06:25 +0000 (UTC)
Received: from [10.72.12.101] (ovpn-12-101.pek2.redhat.com [10.72.12.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C3B45D9CC;
	Thu, 26 Sep 2019 04:04:58 +0000 (UTC)
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-7-jasowang@redhat.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
	<2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
	<20190925092044-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
Date: Thu, 26 Sep 2019 12:04:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925092044-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 26 Sep 2019 04:06:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"rob.miller@broadcom.com" <rob.miller@broadcom.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"lulu@redhat.com" <lulu@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Wang,
	Zhi A" <zhi.a.wang@intel.com>, "idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"parav@mellanox.com" <parav@mellanox.com>, "Wang,
	Zhihong" <zhihong.wang@intel.com>, "Vivi,
	Rodrigo" <rodrigo.vivi@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "Zhu,
	Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMTkvOS8yNSDkuIvljYg5OjIxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBTZXAgMjUsIDIwMTkgYXQgMDg6NDU6MjFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85LzI1IOS4i+WNiDU6MDksIFRpYW4sIEtldmluIHdyb3RlOgo+Pj4+IEZyb206
IEphc29uIFdhbmcgW21haWx0bzpqYXNvd2FuZ0ByZWRoYXQuY29tXQo+Pj4+IFNlbnQ6IFR1ZXNk
YXksIFNlcHRlbWJlciAyNCwgMjAxOSA5OjU0IFBNCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGltcGxl
bWVudHMgYmFzaWMgc3VwcG9ydCBmb3IgbWRldiBkcml2ZXIgdGhhdCBzdXBwb3J0cwo+Pj4+IHZp
cnRpbyB0cmFuc3BvcnQgZm9yIGtlcm5lbCB2aXJ0aW8gZHJpdmVyLgo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4+IC0tLQo+Pj4+ICAg
IGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICB8ICAgMiArCj4+Pj4gICAgaW5jbHVkZS9saW51
eC92aXJ0aW9fbWRldi5oIHwgMTQ1Cj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKQo+Pj4+ICAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21kZXYuaCBiL2luY2x1ZGUvbGludXgvbWRldi5o
Cj4+Pj4gaW5kZXggMzQxNDMwNzMxMWYxLi43M2FjMjdiM2I4NjggMTAwNjQ0Cj4+Pj4gLS0tIGEv
aW5jbHVkZS9saW51eC9tZGV2LmgKPj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L21kZXYuaAo+Pj4+
IEBAIC0xMjYsNiArMTI2LDggQEAgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2X2Zyb21fZGV2KHN0
cnVjdCBkZXZpY2UKPj4+PiAqZGV2KTsKPj4+Pgo+Pj4+ICAgIGVudW0gewo+Pj4+ICAgIAlNREVW
X0lEX1ZGSU8gPSAxLAo+Pj4+ICsJTURFVl9JRF9WSVJUSU8gPSAyLAo+Pj4+ICsJTURFVl9JRF9W
SE9TVCA9IDMsCj4+Pj4gICAgCS8qIE5ldyBlbnRyaWVzIG11c3QgYmUgYWRkZWQgaGVyZSAqLwo+
Pj4+ICAgIH07Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbWRl
di5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5oCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmQxYTQwYTczOTI2Ngo+Pj4+IC0tLSAvZGV2L251
bGwKPj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPj4+PiBAQCAtMCwwICsx
LDE0NSBAQAo+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICov
Cj4+Pj4gKy8qCj4+Pj4gKyAqIFZpcnRpbyBtZWRpYXRlZCBkZXZpY2UgZHJpdmVyCj4+Pj4gKyAq
Cj4+Pj4gKyAqIENvcHlyaWdodCAyMDE5LCBSZWQgSGF0IENvcnAuCj4+Pj4gKyAqICAgICBBdXRo
b3I6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4+PiArICovCj4+Pj4gKyNpZm5k
ZWYgX0xJTlVYX1ZJUlRJT19NREVWX0gKPj4+PiArI2RlZmluZSBfTElOVVhfVklSVElPX01ERVZf
SAo+Pj4+ICsKPj4+PiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+Pj4+ICsjaW5jbHVk
ZSA8bGludXgvbWRldi5oPgo+Pj4+ICsjaW5jbHVkZSA8dWFwaS9saW51eC92aG9zdC5oPgo+Pj4+
ICsKPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9ERVZJQ0VfQVBJX1NUUklORwkJInZpcnRpby1t
ZGV2Igo+Pj4+ICsjZGVmaW5lIFZJUlRJT19NREVWX1ZFUlNJT04gMHgxCj4+PiBKdXN0IGJlIGN1
cmlvdXMuIGlzIHRoaXMgdmVyc2lvbiBpZGVudGljYWwgdG8gdmlydGlvIHNwZWMgdmVyc2lvbiB0
aGF0IGJlbG93Cj4+PiBjYWxsYmFja3MgYXJlIGNyZWF0ZWQgZm9yLCBvciBqdXN0IGlycmVsZXZh
bnQ/Cj4+IEl0IGNvdWxkIGJlIGEgaGludCBidXQgYmFzaWNhbGx5IGl0J3MgYSB3YXkgZm9yIHVz
ZXJzcGFjZSBkcml2ZXIKPj4gY29tcGF0aWJpbGl0eS4gRm9yIGtlcm5lbCB3ZSBkb24ndCBuZWVk
IHRoaXMuCj4+Cj4+Cj4+Pj4gKwo+Pj4+ICtzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2sgewo+
Pj4+ICsJaXJxcmV0dXJuX3QgKCpjYWxsYmFjaykodm9pZCAqZGF0YSk7Cj4+Pj4gKwl2b2lkICpw
cml2YXRlOwo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiArLyoqCj4+Pj4gKyAqIHN0cnVjdCB2ZmlvX21k
ZXZfZGV2aWNlX29wcyAtIFN0cnVjdHVyZSB0byBiZSByZWdpc3RlcmVkIGZvciBlYWNoCj4+Pj4g
KyAqIG1kZXYgZGV2aWNlIHRvIHJlZ2lzdGVyIHRoZSBkZXZpY2UgdG8gdmlydGlvLW1kZXYgbW9k
dWxlLgo+Pj4+ICsgKgo+Pj4+ICsgKiBAc2V0X3ZxX2FkZHJlc3M6CQlTZXQgdGhlIGFkZHJlc3Mg
b2YgdmlydHF1ZXVlCj4+Pj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4+PiArICoJ
CQkJQGlkeDogdmlydHF1ZXVlIGluZGV4Cj4+Pj4gKyAqCQkJCUBkZXNjX2FyZWE6IGFkZHJlc3Mg
b2YgZGVzYyBhcmVhCj4+Pj4gKyAqCQkJCUBkcml2ZXJfYXJlYTogYWRkcmVzcyBvZiBkcml2ZXIg
YXJlYQo+Pj4+ICsgKgkJCQlAZGV2aWNlX2FyZWE6IGFkZHJlc3Mgb2YgZGV2aWNlIGFyZWEKPj4+
PiArICoJCQkJUmV0dXJucyBpbnRlZ2VyOiBzdWNjZXNzICgwKSBvciBlcnJvciAoPCAwKQo+Pj4+
ICsgKiBAc2V0X3ZxX251bToJCVNldCB0aGUgc2l6ZSBvZiB2aXJ0cXVldWUKPj4+PiArICoJCQkJ
QG1kZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlAaWR4OiB2aXJ0cXVldWUgaW5kZXgK
Pj4+PiArICoJCQkJQG51bTogdGhlIHNpemUgb2YgdmlydHF1ZXVlCj4+Pj4gKyAqIEBraWNrX3Zx
OgkJCUtpY2sgdGhlIHZpcnRxdWV1ZQo+Pj4+ICsgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNl
Cj4+Pj4gKyAqCQkJCUBpZHg6IHZpcnRxdWV1ZSBpbmRleAo+Pj4+ICsgKiBAc2V0X3ZxX2NiOgkJ
CVNldCB0aGUgaW50ZXJydXQgY2FsYmFjayBmdW5jdGlvbiBmb3IKPj4+PiArICoJCQkJYSB2aXJ0
cXVldWUKPj4+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlAaWR4
OiB2aXJ0cXVldWUgaW5kZXgKPj4+PiArICoJCQkJQGNiOiB2aXJ0aW8tbWRldiBpbnRlcnJ1cHQg
Y2FsbGJhY2sKPj4+PiBzdHJ1Y3R1cmUKPj4+PiArICogQHNldF92cV9yZWFkeToJCVNldCByZWFk
eSBzdGF0dXMgZm9yIGEgdmlydHF1ZXVlCj4+Pj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZp
Y2UKPj4+PiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4Cj4+Pj4gKyAqCQkJCUByZWFkeTog
cmVhZHkgKHRydWUpIG5vdCByZWFkeShmYWxzZSkKPj4+PiArICogQGdldF92cV9yZWFkeToJCUdl
dCByZWFkeSBzdGF0dXMgZm9yIGEgdmlydHF1ZXVlCj4+Pj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRl
ZCBkZXZpY2UKPj4+PiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4Cj4+Pj4gKyAqCQkJCVJl
dHVybnMgYm9vbGVhbjogcmVhZHkgKHRydWUpIG9yIG5vdCAoZmFsc2UpCj4+Pj4gKyAqIEBzZXRf
dnFfc3RhdGU6CQlTZXQgdGhlIHN0YXRlIGZvciBhIHZpcnRxdWV1ZQo+Pj4+ICsgKgkJCQlAbWRl
djogbWVkaWF0ZWQgZGV2aWNlCj4+Pj4gKyAqCQkJCUBpZHg6IHZpcnRxdWV1ZSBpbmRleAo+Pj4+
ICsgKgkJCQlAc3RhdGU6IHZpcnRxdWV1ZSBzdGF0ZSAobGFzdF9hdmFpbF9pZHgpCj4+Pj4gKyAq
CQkJCVJldHVybnMgaW50ZWdlcjogc3VjY2VzcyAoMCkgb3IgZXJyb3IgKDwgMCkKPj4+PiArICog
QGdldF92cV9zdGF0ZToJCUdldCB0aGUgc3RhdGUgZm9yIGEgdmlydHF1ZXVlCj4+Pj4gKyAqCQkJ
CUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4+PiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4
Cj4+Pj4gKyAqCQkJCVJldHVybnMgdmlydHF1ZXVlIHN0YXRlIChsYXN0X2F2YWlsX2lkeCkKPj4+
PiArICogQGdldF92cV9hbGlnbjoJCUdldCB0aGUgdmlydHF1ZXVlIGFsaWduIHJlcXVpcmVtZW50
Cj4+Pj4gKyAqCQkJCWZvciB0aGUgZGV2aWNlCj4+Pj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBk
ZXZpY2UKPj4+PiArICoJCQkJUmV0dXJucyB2aXJ0cXVldWUgYWxnaW4gcmVxdWlyZW1lbnQKPj4+
PiArICogQGdldF9mZWF0dXJlczoJCUdldCB2aXJ0aW8gZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRo
ZSBkZXZpY2UKPj4+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlS
ZXR1cm5zIHRoZSBmZWF0dXJlcyBzdXBwb3J0IGJ5IHRoZQo+Pj4+ICsgKgkJCQlkZXZpY2UKPj4+
PiArICogQGdldF9mZWF0dXJlczoJCVNldCB2aXJ0aW8gZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRo
ZSBkcml2ZXIKPj4+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlA
ZmVhdHVyZXM6IGZlYXR1cmUgc3VwcG9ydCBieSB0aGUgZHJpdmVyCj4+Pj4gKyAqCQkJCVJldHVy
bnMgaW50ZWdlcjogc3VjY2VzcyAoMCkgb3IgZXJyb3IgKDwgMCkKPj4+PiArICogQHNldF9jb25m
aWdfY2I6CQlTZXQgdGhlIGNvbmZpZyBpbnRlcnJ1cHQgY2FsbGJhY2sKPj4+PiArICoJCQkJQG1k
ZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlAY2I6IHZpcnRpby1tZGV2IGludGVycnVw
dCBjYWxsYmFjawo+Pj4+IHN0cnVjdHVyZQo+Pj4+ICsgKiBAZ2V0X2RldmljZV9pZDoJCUdldCB2
aXJ0aW8gZGV2aWNlIGlkCj4+Pj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4+PiAr
ICoJCQkJUmV0dXJucyB1MzI6IHZpcnRpbyBkZXZpY2UgaWQKPj4+PiArICogQGdldF92ZW5kb3Jf
aWQ6CQlHZXQgdmlydGlvIHZlbmRvciBpZAo+Pj4+ICsgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2
aWNlCj4+Pj4gKyAqCQkJCVJldHVybnMgdTMyOiB2aXJ0aW8gdmVuZG9yIGlkCj4+Pj4gKyAqIEBn
ZXRfc3RhdHVzOgkJR2V0IHRoZSBkZXZpY2Ugc3RhdHVzCj4+Pj4gKyAqCQkJCUBtZGV2OiBtZWRp
YXRlZCBkZXZpY2UKPj4+PiArICoJCQkJUmV0dXJucyB1ODogdmlydGlvIGRldmljZSBzdGF0dXMK
Pj4+PiArICogQHNldF9zdGF0dXM6CQlTZXQgdGhlIGRldmljZSBzdGF0dXMKPj4+PiArICoJCQkJ
QG1kZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlAc3RhdHVzOiB2aXJ0aW8gZGV2aWNl
IHN0YXR1cwo+Pj4+ICsgKiBAZ2V0X2NvbmZpZzoJCVJlYWQgZnJvbSBkZXZpY2Ugc3BlY2lmaWMg
Y29uZml1Z3JhdGlvbgo+Pj4+IHNwYWNlCj4+PiBjb25maWd1cmF0aW9uIChhbmQgc2ltaWxhciB0
eXBvcyBkb3dud2FyZCkKPj4gTGV0IG1lIGZpeC4KPj4KPj4KPj4+PiArICoJCQkJQG1kZXY6IG1l
ZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlAb2Zmc2V0OiBvZmZzZXQgZnJvbSB0aGUgYmVnaW5u
aW5nIG9mCj4+Pj4gKyAqCQkJCWNvbmZpZ3VyYXRpb24gc3BhY2UKPj4+PiArICoJCQkJQGJ1Zjog
YnVmZmVyIHVzZWQgdG8gcmVhZCB0bwo+Pj4+ICsgKgkJCQlAbGVuOiB0aGUgbGVuZ3RoIHRvIHJl
YWQgZnJvbQo+Pj4+ICsgKgkJCQljb25maWdyYXRpb24gc3BhY2UKPj4+PiArICogQHNldF9jb25m
aWc6CQlXcml0ZSB0byBkZXZpY2Ugc3BlY2lmaWMgY29uZml1Z3JhdGlvbiBzcGFjZQo+Pj4+ICsg
KgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4+Pj4gKyAqCQkJCUBvZmZzZXQ6IG9mZnNldCBm
cm9tIHRoZSBiZWdpbm5pbmcgb2YKPj4+PiArICoJCQkJY29uZmlndXJhdGlvbiBzcGFjZQo+Pj4+
ICsgKgkJCQlAYnVmOiBidWZmZXIgdXNlZCB0byB3cml0ZSBmcm9tCj4+Pj4gKyAqCQkJCUBsZW46
IHRoZSBsZW5ndGggdG8gd3JpdGUgdG8KPj4+PiArICoJCQkJY29uZmlncmF0aW9uIHNwYWNlCj4+
Pj4gKyAqIEBnZXRfdmVyc2lvbjoJCUdldCB0aGUgdmVyc2lvbiBvZiB2aXJ0aW8gbWRldiBkZXZp
Y2UKPj4+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlSZXR1cm5z
IGludGVnZXI6IHZlcnNpb24gb2YgdGhlIGRldmljZQo+Pj4+ICsgKiBAZ2V0X2dlbmVyYXRpb246
CQlHZXQgZGV2aWNlIGdlbmVyYXRvbgo+Pj4+ICsgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNl
Cj4+Pj4gKyAqCQkJCVJldHVybnMgdTMyOiBkZXZpY2UgZ2VuZXJhdGlvbgo+Pj4+ICsgKi8KPj4+
PiArc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgewo+Pj4+ICsJLyogVmlydHF1ZXVlIG9w
cyAqLwo+Pj4+ICsJaW50ICgqc2V0X3ZxX2FkZHJlc3MpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRl
diwKPj4+PiArCQkJICAgICAgdTE2IGlkeCwgdTY0IGRlc2NfYXJlYSwgdTY0IGRyaXZlcl9hcmVh
LAo+Pj4+ICsJCQkgICAgICB1NjQgZGV2aWNlX2FyZWEpOwo+Pj4+ICsJdm9pZCAoKnNldF92cV9u
dW0pKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCwgdTMyIG51bSk7Cj4+Pj4gKwl2
b2lkICgqa2lja192cSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KTsKPj4+PiAr
CXZvaWQgKCpzZXRfdnFfY2IpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCwKPj4+
PiArCQkJICBzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2sgKmNiKTsKPj4+PiArCXZvaWQgKCpz
ZXRfdnFfcmVhZHkpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCwgYm9vbAo+Pj4+
IHJlYWR5KTsKPj4+PiArCWJvb2wgKCpnZXRfdnFfcmVhZHkpKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiwgdTE2IGlkeCk7Cj4+Pj4gKwlpbnQgKCpzZXRfdnFfc3RhdGUpKHN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldiwgdTE2IGlkeCwgdTY0IHN0YXRlKTsKPj4+PiArCXU2NCAoKmdldF92cV9zdGF0
ZSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KTsKPj4+PiArCj4+Pj4gKwkvKiBE
ZXZpY2Ugb3BzICovCj4+Pj4gKwl1MTYgKCpnZXRfdnFfYWxpZ24pKHN0cnVjdCBtZGV2X2Rldmlj
ZSAqbWRldik7Cj4+Pj4gKwl1NjQgKCpnZXRfZmVhdHVyZXMpKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldik7Cj4+Pj4gKwlpbnQgKCpzZXRfZmVhdHVyZXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRl
diwgdTY0IGZlYXR1cmVzKTsKPj4+PiArCXZvaWQgKCpzZXRfY29uZmlnX2NiKShzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYsCj4+Pj4gKwkJCSAgICAgIHN0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFj
ayAqY2IpOwo+Pj4+ICsJdTE2ICgqZ2V0X3F1ZXVlX21heCkoc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2KTsKPj4+PiArCXUzMiAoKmdldF9kZXZpY2VfaWQpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRl
dik7Cj4+Pj4gKwl1MzIgKCpnZXRfdmVuZG9yX2lkKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYp
Owo+Pj4+ICsJdTggKCpnZXRfc3RhdHVzKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+Pj4+
ICsJdm9pZCAoKnNldF9zdGF0dXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTggc3RhdHVz
KTsKPj4+PiArCXZvaWQgKCpnZXRfY29uZmlnKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHVu
c2lnbmVkIGludCBvZmZzZXQsCj4+Pj4gKwkJCSAgIHZvaWQgKmJ1ZiwgdW5zaWduZWQgaW50IGxl
bik7Cj4+Pj4gKwl2b2lkICgqc2V0X2NvbmZpZykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1
bnNpZ25lZCBpbnQgb2Zmc2V0LAo+Pj4+ICsJCQkgICBjb25zdCB2b2lkICpidWYsIHVuc2lnbmVk
IGludCBsZW4pOwo+Pj4+ICsJaW50ICgqZ2V0X3ZlcnNpb24pKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldik7Cj4+Pj4gKwl1MzIgKCpnZXRfZ2VuZXJhdGlvbikoc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2KTsKPj4+PiArfTsKPj4+IEknbSBub3Qgc3VyZSBob3cgc3RhYmxlIGFib3ZlIG9wcyBhcmUu
Cj4+IEl0J3MgdGhlIGtlcm5lbCBpbnRlcm5hbCBBUEksIHNvIHRoZXJlJ3Mgbm8gc3RyaWN0IHJl
cXVpcmVtZW50IGZvciB0aGlzLiBXZQo+PiB3aWxsIGV4cG9ydCBhIHZlcnNpb24gdmFsdWUgZm9y
IHVzZXJzcGFjZSBmb3IgY29tcGF0aWJpbGl0eS4KPiBHaXZlbiBpdCdzIHRpZWQgdG8gdmlydGlv
IHdlIHByb2JhYmx5IHdhbnQga2VybmVsK3VzZXJzcGFjZQo+IGZlYXR1cmUgYml0cz8KCgpZZXMs
IHRoZW4gSSB0aGluayB3ZSBjb3VsZCBwcm9iYWJseSBoYXZlIGEgdmVyc2lvbiBmaWVsZCBpbnNp
ZGUgZS5nIApkZXZpY2Vfb3BzIHN0cnVjdHVyZS4gVGhlbiBpdCBjb3VsZCBiZSBmZXRjaGVkIGZy
b20gYm90aCBrZXJuZWwgYW5kIAp1c2Vyc3BhY2UgZHJpdmVyLgoKVGhhbmtzCgoKPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
