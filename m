Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C5B5B54
	for <lists.virtualization@lfdr.de>; Wed, 18 Sep 2019 07:52:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48FEABBC;
	Wed, 18 Sep 2019 05:52:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1A9663EE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 05:52:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC728711
	for <virtualization@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 05:52:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B33AE30821BF;
	Wed, 18 Sep 2019 05:52:42 +0000 (UTC)
Received: from [10.72.12.111] (ovpn-12-111.pek2.redhat.com [10.72.12.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3BAA60872;
	Wed, 18 Sep 2019 05:52:18 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] mdev: device id support
To: Cornelia Huck <cohuck@redhat.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
	<20190912094012.29653-2-jasowang@redhat.com>
	<20190917140720.3686e0cc.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e53b38be-bc2a-785f-12d2-951805f3395f@redhat.com>
Date: Wed, 18 Sep 2019 13:52:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917140720.3686e0cc.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 18 Sep 2019 05:52:43 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: sebott@linux.ibm.com, mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org, oberpar@linux.ibm.com,
	kwankhede@nvidia.com, rob.miller@broadcom.com,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
	gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	virtualization@lists.linux-foundation.org,
	intel-gvt-dev@lists.freedesktop.org, lingshan.zhu@intel.com,
	akrowiak@linux.ibm.com, pmorel@linux.ibm.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, zhihong.wang@intel.com
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

Ck9uIDIwMTkvOS8xNyDkuIvljYg4OjA3LCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+IE9uIFRodSwg
MTIgU2VwIDIwMTkgMTc6NDA6MTEgKzA4MDAKPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPiB3cm90ZToKPgo+PiBNZGV2IGJ1cyBvbmx5IHN1cHBvcnQgdmZpbyBkcml2ZXIgcmlnaHQg
bm93LCBzbyBpdCBkb2Vzbid0IGltcGxlbWVudAo+PiBtYXRjaCBtZXRob2QuIEJ1dCBpbiB0aGUg
ZnV0dXJlLCB3ZSBtYXkgYWRkIGRyaXZlcnMgb3RoZXIgdGhhbiB2ZmlvLAo+PiBvbmUgZXhhbXBs
ZSBpcyB2aXJ0aW8tbWRldlsxXSBkcml2ZXIuIFRoaXMgbWVhbnMgd2UgbmVlZCB0byBhZGQgZGV2
aWNlCj4+IGlkIHN1cHBvcnQgaW4gYnVzIG1hdGNoIG1ldGhvZCB0byBwYWlyIHRoZSBtZGV2IGRl
dmljZSBhbmQgbWRldiBkcml2ZXIKPj4gY29ycmVjdGx5Lgo+IFNvdW5kcyByZWFzb25hYmxlLgo+
Cj4+IFNvIHRoaXMgcGF0Y2ggYWRkIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVyIGFuZCBpZCBmb3Ig
bWRldiBwYXJlbnQsIGFuZAo+PiBpbXBsZW1lbnQgdGhlIG1hdGNoIG1ldGhvZCBmb3IgbWRldiBi
dXMuCj4+Cj4+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS85LzEwLzEzNQo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgfCAgMiArLQo+PiAgIGRyaXZlcnMv
czM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICB8ICAyICstCj4+ICAgZHJpdmVycy9zMzkwL2NyeXB0
by92ZmlvX2FwX29wcy5jIHwgIDMgKystCj4+ICAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3Jl
LmMgICAgIHwgMTQgKysrKysrKysrKysrLS0KPj4gICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2Ry
aXZlci5jICAgfCAxNCArKysrKysrKysrKysrKwo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZf
cHJpdmF0ZS5oICB8ICAxICsKPj4gICBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAg
fCAgNiArKysrKysKPj4gICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAgICAgfCAgNiAr
KysrKy0KPj4gICBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgfCAgNiArKysrKysK
Pj4gICBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAgICAgfCAgMiArLQo+PiAgIHNhbXBs
ZXMvdmZpby1tZGV2L21kcHkuYyAgICAgICAgICB8ICAyICstCj4+ICAgc2FtcGxlcy92ZmlvLW1k
ZXYvbXR0eS5jICAgICAgICAgIHwgIDIgKy0KPj4gICAxMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ICguLi4pCj4KPiBUaGUgdHJhbnNmb3JtYXRpb25z
IG9mIHRoZSB2ZW5kb3IgZHJpdmVycyBhbmQgdGhlIG5ldyBpbnRlcmZhY2UgbG9vawo+IHNhbmUu
Cj4KPiAoLi4uKQo+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJs
ZS5oIGIvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaAo+PiBpbmRleCA1NzE0ZmQzNWE4
M2MuLmYxZmMxNDNkZjA0MiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNl
dGFibGUuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oCj4+IEBAIC04
MjEsNCArODIxLDEwIEBAIHN0cnVjdCB3bWlfZGV2aWNlX2lkIHsKPj4gICAJY29uc3Qgdm9pZCAq
Y29udGV4dDsKPj4gICB9Owo+PiAgIAo+PiArLyogTURFViAqLwo+PiArCj4gTWF5YmUgYWRkIHNv
bWUga2VybmVsZG9jIGFuZCBnaXZlIHZmaW8gYXMgYW4gZXhhbXBsZSBvZiB3aGF0IHdlJ3JlCj4g
bWF0Y2hpbmcgaGVyZT8KCgpXaWxsIGFkZCB3aGVuIHBvc3RpbmcgYSBub24gUkZDIHBhdGNoLgoK
Cj4KPj4gK3N0cnVjdCBtZGV2X2RldmljZV9pZCB7Cj4+ICsJX191OCBpZDsKPiBJIGFncmVlIHdp
dGggdGhlIHN1Z2dlc3Rpb24gdG8gcmVuYW1lIHRoaXMgdG8gJ2NsYXNzX2lkJy4KPgoKTGV0IG1l
IGNoYW5nZSBpdC4KClRoYW5rcwoKCj4+ICt9Owo+PiArCj4+ICAgI2VuZGlmIC8qIExJTlVYX01P
RF9ERVZJQ0VUQUJMRV9IICovCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
