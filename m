Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D41D6DC3
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 05:29:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C18A2F85;
	Tue, 15 Oct 2019 03:29:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3F42F85
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 03:29:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2BC4D5D3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 03:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C10D308624A;
	Tue, 15 Oct 2019 03:29:30 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76A635D6A9;
	Tue, 15 Oct 2019 03:29:09 +0000 (UTC)
Subject: Re: [PATCH V3 6/7] virtio: introduce a mdev based transport
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-7-jasowang@redhat.com>
	<20191014173942.GB5359@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cf8fa583-fb2c-67c3-15d1-64efa8d73121@redhat.com>
Date: Tue, 15 Oct 2019 11:29:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191014173942.GB5359@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 15 Oct 2019 03:29:30 +0000 (UTC)
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

Ck9uIDIwMTkvMTAvMTUg5LiK5Y2IMTozOSwgU3RlZmFuIEhham5vY3ppIHdyb3RlOgo+IE9uIEZy
aSwgT2N0IDExLCAyMDE5IGF0IDA0OjE1OjU2UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
ICtzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlIHsKPj4gKwlzdHJ1Y3QgdmlydGlvX2RldmljZSB2
ZGV2Owo+PiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldjsKPj4gKwl1bnNpZ25lZCBsb25nIHZl
cnNpb247Cj4+ICsKPj4gKwlzdHJ1Y3QgdmlydHF1ZXVlICoqdnFzOwo+PiArCS8qIFRoZSBsb2Nr
IHRvIHByb3RlY3QgdmlydHF1ZXVlIGxpc3QgKi8KPj4gKwlzcGlubG9ja190IGxvY2s7Cj4+ICsJ
c3RydWN0IGxpc3RfaGVhZCB2aXJ0cXVldWVzOwo+IElzIHRoaXMgYSBsaXN0IG9mIHN0cnVjdCB2
aXJ0aW9fbWRldl92cV9pbmZvPyAgUGxlYXNlIGRvY3VtZW50IHRoZQo+IGFjdHVhbCB0eXBlIGlu
IGEgY29tbWVudC4KCgpPay4KCgo+PiArc3RhdGljIGludCB2aXJ0aW9fbWRldl9maW5kX3Zxcyhz
dHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgbnZxcywKPj4gKwkJCQlzdHJ1Y3Qg
dmlydHF1ZXVlICp2cXNbXSwKPj4gKwkJCQl2cV9jYWxsYmFja190ICpjYWxsYmFja3NbXSwKPj4g
KwkJCQljb25zdCBjaGFyICogY29uc3QgbmFtZXNbXSwKPj4gKwkJCQljb25zdCBib29sICpjdHgs
Cj4+ICsJCQkJc3RydWN0IGlycV9hZmZpbml0eSAqZGVzYykKPj4gK3sKPj4gKwlzdHJ1Y3Qgdmly
dGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSB0b192aXJ0aW9fbWRldl9kZXZpY2UodmRldik7Cj4+
ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gdm1fZ2V0X21kZXYodmRldik7Cj4+ICsJY29u
c3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X2Rldl9vcHMo
bWRldik7Cj4+ICsJc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIGNiOwo+PiArCWludCBpLCBl
cnIsIHF1ZXVlX2lkeCA9IDA7Cj4+ICsKPj4gKwl2bV9kZXYtPnZxcyA9IGttYWxsb2NfYXJyYXko
cXVldWVfaWR4LCBzaXplb2YoKnZtX2Rldi0+dnFzKSwKPj4gKwkJCQkgICAgR0ZQX0tFUk5FTCk7
Cj4ga21hbGxvY19hcnJheSgwLCAuLi4pPyAgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIG52cXMgaW5z
dGVhZCBvZiBxdWV1ZV9pZHgKPiAoMCkuCj4KPiBXaGF0IGlzIHRoaXMgdGhlIHB1cnBvc2Ugb2Yg
dm1fZGV2LT52cXMgYW5kIGRvZXMgYW55dGhpbmcgZXZlciBhY2Nlc3MgaXQ/CgoKSXQncyB1c2Vs
ZXNzLCB3aWxsIHJlbW92ZSBpdC4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
