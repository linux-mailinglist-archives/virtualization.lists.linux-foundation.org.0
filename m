Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255CD879B
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 06:41:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A330AB09;
	Wed, 16 Oct 2019 04:41:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E1EDD9E7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 04:41:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 82B6B14D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 04:41:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E8CA8E1CED;
	Wed, 16 Oct 2019 04:41:07 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7DDE5D9CD;
	Wed, 16 Oct 2019 04:38:53 +0000 (UTC)
Subject: Re: [PATCH V3 1/7] mdev: class id support
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-2-jasowang@redhat.com>
	<20191015103806.0538ccb2@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3f6121a9-7d25-df8d-86ec-14443ab036f6@redhat.com>
Date: Wed, 16 Oct 2019 12:38:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015103806.0538ccb2@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Wed, 16 Oct 2019 04:41:08 +0000 (UTC)
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
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
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

Ck9uIDIwMTkvMTAvMTYg5LiK5Y2IMTI6MzgsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiBPbiBG
cmksIDExIE9jdCAyMDE5IDE2OjE1OjUxICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gICAgCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi9t
ZGV2X2NvcmUuYyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCj4+IGluZGV4IGI1NThk
NGNmZDA4Mi4uNzI0ZTliOTg0MWQ4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9t
ZGV2X2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+PiBAQCAt
NDUsNiArNDUsMTIgQEAgdm9pZCBtZGV2X3NldF9kcnZkYXRhKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiwgdm9pZCAqZGF0YSkKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChtZGV2X3NldF9kcnZk
YXRhKTsKPj4gICAKPj4gK3ZvaWQgbWRldl9zZXRfY2xhc3Moc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2LCB1MTYgaWQpCj4+ICt7Cj4+ICsJbWRldi0+Y2xhc3NfaWQgPSBpZDsKPj4gK30KPj4gK0VY
UE9SVF9TWU1CT0wobWRldl9zZXRfY2xhc3MpOwo+PiArCj4+ICAgc3RydWN0IGRldmljZSAqbWRl
dl9kZXYoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+PiAgIHsKPj4gICAJcmV0dXJuICZtZGV2
LT5kZXY7Cj4+IEBAIC0xMzUsNiArMTQxLDcgQEAgc3RhdGljIGludCBtZGV2X2RldmljZV9yZW1v
dmVfY2Ioc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQo+PiAgICAqIG1kZXZfcmVnaXN0
ZXJfZGV2aWNlIDogUmVnaXN0ZXIgYSBkZXZpY2UKPj4gICAgKiBAZGV2OiBkZXZpY2Ugc3RydWN0
dXJlIHJlcHJlc2VudGluZyBwYXJlbnQgZGV2aWNlLgo+PiAgICAqIEBvcHM6IFBhcmVudCBkZXZp
Y2Ugb3BlcmF0aW9uIHN0cnVjdHVyZSB0byBiZSByZWdpc3RlcmVkLgo+PiArICogQGlkOiBjbGFz
cyBpZC4KPj4gICAgKgo+PiAgICAqIEFkZCBkZXZpY2UgdG8gbGlzdCBvZiByZWdpc3RlcmVkIHBh
cmVudCBkZXZpY2VzLgo+PiAgICAqIFJldHVybnMgYSBuZWdhdGl2ZSB2YWx1ZSBvbiBlcnJvciwg
b3RoZXJ3aXNlIDAuCj4+IEBAIC0zMjQsNiArMzMxLDkgQEAgaW50IG1kZXZfZGV2aWNlX2NyZWF0
ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKPj4gICAJaWYgKHJldCkKPj4gICAJCWdvdG8gb3BzX2Ny
ZWF0ZV9mYWlsOwo+PiAgIAo+PiArCWlmICghbWRldi0+Y2xhc3NfaWQpCj4gVGhpcyBpcyBhIHNh
bml0eSB0ZXN0IGZhaWx1cmUgb2YgdGhlIHBhcmVudCBkcml2ZXIgb24gYSBwcml2aWxlZ2VkCj4g
cGF0aCwgSSB0aGluayBpdCdzIGZhaXIgdG8gcHJpbnQgYSB3YXJuaW5nIHdoZW4gdGhpcyBvY2N1
cnMgcmF0aGVyIHRoYW4KPiBvbmx5IHJldHVybiBhbiBlcnJubyB0byB0aGUgdXNlci4gIEluIGZh
Y3QsIHJldCBpcyBub3Qgc2V0IHRvIGFuIGVycm9yCj4gdmFsdWUgaGVyZSwgc28gaXQgbG9va3Mg
bGlrZSB0aGlzIGZhaWxzIHRvIGNyZWF0ZSB0aGUgZGV2aWNlIGJ1dAo+IHJldHVybnMgc3VjY2Vz
cy4gIFRoYW5rcywKPgo+IEFsZXgKCgpXaWxsIGZpeC4KClRoYW5rcwoKCj4KPj4gKwkJZ290byBj
bGFzc19pZF9mYWlsOwo+PiArCj4+ICAgCXJldCA9IGRldmljZV9hZGQoJm1kZXYtPmRldik7Cj4+
ICAgCWlmIChyZXQpCj4+ICAgCQlnb3RvIGFkZF9mYWlsOwo+PiBAQCAtMzQwLDYgKzM1MCw3IEBA
IGludCBtZGV2X2RldmljZV9jcmVhdGUoc3RydWN0IGtvYmplY3QgKmtvYmosCj4+ICAgCj4+ICAg
c3lzZnNfZmFpbDoKPj4gICAJZGV2aWNlX2RlbCgmbWRldi0+ZGV2KTsKPj4gK2NsYXNzX2lkX2Zh
aWw6Cj4+ICAgYWRkX2ZhaWw6Cj4+ICAgCXBhcmVudC0+b3BzLT5yZW1vdmUobWRldik7Cj4+ICAg
b3BzX2NyZWF0ZV9mYWlsOgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
