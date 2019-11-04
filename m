Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB6ED7DA
	for <lists.virtualization@lfdr.de>; Mon,  4 Nov 2019 03:52:42 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 32F3FAF0;
	Mon,  4 Nov 2019 02:52:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 005E3A95
	for <virtualization@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 02:52:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 9C7A45D0
	for <virtualization@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 02:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572835951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=AXjYrGIsHqKdgGAtBr7HEpIjQtsm9UUKtuxj6Twt+UY=;
	b=RVZRRJU4LWQme1tbNNbzKqlsFPVDGtYGVVV71VhCWd52Px6osGA8AOTDo6RNqO24G6Z7gr
	EnOgLd2zADDjviY7mwnYsjjb56vxkWrPgjK0zbxgBIqkeF3FAcvNPxnVzJJF/cY55o2hje
	lbwtc4d3CgwzCJnSvkYhEF617S2vgts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-215--hfYGEOLOBaATEUH2p7Y3g-1; Sun, 03 Nov 2019 21:52:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58B2B800A1A;
	Mon,  4 Nov 2019 02:52:23 +0000 (UTC)
Received: from [10.72.12.188] (ovpn-12-188.pek2.redhat.com [10.72.12.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFF69600C4;
	Mon,  4 Nov 2019 02:51:55 +0000 (UTC)
Subject: Re: [PATCH V6 3/6] mdev: introduce device specific ops
To: Parav Pandit <parav@mellanox.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, 
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "tiwei.bie@intel.com"
	<tiwei.bie@intel.com>
References: <20191030064444.21166-1-jasowang@redhat.com>
	<20191030064444.21166-4-jasowang@redhat.com>
	<AM0PR05MB4866E91139617C9F2380BBAFD1620@AM0PR05MB4866.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <495efacd-4898-fb89-2599-dce3a5a277f0@redhat.com>
Date: Mon, 4 Nov 2019 10:51:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR05MB4866E91139617C9F2380BBAFD1620@AM0PR05MB4866.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: -hfYGEOLOBaATEUH2p7Y3g-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>,
	"zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	Ido Shamay <idos@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
	"xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"zhihong.wang@intel.com" <zhihong.wang@intel.com>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTEvMiDkuIrljYg0OjExLCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4KPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4KPj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDMwLCAyMDE5IDE6NDUgQU0KPj4gVG86
IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnOyBsaW51eC0K
Pj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgaW50ZWwtCj4+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOwo+PiBrd2Fua2hlZGVAbnZpZGlhLmNvbTsgYWxleC53aWxsaWFt
c29uQHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29tOwo+PiB0aXdlaS5iaWVAaW50ZWwuY29tCj4+
IENjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsgbmV0ZGV2QHZn
ZXIua2VybmVsLm9yZzsKPj4gY29odWNrQHJlZGhhdC5jb207IG1heGltZS5jb3F1ZWxpbkByZWRo
YXQuY29tOwo+PiBjdW5taW5nLmxpYW5nQGludGVsLmNvbTsgemhpaG9uZy53YW5nQGludGVsLmNv
bTsKPj4gcm9iLm1pbGxlckBicm9hZGNvbS5jb207IHhpYW8udy53YW5nQGludGVsLmNvbTsKPj4g
aGFvdGlhbi53YW5nQHNpZml2ZS5jb207IHpoZW55dXdAbGludXguaW50ZWwuY29tOyB6aGkuYS53
YW5nQGludGVsLmNvbTsKPj4gamFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tOyBqb29uYXMubGFo
dGluZW5AbGludXguaW50ZWwuY29tOwo+PiByb2RyaWdvLnZpdmlAaW50ZWwuY29tOyBhaXJsaWVk
QGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7Cj4+IGZhcm1hbkBsaW51eC5pYm0uY29tOyBwYXNp
Y0BsaW51eC5pYm0uY29tOyBzZWJvdHRAbGludXguaWJtLmNvbTsKPj4gb2JlcnBhckBsaW51eC5p
Ym0uY29tOyBoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tOyBnb3JAbGludXguaWJtLmNvbTsKPj4g
Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbTsgYWtyb3dpYWtAbGludXguaWJtLmNvbTsgZnJldWRlQGxp
bnV4LmlibS5jb207Cj4+IGxpbmdzaGFuLnpodUBpbnRlbC5jb207IElkbyBTaGFtYXkgPGlkb3NA
bWVsbGFub3guY29tPjsKPj4gZXBlcmV6bWFAcmVkaGF0LmNvbTsgbHVsdUByZWRoYXQuY29tOyBQ
YXJhdiBQYW5kaXQKPj4gPHBhcmF2QG1lbGxhbm94LmNvbT47IGNocmlzdG9waGUuZGUuZGluZWNo
aW5AZ21haWwuY29tOwo+PiBrZXZpbi50aWFuQGludGVsLmNvbTsgc3RlZmFuaGFAcmVkaGF0LmNv
bTsgSmFzb24gV2FuZwo+PiA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gU3ViamVjdDogW1BBVENI
IFY2IDMvNl0gbWRldjogaW50cm9kdWNlIGRldmljZSBzcGVjaWZpYyBvcHMKPj4KPj4gQ3VycmVu
dGx5LCBleGNlcHQgZm9yIHRoZSBjcmVhdGUgYW5kIHJlbW92ZSwgdGhlIHJlc3Qgb2YgbWRldl9w
YXJlbnRfb3BzIGlzCj4+IGRlc2lnbmVkIGZvciB2ZmlvLW1kZXYgZHJpdmVyIG9ubHkgYW5kIG1h
eSBub3QgaGVscCBmb3Iga2VybmVsIG1kZXYgZHJpdmVyLgo+PiBXaXRoIHRoZSBoZWxwIG9mIGNs
YXNzIGlkLCB0aGlzIHBhdGNoIGludHJvZHVjZXMgZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcyBp
bnNpZGUKPj4gbWRldl9kZXZpY2Ugc3RydWN0dXJlLiBUaGlzIGFsbG93cyBkaWZmZXJlbnQgc2V0
IG9mIGNhbGxiYWNrIHRvIGJlIHVzZWQgYnkgdmZpby0KPj4gbWRldiBhbmQgdmlydGlvLW1kZXYu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+
IC0tLQo+IFsgLi5dCj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdmZpb19tZGV2X29w
cy5oIGIvaW5jbHVkZS9saW51eC92ZmlvX21kZXZfb3BzLmgKPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQgaW5kZXggMDAwMDAwMDAwMDAwLi4zOTA3YzUzNzFjMmIKPj4gLS0tIC9kZXYvbnVsbAo+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L3ZmaW9fbWRldl9vcHMuaAo+PiBAQCAtMCwwICsxLDUyIEBACj4+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4+ICsvKgo+PiAr
ICogVkZJTyBNZWRpYXRlZCBkZXZpY2UgZGVmaW5pdGlvbgo+PiArICovCj4+ICsKPj4gKyNpZm5k
ZWYgVkZJT19NREVWX0gKPj4gKyNkZWZpbmUgVkZJT19NREVWX0gKPj4gKwo+IEkgc2hvdWxkIGhh
dmUgbm90aWNlZCB0aGlzIGJlZm9yZS4gOi0oCj4gQVBJcyBleHBvc2VkIGFyZSBieSB0aGUgbWRl
diBtb2R1bGUgYW5kIG5hbWVkIHdpdGggbWRldl8gcHJlZml4Lgo+IEFuZCBmaWxlIG5hbWUgaXMg
X29wcy5oLAo+Cj4gV2Ugc2hvdWxkIG5hbWUgdGhpcyBmaWxlIGFzIG1kZXZfdmZpb19vcHMuaAo+
Cj4gQW5kICNkZWZpbmUgc2hvdWxkIGJlIE1ERVZfVkZJT19PUFNfSAo+Cj4+ICsjaW5jbHVkZSA8
bGludXgvbWRldi5oPgo+PiArCj4+ICsvKioKPj4gKyAqIHN0cnVjdCB2ZmlvX21kZXZfZGV2aWNl
X29wcyAtIFN0cnVjdHVyZSB0byBiZSByZWdpc3RlcmVkIGZvciBlYWNoCj4gcy92ZmlvX21kZXZf
ZGV2aWNlX29wcy9tZGV2X3ZmaW9fZGV2aWNlX29wcy8KPgo+IFNpbWlsYXJseSBmb3IgdmlydGlv
IGluIGZ1dHVyZSBwYXRjaGVzLgo+CgpXaWxsIGZpeCBpbiBWNy4KCgo+ICAgc3RhdGljIHZvaWQg
bXR0eV9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gLS0KPiAyLjE5LjEKPiBX
aXRoIGFib3ZlIHNtYWxsIG5pdCBjaGFuZ2VzIHRvIHJlbmFtZSB0aGUgZmllbGRzIGFuZCBmaWxl
LAo+Cj4gUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbWVsbGFub3guY29tPgoKCkFw
cHJlY2lhdGUgdGhhdCwgdGhhbmtzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
