Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2862BED21
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 10:13:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1CBB2BB3;
	Thu, 26 Sep 2019 08:12:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8E372B49
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 08:12:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2F8577C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 08:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDECB10DCC92;
	Thu, 26 Sep 2019 08:12:51 +0000 (UTC)
Received: from [10.72.12.101] (ovpn-12-101.pek2.redhat.com [10.72.12.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5601D60C80;
	Thu, 26 Sep 2019 08:12:23 +0000 (UTC)
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
To: "Tian, Kevin" <kevin.tian@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, 
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "Bie, Tiwei" <tiwei.bie@intel.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-7-jasowang@redhat.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
	<2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D590FE4@SHSMSX104.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6ba16bf8-8e8a-343a-335d-ab77d7cda195@redhat.com>
Date: Thu, 26 Sep 2019 16:12:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D590FE4@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Thu, 26 Sep 2019 08:12:52 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
	"sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"rob.miller@broadcom.com" <rob.miller@broadcom.com>,
	"lulu@redhat.com" <lulu@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Wang,
	Zhi A" <zhi.a.wang@intel.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Wang,
	Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"parav@mellanox.com" <parav@mellanox.com>, "Vivi,
	Rodrigo" <rodrigo.vivi@intel.com>, "Zhu,
	Lingshan" <lingshan.zhu@intel.com>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
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

Ck9uIDIwMTkvOS8yNiDkuIrljYg4OjQ4LCBUaWFuLCBLZXZpbiB3cm90ZToKPj4+PiArfTsKPj4+
IEknbSBub3Qgc3VyZSBob3cgc3RhYmxlIGFib3ZlIG9wcyBhcmUuCj4+IEl0J3MgdGhlIGtlcm5l
bCBpbnRlcm5hbCBBUEksIHNvIHRoZXJlJ3Mgbm8gc3RyaWN0IHJlcXVpcmVtZW50IGZvciB0aGlz
Lgo+PiBXZSB3aWxsIGV4cG9ydCBhIHZlcnNpb24gdmFsdWUgZm9yIHVzZXJzcGFjZSBmb3IgY29t
cGF0aWJpbGl0eS4KPj4KPj4KPj4+IERvZXMgaXQgbWFrZSBzZW5zZSBpZiBkZWZpbmluZwo+Pj4g
anVzdCB0d28gY2FsbGJhY2tzIGhlcmUsIGUuZy4gdnFfY3RybCBhbmQgZGV2aWNlX2N0cmwsIGFu
ZCB0aGVuIGxldCB0aGUKPj4+IHZlbmRvciBkcml2ZXIgdG8gaGFuZGxlIHNwZWNpZmljIG9wcyBp
biBlYWNoIGNhdGVnb3J5IChzaW1pbGFyIHRvIGhvdwo+Pj4gaW9jdGwgd29ya3MpPwo+PiBNeSB1
bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQgaW50cm9kdWNlIGFub3RoZXIgaW5kaXJlY3Rpb24sIHlv
dSBzdGlsbAo+PiBuZWVkIHRvIGRpZmZlciBmcm9tIGRpZmZlcmVudCBjb21tYW5kLCBhbmQgaXQn
cyBsZXNzIGZsZXhpYmxlIHRoYW4KPj4gZGlyZWN0IGNhbGxiYWNrLgo+Pgo+PiBXaGF0J3MgdGhl
IHZhbHVlIG9mIGRvaW5nIHRoaXM/Cj4+Cj4gSSBqdXN0IHRob3VnaHQgZG9pbmcgc28gbWF5IHBy
b3ZpZGUgYmV0dGVyIGNvbXBhdGliaWxpdHkgdG8gdGhlCj4gcGFyZW50IGRyaXZlci4gRXZlbiB3
aGVuIG5ldyBvcCBpcyBpbnRyb2R1Y2VkLCBhIHBhcmVudCBkcml2ZXIKPiB0aGF0IHdhcyBkZXZl
bG9wZWQgYWdhaW5zdCB0aGUgb2xkIHNldCBjYW4gc3RpbGwgYmUgbG9hZGVkIGluIHRoZQo+IG5l
dyBrZXJuZWwuIEl0IGp1c3QgcmV0dXJucyBlcnJvciB3aGVuIHVucmVjb2duaXplZCBvcHMgYXJl
Cj4gcm91dGVkIHRocm91Z2ggdnFfY3RybCBhbmQgZGV2aWNlX2N0cmwsIGlmIHRoZSB1c2Vyc3Bh
Y2UgZG9lc24ndAo+IGZhdm9yIHRoZSBleHBvc2VkIHZlcnNpb24gdmFsdWUuIEJ1dCBpZiBhYm92
ZSBvcHMgc2V0IGlzIHByZXR0eQo+IHN0YWJsZSwgdGhlbiB0aGlzIGNvbW1lbnQgY2FuIGJlIGln
bm9yZWQuCgoKVGhpcyBpcyByZWFsbHkgZ29vZCBwb2ludCwgd2Ugc2hvdWxkIGtlZXAgaXQgc3Rh
YmxlIGFzIGEgcmVhbCB0cmFuc3BvcnQuIApBbmQgd2hlbiB0aGVyZSdzIG1ham9yIGNoYW5nZXMs
IHdlIHNob3VsZCBhZHZlcnRpc2UgdGhyb3VnaCB2ZXJzaW9uIHRoZW4gCndlIGNhbiBwcm92aWRl
IGEgbmV3IHNldCBvZiBmdW5jdGlvbnMuCgpUaGFua3MKCgo+Cj4gVGhhbmtzCj4gS2V2aW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
