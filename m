Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE8DC350
	for <lists.virtualization@lfdr.de>; Fri, 18 Oct 2019 12:59:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 86FB2D30;
	Fri, 18 Oct 2019 10:59:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8ECBB9BA
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 10:59:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1D5DC608
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 10:59:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DBB3CA377;
	Fri, 18 Oct 2019 10:59:20 +0000 (UTC)
Received: from [10.72.12.59] (ovpn-12-59.pek2.redhat.com [10.72.12.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87CDC60852;
	Fri, 18 Oct 2019 10:57:30 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] mdev: introduce virtio device and its device ops
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
	<20191017104836.32464-5-jasowang@redhat.com>
	<20191018094655.GA4200@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a2a8e447-c778-59db-071a-ffa348a69bb8@redhat.com>
Date: Fri, 18 Oct 2019 18:57:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018094655.GA4200@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 18 Oct 2019 10:59:20 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
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
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
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

Ck9uIDIwMTkvMTAvMTgg5LiL5Y2INTo0NiwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIFRodSwgT2N0
IDE3LCAyMDE5IGF0IDA2OjQ4OjM0UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+ICsgKiBA
Z2V0X3ZxX3N0YXRlOgkJR2V0IHRoZSBzdGF0ZSBmb3IgYSB2aXJ0cXVldWUKPj4gKyAqCQkJCUBt
ZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4gKyAqCQkJCUBpZHg6IHZpcnRxdWV1ZSBpbmRleAo+PiAr
ICoJCQkJUmV0dXJucyB2aXJ0cXVldWUgc3RhdGUgKGxhc3RfYXZhaWxfaWR4KQo+PiArICogQGdl
dF92cV9hbGlnbjoJCUdldCB0aGUgdmlydHF1ZXVlIGFsaWduIHJlcXVpcmVtZW50Cj4+ICsgKgkJ
CQlmb3IgdGhlIGRldmljZQo+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJ
CQkJUmV0dXJucyB2aXJ0cXVldWUgYWxnaW4gcmVxdWlyZW1lbnQKPj4gKyAqIEBnZXRfZmVhdHVy
ZXM6CQlHZXQgdmlydGlvIGZlYXR1cmVzIHN1cHBvcnRlZCBieSB0aGUgZGV2aWNlCj4+ICsgKgkJ
CQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4+ICsgKgkJCQlSZXR1cm5zIHRoZSB2aXJ0aW8gZmVh
dHVyZXMgc3VwcG9ydCBieSB0aGUKPj4gKyAqCQkJCWRldmljZQo+PiArICogQGdldF9mZWF0dXJl
czoJCVNldCB2aXJ0aW8gZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIKPiBzL2dldF9m
ZWF0dXJlcy9zZXRfZmVhdHVyZXMvCgoKV2lsbCBmaXguCgoKPgo+PiArICoJCQkJY29uZmlncmF0
aW9uIHNwYWNlCj4+ICsgKiBAZ2V0X21kZXZfZmVhdHVyZXM6CQlHZXQgdGhlIGZlYXR1cmUgb2Yg
dmlydGlvIG1kZXYgZGV2aWNlCj4+ICsgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4+ICsg
KgkJCQlSZXR1cm5zIHRoZSBtZGV2IGZlYXR1cmVzIChBUEkpIHN1cHBvcnQgYnkKPj4gKyAqCQkJ
CXRoZSBkZXZpY2UuCj4+ICsgKiBAZ2V0X2dlbmVyYXRpb246CQlHZXQgZGV2aWNlIGdlbmVyYXRv
bgo+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJCQkJUmV0dXJucyB1MzI6
IGRldmljZSBnZW5lcmF0aW9uCj4+ICsgKi8KPj4gK3N0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vf
b3BzIHsKPj4gKwkvKiBWaXJ0cXVldWUgb3BzICovCj4+ICsJaW50ICgqc2V0X3ZxX2FkZHJlc3Mp
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPj4gKwkJCSAgICAgIHUxNiBpZHgsIHU2NCBkZXNj
X2FyZWEsIHU2NCBkcml2ZXJfYXJlYSwKPj4gKwkJCSAgICAgIHU2NCBkZXZpY2VfYXJlYSk7Cj4+
ICsJdm9pZCAoKnNldF92cV9udW0pKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCwg
dTMyIG51bSk7Cj4+ICsJdm9pZCAoKmtpY2tfdnEpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwg
dTE2IGlkeCk7Cj4+ICsJdm9pZCAoKnNldF92cV9jYikoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
LCB1MTYgaWR4LAo+PiArCQkJICBzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2sgKmNiKTsKPj4g
Kwl2b2lkICgqc2V0X3ZxX3JlYWR5KShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgs
IGJvb2wgcmVhZHkpOwo+PiArCWJvb2wgKCpnZXRfdnFfcmVhZHkpKHN0cnVjdCBtZGV2X2Rldmlj
ZSAqbWRldiwgdTE2IGlkeCk7Cj4+ICsJaW50ICgqc2V0X3ZxX3N0YXRlKShzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYsIHUxNiBpZHgsIHU2NCBzdGF0ZSk7Cj4+ICsJdTY0ICgqZ2V0X3ZxX3N0YXRl
KShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgpOwo+PiArCj4+ICsJLyogRGV2aWNl
IG9wcyAqLwo+PiArCXUxNiAoKmdldF92cV9hbGlnbikoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
KTsKPj4gKwl1NjQgKCpnZXRfZmVhdHVyZXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4+
ICsJaW50ICgqc2V0X2ZlYXR1cmVzKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHU2NCBmZWF0
dXJlcyk7Cj4+ICsJdm9pZCAoKnNldF9jb25maWdfY2IpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRl
diwKPj4gKwkJCSAgICAgIHN0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFjayAqY2IpOwo+PiArCXUx
NiAoKmdldF92cV9udW1fbWF4KShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+PiArCXUzMiAo
KmdldF9kZXZpY2VfaWQpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4+ICsJdTMyICgqZ2V0
X3ZlbmRvcl9pZCkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPj4gKwl1OCAoKmdldF9zdGF0
dXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4+ICsJdm9pZCAoKnNldF9zdGF0dXMpKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTggc3RhdHVzKTsKPj4gKwl2b2lkICgqZ2V0X2NvbmZp
Zykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+PiArCQkJ
ICAgdm9pZCAqYnVmLCB1bnNpZ25lZCBpbnQgbGVuKTsKPj4gKwl2b2lkICgqc2V0X2NvbmZpZyko
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+PiArCQkJICAg
Y29uc3Qgdm9pZCAqYnVmLCB1bnNpZ25lZCBpbnQgbGVuKTsKPj4gKwl1NjQgKCpnZXRfbWRldl9m
ZWF0dXJlcykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPiBEbyB3ZSBuZWVkIGEgLnNldF9t
ZGV2X2ZlYXR1cmVzIG1ldGhvZCBhcyB3ZWxsPwoKCkdvb2QgcXVlc3Rpb24uIFRvIG1lIEkgdGhp
bmsgd2UgbWF5IGRvY3VtZW50IHRoYXQgdGhlIEFQSSBwcm92aWRlcyAKYmFja3dhcmQgY29tcGF0
aWJpbGl0eSwgc28gdGhlcmUncyBubyBuZWVkIGZvciBzZXRfbWRldl9mZWF0dXJlcy4gT3IgaXMg
CnRoZXJlIGFueSBvdGhlciBjaGFuY2UgdGhhdCB3ZSBuZWVkIHRoYXQ/CgoKPgo+IEl0J3Mgbm90
IHZlcnkgY2xlYXIgd2hhdCBkb2VzIG1kZXZfZmVhdHVyZXMgbWVhbi4KPiBEb2VzIGl0IG1lYW4g
dGhlIHZob3N0IGJhY2tlbmQgZmVhdHVyZXM/Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFs
ZHMvbGludXgvYmxvYi8wZTJhZGFiNmNmMjg1YzQxZTgyNWI2Yzc0YTNhYTYxMzI0ZDExMzJjL2lu
Y2x1ZGUvdWFwaS9saW51eC92aG9zdC5oI0w5My1MOTQKCgpTb21ldGhpbmcgbGlrZSB0aGlzLCBp
dCdzIGtpbmQgb2YgdGhlIHZlcnNpb24gb2YgdGhlIEFQSSwgZXhjZXB0IGZvciB0aGUgCl9GX1ZF
UlNJT05fMSwgdGhlIGZpcnN0IHVzZXIgc2hvdWxkIGJlIF9GX0xPR19BTEwuIEkgd2lsbCBhZGQg
bW9yZSBkb2NzIApmb3IgdGhpcyBBUEkuCgpUaGFua3MKCgo+Cj4KPj4gKwl1MzIgKCpnZXRfZ2Vu
ZXJhdGlvbikoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPj4gK307Cj4+ICsKPj4gK3ZvaWQg
bWRldl9zZXRfdmlydGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4+ICsJCQkgY29u
c3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKnZpcnRpb19vcHMpOwo+PiArCj4+ICsj
ZW5kaWYKPj4gLS0gCj4+IDIuMTkuMQo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
