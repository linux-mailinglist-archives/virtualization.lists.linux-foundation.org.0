Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 87013DA19C
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 00:38:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 12F1DB6D;
	Wed, 16 Oct 2019 22:37:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62A3DB09
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 22:37:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 91625821
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 22:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AAD918C426E;
	Wed, 16 Oct 2019 22:37:55 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CC775D9DC;
	Wed, 16 Oct 2019 22:37:44 +0000 (UTC)
Date: Wed, 16 Oct 2019 16:37:44 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Parav Pandit <parav@mellanox.com>
Subject: Re: [PATCH V3 4/7] mdev: introduce device specific ops
Message-ID: <20191016163744.354c5373@x1.home>
In-Reply-To: <AM0PR05MB4866ED400954AC4164A9EA07D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-5-jasowang@redhat.com>
	<20191015124137.4f948bd2.cohuck@redhat.com>
	<eb7ecd99-7465-6be4-7ecd-84c11f66e0ac@redhat.com>
	<20191015112646.3776dc29@x1.home>
	<AM0PR05MB4866954855AF080639ED2384D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
	<20191016105232.663dd3c9.cohuck@redhat.com>
	<AM0PR05MB486625E53B8ADBA2BBAA80F6D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
	<20191016105303.6e01936f@x1.home>
	<AM0PR05MB4866ED400954AC4164A9EA07D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Wed, 16 Oct 2019 22:37:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"mst@redhat.com" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
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
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	Ido Shamay <idos@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
	"xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"zhihong.wang@intel.com" <zhihong.wang@intel.com>,
	"intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

