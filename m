Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 709E5C009F
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 10:04:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6FD9FC6D;
	Fri, 27 Sep 2019 08:04:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4857AB2F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:04:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E1D1F8B8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:04:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD2F24FCD6;
	Fri, 27 Sep 2019 08:04:48 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 152AE60BE2;
	Fri, 27 Sep 2019 08:04:27 +0000 (UTC)
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
To: Rob Miller <rob.miller@broadcom.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-6-jasowang@redhat.com>
	<20190924170638.064d85f7@x1.home>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
	<CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c532d7ce-90be-6456-a630-96f56cb6409d@redhat.com>
Date: Fri, 27 Sep 2019 16:04:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 27 Sep 2019 08:04:49 +0000 (UTC)
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
	"parav@mellanox.com" <parav@mellanox.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"lulu@redhat.com" <lulu@redhat.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Wang, Zhi A" <zhi.a.wang@intel.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Vivi,
	Rodrigo" <rodrigo.vivi@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, "Zhu,
	Lingshan" <lingshan.zhu@intel.com>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "Wang,
	Zhihong" <zhihong.wang@intel.com>
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

Ck9uIDIwMTkvOS8yNSDkuIvljYgxMDoxMSwgUm9iIE1pbGxlciB3cm90ZToKPgo+ID4gPsKgIMKg
IMKgbWRldl9zZXRfY2xhc3NfaWQobWRldiwgTURFVl9JRF9WRklPKTsKPiA+ID4gK8KgIMKgbWRl
dl9zZXRfZGV2X29wcyhtZGV2LCAmaW50ZWxfdmZpb192Z3B1X2Rldl9vcHMpOwo+ID4KPiA+IFRo
aXMgc2VlbXMgcmF0aGVyIHVucmVmaW5lZC7CoCBXZSdyZSByZWdpc3RlcmluZyBpbnRlcmRlcGVu
ZGVudCBkYXRhIGluCj4gPiBzZXBhcmF0ZSBjYWxscy7CoCBBbGwgZHJpdmVycyBuZWVkIHRvIG1h
a2UgYm90aCBvZiB0aGVzZSBjYWxscy7CoCBJJ20gbm90Cj4gPiBzdXJlIGlmIHRoaXMgaXMgYSBn
b29kIGlkZWEsIGJ1dCB3aGF0IGlmIHdlIGhhZDoKPiA+Cj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0
IHZmaW9fbWRldl9kZXZpY2Vfb3BzIGludGVsX3ZmaW9fdmdwdV9kZXZfb3BzID0gewo+ID7CoCDC
oCDCoCDCoC5pZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPSBNREVWX0lEX1ZGSU8s
Cj4gPsKgIMKgIMKgIMKgLm9wZW7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoD0gaW50ZWxf
dmdwdV9vcGVuLAo+ID7CoCDCoCDCoCDCoC5yZWxlYXNlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
PSBpbnRlbF92Z3B1X3JlbGVhc2UsCj4gPsKgIMKgIMKgIMKgIMKgLi4uCj4gPgo+ID4gQW5kIHRo
ZSBzZXQgZnVuY3Rpb24gcGFzc2VkICZpbnRlbF92ZmlvX3ZncHVfZGV2X29wcy5pZCAKPiA8aHR0
cDovL2ludGVsX3ZmaW9fdmdwdV9kZXZfb3BzLmlkPiBhbmQgdGhlIG1kZXYKPiA+IGJ1cyBkcml2
ZXJzIHVzZWQgY29udGFpbmVyX29mIHRvIGdldCB0byB0aGVpciBjYWxsYmFja3M/Cj4KPiBvciBq
dXN0IG1ha2UgaXQgZXhwbGljaXQ/IGUuZy4KPgo+IG1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZf
SURfVkZJTywgJmludGVsX3ZmaW9fdmdwdV9kZXZfb3BzKTsKCgpZZXMsIHRoaXMgc2VlbXMgZXZl
biBiZXR0ZXIuCgpXaWxsIGRvIHRoaXMgaW4gVjMuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
