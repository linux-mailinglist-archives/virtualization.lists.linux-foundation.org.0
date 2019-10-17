Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C7889DA7AC
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 10:45:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7837BA0;
	Thu, 17 Oct 2019 08:45:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B022DAD0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 08:45:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 53E7C70D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 08:45:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55AF0C0546D5;
	Thu, 17 Oct 2019 08:45:33 +0000 (UTC)
Received: from gondolin (dhcp-192-202.str.redhat.com [10.33.192.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44301600C8;
	Thu, 17 Oct 2019 08:45:18 +0000 (UTC)
Date: Thu, 17 Oct 2019 10:45:16 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 4/7] mdev: introduce device specific ops
Message-ID: <20191017104516.52374ab6.cohuck@redhat.com>
In-Reply-To: <4886a6cd-a165-05b7-9f62-175076bbb2ba@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-5-jasowang@redhat.com>
	<20191015124137.4f948bd2.cohuck@redhat.com>
	<eb7ecd99-7465-6be4-7ecd-84c11f66e0ac@redhat.com>
	<20191015112646.3776dc29@x1.home>
	<AM0PR05MB4866954855AF080639ED2384D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
	<20191016105232.663dd3c9.cohuck@redhat.com>
	<AM0PR05MB486625E53B8ADBA2BBAA80F6D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
	<20191016105303.6e01936f@x1.home>
	<4886a6cd-a165-05b7-9f62-175076bbb2ba@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 17 Oct 2019 08:45:33 +0000 (UTC)
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
	"zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"zhihong.wang@intel.com" <zhihong.wang@intel.com>,
	"rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
	"intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
	Ido Shamay <idos@mellanox.com>
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

T24gVGh1LCAxNyBPY3QgMjAxOSAxNjozMDo0MyArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMjAxOS8xMC8xNyDkuIrljYgxMjo1MywgQWxleCBXaWxs
aWFtc29uIHdyb3RlOgoKPiA+Pj4gWWV0IGFub3RoZXIgc3VnZ2VzdGlvbjogaGF2ZSB0aGUgY2xh
c3MgaWQgZGVyaXZlIGZyb20gdGhlIGZ1bmN0aW9uCj4gPj4+IHlvdSB1c2UgdG8gc2V0IHVwIHRo
ZSBvcHMuCj4gPj4+Cj4gPj4+IHZvaWQgbWRldl9zZXRfdmZpb19vcHMoc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2LCBjb25zdCBzdHJ1Y3QKPiA+Pj4gdmZpb19tZGV2X29wcyAqdmZpb19vcHMpIHsK
PiA+Pj4gCW1kZXYtPmRldmljZV9vcHMgPSB2ZmlvX29wczsKPiA+Pj4gCW1kZXYtPmNsYXNzX2lk
ID0gTURFVl9JRF9WRklPOwo+ID4+PiB9Cj4gPj4+Cj4gPj4+IHZvaWQgbWRldl9zZXRfdmlydGlv
X29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIGNvbnN0IHN0cnVjdAo+ID4+PiB2aXJ0aW9f
bWRldl9vcHMgKnZpcnRpb19vcHMpIHsKPiA+Pj4gCW1kZXYtPmRldmljZV9vcHMgPSB2aXJ0aW9f
b3BzOwo+ID4+PiAJbWRldi0+Y2xhc3NfaWQgPSBNREVWX0lEX1ZJUlRJTzsKPiA+Pj4gfQo+ID4+
Pgo+ID4+PiB2b2lkIG1kZXZfc2V0X3Zob3N0X29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYs
IGNvbnN0IHN0cnVjdAo+ID4+PiB2aXJ0aW9fbWRldl9vcHMgKnZpcnRpb19vcHMpIHsKPiA+Pj4g
CW1kZXYtPmRldmljZV9vcHMgPSB2aXJ0aW9fb3BzOwo+ID4+PiAJbWRldi0+Y2xhc3NfaWQgPSBN
REVWX0lEX1ZIT1NUOwo+ID4+PiB9Cj4gPj4+Cj4gPj4+IHZvaWQgbWRldl9zZXRfdmVuZG9yX29w
cyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpIC8qIG5vIG9wcyAqLyB7Cj4gPj4+IAltZGV2LT5j
bGFzc19pZCA9IE1ERVZfSURfVkVORE9SOwo+ID4+PiB9ICAKPiA+IE9uZSBmdXJ0aGVyIHN0ZXAg
dG93YXJkcyBtYWtpbmcgdGhpcyBoYXJkIHRvIHVzZSBpbmNvcnJlY3RseSBtaWdodCBiZQo+ID4g
dG8gcmV0dXJuIGFuIGVycm9yIGlmIGNsYXNzX2lkIGlzIGFscmVhZHkgc2V0LiAgVGhhbmtzLAo+
ID4KPiA+IEFsZXggIAo+IAo+IAo+IEkgd2lsbCBhZGQgYSBCVUdfT04oKSB3aGVuIGNsYXNzX2lk
IGhhcyBhbHJlYWR5IHNldC4KClByb2JhYmx5IGJldHRlciBhIFdBUk5fT04oKT8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