T24gV2VkLCAxNiBPY3QgMjAxOSAyMDo0ODowNiArMDAwMApQYXJhdiBQYW5kaXQgPHBhcmF2QG1l
bGxhbm94LmNvbT4gd3JvdGU6Cgo+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxp
YW1zb25AcmVkaGF0LmNvbT4KPiA+IE9uIFdlZCwgMTYgT2N0IDIwMTkgMTU6MzE6MjUgKzAwMDAK
PiA+IFBhcmF2IFBhbmRpdCA8cGFyYXZAbWVsbGFub3guY29tPiB3cm90ZToKPiA+ID4gPiBGcm9t
OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KPiA+ID4gPiBQYXJhdiBQYW5kaXQg
PHBhcmF2QG1lbGxhbm94LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+IEZyb206IEFsZXggV2lsbGlh
bXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgMTUg
T2N0IDIwMTkgMjA6MTc6MDEgKzA4MDAgSmFzb24gV2FuZwo+ID4gPiA+ID4gPiA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4gPiBPbiAyMDE5LzEw
LzE1IOS4i+WNiDY6NDEsIENvcm5lbGlhIEh1Y2sgd3JvdGU6ICAKPiA+ID4gPiA+ID4gPiA+IEFw
b2xvZ2llcyBpZiB0aGF0IGhhcyBhbHJlYWR5IGJlZW4gZGlzY3Vzc2VkLCBidXQgZG8gd2Ugd2Fu
dAo+ID4gPiA+ID4gPiA+ID4gYQo+ID4gPiA+ID4gPiA+ID4gMToxIHJlbGF0aW9uc2hpcCBiZXR3
ZWVuIGlkIGFuZCBvcHMsIG9yIGNhbiBkaWZmZXJlbnQKPiA+ID4gPiA+ID4gPiA+IGRldmljZXMg
d2l0aCB0aGUgc2FtZSBpZCByZWdpc3RlciBkaWZmZXJlbnQgb3BzPyAgCj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgd2UgaGF2ZSBhIE46MSBtYXBwaW5n
IGJldHdlZW4gaWQgYW5kIG9wcywgZS5nIHdlIHdhbnQKPiA+ID4gPiA+ID4gPiBib3RoIHZpcnRp
by1tZGV2IGFuZCB2aG9zdC1tZGV2IHVzZSBhIHNpbmdsZSBzZXQgb2YgZGV2aWNlIG9wcy4gIAo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgY29udGVudHMgb2YgdGhlIG9wcyBzdHJ1Y3R1cmUg
aXMgZXNzZW50aWFsbHkgZGVmaW5lZCBieSB0aGUKPiA+ID4gPiA+ID4gaWQsIHdoaWNoIGlzIHdo
eSBJIHdhcyBsZWFuaW5nIHRvd2FyZHMgdGhlbSBiZWluZyBkZWZpbmVkIHRvZ2V0aGVyLgo+ID4g
PiA+ID4gPiBUaGV5IGFyZSBlZmZlY3RpdmVseSBpbnRlcmxvY2tlZCwgdGhlIGlkIGRlZmluZXMg
d2hpY2ggbWRldiAiZW5kcG9pbnQiCj4gPiA+ID4gPiA+IGRyaXZlciBpcyBsb2FkZWQgYW5kIHRo
YXQgZHJpdmVyIHJlcXVpcmVzIG1kZXZfZ2V0X2Rldl9vcHMoKSB0bwo+ID4gPiA+ID4gPiByZXR1
cm4gdGhlIHN0cnVjdHVyZSByZXF1aXJlZCBieSB0aGUgZHJpdmVyLiAgSSB3aXNoIHRoZXJlIHdh
cyBhCj4gPiA+ID4gPiA+IHdheSB3ZSBjb3VsZCBpbmNvcnBvcmF0ZSB0eXBlIGNoZWNraW5nIGhl
cmUuICBXZSB0b3llZCB3aXRoIHRoZQo+ID4gPiA+ID4gPiBpZGVhIG9mIGhhdmluZyB0aGUgY2xh
c3MgaW4gdGhlIHNhbWUgc3RydWN0dXJlIGFzIHRoZSBvcHMsIGJ1dCBJCj4gPiA+ID4gPiA+IHRo
aW5rIHRoaXMgYXBwcm9hY2ggd2FzIGNob3NlbiBmb3Igc2ltcGxpY2l0eS4gIFdlIGNvdWxkIHN0
aWxsIGRvICAKPiA+IHNvbWV0aGluZyBsaWtlOiAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGlu
dCBtZGV2X3NldF9jbGFzc19zdHJ1Y3Qoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3QK
PiA+ID4gPiA+ID4gbWRldl9jbGFzc19zdHJ1Y3QgKmNsYXNzKTsKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gc3RydWN0IG1kZXZfY2xhc3Nfc3RydWN0IHsKPiA+ID4gPiA+ID4gCXUxNglpZDsKPiA+
ID4gPiA+ID4gCXVuaW9uIHsKPiA+ID4gPiA+ID4gCQlzdHJ1Y3QgdmZpb19tZGV2X29wcyB2Zmlv
X29wczsKPiA+ID4gPiA+ID4gCQlzdHJ1Y3QgdmlydGlvX21kZXZfb3BzIHZpcnRpb19vcHM7Cj4g
PiA+ID4gPiA+IAl9Owo+ID4gPiA+ID4gPiB9Owo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBNYXli
ZSBldmVuOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBzdHJ1Y3QgdmZpb19tZGV2X29wcyAqbWRl
dl9nZXRfdmZpb19vcHMoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KSAgCj4gPiB7ICAKPiA+ID4g
PiA+ID4gCUJVR19PTihtZGV2LT5jbGFzcy5pZCAhPSBNREVWX0lEX1ZGSU8pOwo+ID4gPiA+ID4g
PiAJcmV0dXJuICZtZGV2LT5jbGFzcy52ZmlvX29wczsKPiA+ID4gPiA+ID4gfQo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBUaGUgbWF0Y2ggY2FsbGJhY2sgd291bGQgb2YgY291cnNlIGp1c3QgdXNl
IHRoZSBtZGV2LT5jbGFzcy5pZCB2YWx1ZS4KPiA+ID4gPiA+ID4gRnVuY3Rpb25hbGx5IGVxdWl2
YWxlbnQsIGJ1dCBtYXliZSBiZXR0ZXIgdHlwZSBjaGFyYWN0ZXJpc3RpY3MuCj4gPiA+ID4gPiA+
IFRoYW5rcywKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQWxleCAgCj4gPiA+ID4gPgo+ID4gPiA+
ID4gV2UgaGF2ZSAzIHVzZSBjYXNlcyBvZiBtZGV2Lgo+ID4gPiA+ID4gMS4gY3VycmVudCBtZGV2
IGJpbmRpbmcgdG8gdmZpb19tZGV2IDIuIG1kZXYgYmluZGluZyB0byB2aXJ0aW8gMy4KPiA+ID4g
PiA+IG1kZXYgYmluZGluZyB0byBtbHg1X2NvcmUgd2l0aG91dCBkZXZfb3BzCj4gPiA+ID4gPgo+
ID4gPiA+ID4gQWxzbwo+ID4gPiA+ID4gKGEpIGEgZ2l2ZW4gcGFyZW50IG1heSBzZXJ2ZSBtdWx0
aXBsZSB0eXBlcyBvZiBjbGFzc2VzIGluIGZ1dHVyZS4KPiA+ID4gPiA+IChiKSBudW1iZXIgb2Yg
Y2xhc3NlcyBtYXkgbm90IGxpa2VseSBleHBsb2RlLCB0aGV5IHdpbGwgYmUgaGFuZGZ1bAo+ID4g
PiA+ID4gb2YgdGhlbS4gKHZmaW9fbWRldiwgdmlydGlvKQo+ID4gPiA+ID4KPiA+ID4gPiA+IFNv
LCBpbnN0ZWFkIG9mIG1ha2luZyBjb3BpZXMgb2YgdGhpcyBkZXZfb3BzIHBvaW50ZXIgaW4gZWFj
aCBtZGV2LAo+ID4gPiA+ID4gaXQgaXMgYmV0dGVyICAKPiA+ID4gPiB0byBrZWVwIGNvbnN0IG11
bHRpcGxlIG9wcyBpbiB0aGVpciBwYXJlbnQgZGV2aWNlLiAgCj4gPiA+ID4gPiBTb21ldGhpbmcg
bGlrZSBiZWxvdywKPiA+ID4gPiA+Cj4gPiA+ID4gPiBzdHJ1Y3QgbWRldl9wYXJlbnQgewo+ID4g
PiA+ID4gCVsuLl0KPiA+ID4gPiA+IAlzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzICpwYXJlbnRfb3Bz
OyAvKiBjcmVhdGUsIHJlbW92ZSAqLwo+ID4gPiA+ID4gCXN0cnVjdCB2ZmlvX21kZXZfb3BzICp2
ZmlvX29wczsgLyogcmVhZCx3cml0ZSwgaW9jdGwgZXRjICovCj4gPiA+ID4gPiAJc3RydWN0IHZp
cnRpb19tZGV2X29wcyAqdmlydGlvX29wczsgLyogdmlydGlvIG9wcyAqLyB9OyAgCj4gPiA+ID4K
PiA+ID4gPiBUaGF0IGZlZWxzIGEgYml0IG9kZC4gV2h5IHNob3VsZCB0aGUgcGFyZW50IGNhcnJ5
IHBvaW50ZXJzIHRvIGV2ZXJ5Cj4gPiA+ID4gcG9zc2libGUgdmVyc2lvbiBvZiBvcHM/Cj4gPiA+
ID4gIAo+ID4gPiBIb3cgbWFueSBhcmUgd2UgZXhwZWN0aW5nPyBJIGVudmlzaW9uZWQgaGFuZGZ1
bCBvZiB0aGVtLgo+ID4gPiBJdCBjYXJyaWVzIGJlY2F1c2UgcGFyZW50IGlzIGZldywgbWRldnMg
YXJlIHNldmVyYWwgaHVuZHJlZHMuCj4gPiA+IEl0IG1ha2VzIHNlbnNlIHRvIGtlZXAgZmV3IGNv
cGllcywgaW5zdGVhZCBvZiBzZXZlcmFsIGh1bmRyZWQgY29waWVzCj4gPiA+IGFuZCBpdCBkb2Vz
bid0IG5lZWQgdG8gc2V0dXAgb24gZXZlcnkgbWRldiBjcmVhdGlvbi4gIAo+ID4gCj4gPiBJdCBk
b2VzIG5lZWQgc2V0dXAgb24gZXZlcnkgbWRldiBjcmVhdGlvbiwgaXQncyBqdXN0IGEgbWF0dGVy
IG9mIHRoZSBzY29wZSwgJ2lkCj4gPiBhbmQgb3BzJyB2cyAnaWQgb25seScgdnMgJ29wcyB3aXRo
IGltcGxpY2l0IGlkJy4gIFRoZSBvdGhlciBhcmd1bWVudCBpcyBhc3N1bWluZyBhCj4gPiBzcGFj
ZSB2cyB0aW1lIHRyYWRlLW9mZiB0aGF0IEknbSBoYXZpbmcgYSBoYXJkIHRpbWUganVkZ2luZyBp
cyBuZWNlc3NhcmlseSB0aGUKPiA+IGNvcnJlY3QgYXBwcm9hY2guICBXZSBwb3RlbnRpYWxseSBo
YXZlIGJldHRlciBkYXRhIGxvY2FsaXR5IGluIHRoZSBtZGV2IGRldmljZQo+ID4gc3RydWN0dXJl
IHZzIHRoZSBwYXJlbnQuICBUaGUgY2FjaGluZyBvZiB0aGUgb3BzIHN0cnVjdHVyZSBpdHNlbGYg
aXMgc2VwYXJhdGUgZnJvbQo+ID4gaG93IHdlIGdldCB0byBpdC4KPiA+IFdlIG1pZ2h0IGhhdmUg
aHVuZHJlZHMgb2YgcG9pbnRlcnMgdG8gdGhvc2Ugb3BzIHN0cnVjdHVyZSwgYnV0IHRoZSBzcGFj
ZQo+ID4gdHJhZGUtb2ZmIG1pZ2h0IHdlIHdvcnRoIGl0IGlmIHRoZXkncmUgb24gdGhlIHNhbWUg
Y2FjaGVsaW5lIGFzIHRoZSBtZGV2Cj4gPiBkZXZpY2UgaXRzZWxmIHZzIHRoZSBpbmRpcmVjdGlv
biB2aWEgdGhlIHBhcmVudC4KPiA+IAo+ID4gSSBzZWUgYSBjb3VwbGUgb3RoZXIgZHJhd2JhY2tz
IHRvIHRoZSBwYXJlbnQgaG9zdGVkIG9wcyBwb2ludGVycyBhcyB3ZWxsLiAgRmlyc3QsCj4gPiBp
dCBpbXBvc2VzIHRoYXQgcGVyIHBhcmVudCB0aGVyZSBjYW4gb25seSBiZSBvbmUgZGV2aWNlIG9w
cyBzdHJ1Y3R1cmUgcGVyIGNsYXNzCj4gPiBpZCwgYnV0IHdobydzIHRvIHNheSB0aGF0IGRpZmZl
cmVudCB0eXBlcyBvZiBtZGV2IGRldmljZXMgZm9yIGEgZ2l2ZW4gcGFyZW50IGFsbAo+ID4gbWFr
ZSB0aGUgc2FtZSBjYWxsYmFja3MgaW50byB0aGUgcGFyZW50LiAgIAo+IFdlIHNob3VsZCBoYXZl
IGRyaXZlciB3aG8gaW50ZW50IHRvIHVzZSBkaWZmZXJlbnQgZGV2aWNlIG9wcyBmb3IgZWFjaAo+
IGRldmljZSB3aXRoIHNpbmdsZSBwYXJlbnQgdGhhdCBzdXBwb3J0cyB0aGlzIGNsYWltLgoKV2h5
PyAgQXJlIHdlIG5vdCBhbGxvd2VkIHRvIGlkZW50aWZ5IHJlc3RyaWN0aW9ucyBpbXBsaWVkIGJ5
IGEgZ2l2ZW4KcHJvcG9zYWwgaWYgd2UgZG9uJ3QgeWV0IGhhdmUgYSB1c2VyPyAgSSBjYW4ndCBz
dWJzY3JpYmUgdG8gdGhhdC4KCj4gIEZvciBpbnN0YW5jZSwgZm9yIGEgdmZpby1tZGV2IHdlCj4g
PiBhbHJlYWR5IHN1cHBvcnQgdGhlIGNvbmNlcHQgb2YgYW4gaW9tbXUgYmFja2luZyBkZXZpY2Ug
d2hpY2ggbWFrZXMKPiA+IHRoZSB0eXBlMSBpb21tdSBjb2RlIGJlaGF2ZSBhIGxpdHRsZSBkaWZm
ZXJlbnRseS4gIFRob3NlCj4gPiBkaWZmZXJlbmNlcyBtaWdodCBiZSBzdWZmaWNpZW50IHRoYXQg
dGhlIHBhcmVudCBkcml2ZXIgd291bGQKPiA+IHJlZ2lzdGVyIGEgZGlmZmVyZW50IGRldmljZSBv
cHMgc3RydWN0dXJlIGZvciBhbiBpb21tdSBiYWNrZWQgbWRldgo+ID4gdnMgYSBub24taW9tbXUg
YmFja2VkIGRldmljZS4gICAgCj4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHJlYWxseSB3b3J0
aCBpdC4KPiBXaGljaCBkcml2ZXIgc2hvdWxkIEkgbG9vayB3aGljaCBoYXMgaWYtZWxzZSBjb25k
aXRpb25zIHNwcmlua2xlZCBpbgo+IHRoZXNlIGNhbGxiYWNrcyBmb3IgZGlmZmVyZW50IGlvbW11
IHR5cGVzPyBJZiBtYWpvcml0eSBjb2RlIGlzIHNhbWUsCj4gYWRkaW5nIGZldyBicmFuY2hlcyBs
b29rcyBvayB2cyBjcmVhdGluZyBuZXcgb3BzIGFsbCB0b2dldGhlci4gU28gSQo+IG5lZWQgdG8g
ZWR1Y2F0ZSBteXNlbGYgZmlyc3Qgd2l0aCB0aGUgZHJpdmVyIHdoaWNoIGRlc2lyZXMgdGhpcy4g
QW55Cj4gcG9pbnRlcnM/CgpXaGlsZSB0aGUgaW9tbXUgYmFja2VkIHZmaW8tbWRldnMgaXMgcmVh
bCwgdGhlIGV4YW1wbGUgdGhhdCBhIHBhcmVudApkcml2ZXIgbWlnaHQgY2hvb3NlIHRvIHJlZ2lz
dGVyIGRpZmZlcmVudCBkZXZpY2Ugb3BzIGJhc2VkIG9uIHRoYXQgaXMKdGhlb3JldGljYWwuICBQ
YXJlbnQgZHJpdmVycyBkb24ndCBoYXZlIHRoYXQgb3B0aW9uIHRvZGF5LCBidXQgYXMgd2UncmUK
bWFraW5nIHRoZSBkZXZpY2Ugb3BzIG1vcmUgbW9kdWxhciBhbmQgaGF2ZSBzdHVtYmxlZCBvbnRv
IHRoaXMgYmVuZWZpdApvZiBwZXIgZGV2aWNlIG9wcywgcGVyaGFwcyBpdCBtaWdodCBiZSB1c2Vm
dWwuICBUaGUgImlzIGl0IHdvcnRoIGl0IgpxdWVzdGlvbiBjYW4gYWxzbyBiZSBhc2tlZCBvZiB0
aGUgY2xhaW1lZCBiZW5lZml0cyBvZiBhIHNldCBvZiBzaGFyZWQKZGV2aWNlcyBvcHMgcGVyIHBh
cmVudC4KIAo+ID4gVGhlIG90aGVyCj4gPiBkcmF3YmFjayBpcyB0aGF0IGl0IGltcGxpZXMgYSBi
aW5hcnkgZGlmZmVyZW5jZSBpbiBhbGwgbWRldiBwYXJlbnQKPiA+IGRyaXZlcnMgdG8gYWRkIGFu
eSBuZXcgZGV2aWNlIGlkcy4gIEkga25vdyB3ZSBkb24ndCBndWFyYW50ZWUKPiA+IGJpbmFyeSBj
b21wYXRpYmlsaXR5LCBidXQgaXQncyByYXRoZXIgdWdseS4KPiA+ICAgCj4gWWVhaCwgd2UgZG9u
J3Qgc3VwcG9ydCBhbmQgdGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQgZm9yIGJpbmFyeQo+IGNvbXBh
dGliaWxpdHkuCj4gCj4gPiBPdmVyYWxsLCBJIGd1ZXNzIEkgdGVuZCB0byBwcmVmZXIgQ29ubmll
J3MgcHJvcG9zYWwsIHRoZSBjbGFzcyBpZAo+ID4gYW5kIHN0cnVjdHVyZSBhcmUgdGllZCB0b2dl
dGhlciBhbmQgdGhlIHBhcmVudCBkcml2ZXIgaXMgb25seQo+ID4gcmVzcG9uc2libGUgZm9yIG9u
ZSBvZiB0aGVtLCB0aGUgY2xhc3MgaWQgaXMgaGlkZGVuIGF3YXkgaW4KPiA+IG1kZXYtY29yZSBh
bmQgdGhlIG1kZXYgZHJpdmVyIGl0c2VsZi4gCj4gSSBhbSBmaW5lIHdpdGggQ29ybmVsaWEncyBh
cHByb2FjaC4KPiBJdCBjb21lcyB3aXRoIHNtYWxsIGNvc3Qgb2YgYWRkaXRpb25hbCBzeW1ib2xz
IGFuZCBpdCBpcyBwcm9iYWJseSBvay4KPiBJIGp1c3QgZmluZCBpdCBvdmVyIGVuZ2luZWVyZWQg
Z2l2ZW4gaGFuZGZ1bCBvZiBkZXYgb3BzIHR5cGVzLgoKSWYgdGhlIGRldmljZSBvcHMgdHlwZXMg
YXJlIGxpbWl0ZWQsIHRoZW4gc28gYXJlIHRoZSBhZGRpdGlvbmFsCnN5bWJvbHMuICBUaG9zZSBz
eW1ib2xzIGFsc28gYWRkIGEgZGVncmVlIG9mIGV4cGxpY2l0bmVzcyB0byB0aGUKaW50ZXJmYWNl
IChpZS4gcmVnaXN0ZXIgdGhpcyBkZXZpY2UgYXMgdmZpby1tZGV2IHdpdGggdGhpcyBzZXQgb2YK
dmZpby1tZGV2LW9wcywgdmVyc3VzIHJlZ2lzdGVyIHRoaXMgZGV2aWNlIGFzIHZmaW8tbWRldi4u
LiB3aGljaCB1c2VzCnRoZSB2ZmlvLW1kZXYtb3BzIG92ZXIgaW4gdGhlIHBhcmVudCBvcHMgc3Ry
dWN0dXJlKS4gIEkgZG9uJ3QgcmVhbGx5CnNlZSB3aGF0J3Mgb3Zlci1lbmdpbmVlcmVkIGFib3V0
IGZvcm1lci4gIEkgbGlrZSB0byB0aGluayBvZiBSdXN0eSdzCm9sZCBpbnRlcmZhY2UgZ3VpZGVs
aW5lcywgcGFydGljdWxhcmx5IHRoZSBvbmUgYWJvdXQgbWFraW5nIGl0CmRpZmZpY3VsdCB0byB1
c2UgaW5jb3JyZWN0bHkgZm9yIHRoZXNlIHNvcnRzIG9mIGludGVyZmFjZXMuICBUaGFua3MsCgpB
bGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
