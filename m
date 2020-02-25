Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E559916B825
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 04:39:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4AB24204FE;
	Tue, 25 Feb 2020 03:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3XAlHMw7ckU; Tue, 25 Feb 2020 03:38:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 93D4F20525;
	Tue, 25 Feb 2020 03:38:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67F21C07FF;
	Tue, 25 Feb 2020 03:38:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3777C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 03:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F49686A94
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 03:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OR5FeSOFbQW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 03:38:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2804086A57
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 03:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582601934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxhGFYz6fAwKel+McHgyPZZNImtqGnzaPwux7zsd3N0=;
 b=XxoYKCEoC+5UvrsdzSDj5dlaY9CQe+Urx96zy50d72pYFfgMgZhf7T0+/pIhoOA71ngSZn
 GUBvL//IU3TVWtpNOgo7Hm8DpVNEj3s8K8eQZzhHnL74yXIHRCtgx0K+YuaeCkISiwPDk/
 o8Cc18A15t6dKyu0H1zJtVZY6nz8xxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-r7S_sd4lOT-zPkHlkyjcCg-1; Mon, 24 Feb 2020 22:38:50 -0500
X-MC-Unique: r7S_sd4lOT-zPkHlkyjcCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F27813E4;
 Tue, 25 Feb 2020 03:38:48 +0000 (UTC)
Received: from [10.72.13.170] (ovpn-13-170.pek2.redhat.com [10.72.13.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64A1B60BF7;
 Tue, 25 Feb 2020 03:38:36 +0000 (UTC)
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <426e6972-0565-c931-e171-da0f58fbf856@redhat.com>
 <20200221155602.4de41fa7.pasic@linux.ibm.com>
 <0181712c-e533-fcfd-2638-8a0649d713dd@redhat.com>
 <20200224010607-mutt-send-email-mst@kernel.org>
 <b3c52c67-c740-a50e-2595-fe04d179c881@redhat.com>
 <20200224024641-mutt-send-email-mst@kernel.org>
 <08d6bdfb-9b49-c278-3c0b-2e02376cf0cf@redhat.com>
 <20200224083845-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ac15de73-8c61-5e82-4ed2-760b7f3055bb@redhat.com>
Date: Tue, 25 Feb 2020 11:38:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200224083845-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMi8yNCDkuIvljYg5OjQwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+IFN1
YmplY3Q6IFtQQVRDSF0gdmhvc3Q6IGRvIG5vdCBzZXQgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0g
d2hlbiBJT01NVSBpcyBub3QKPj4gICB1c2VkCj4+Cj4+IFdlIGVuYWJsZSBkZXZpY2UgSU9UTEIg
dW5jb25kaXRpb25hbGx5IHdoZW4gVklSVElPX0ZfSU9NTVVfUExBVEZPUk0gaXMKPj4gbmVnb3Rp
YXRlZC4gVGhpcyBsZWFkIHVubmVjZXNzYXJ5IElPVExCIG1pc3MvdXBkYXRlIHRyYW5zYWN0aW9u
cyB3aGVuCj4+IElPTU1VIGlzIHVzZWQuIFRoaXMgcGF0Y2ggZml4ZXMgdGhpcy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBo
dy9uZXQvdmlydGlvLW5ldC5jIHwgMyArKysKPj4gICBody92aXJ0aW8vdmhvc3QuYyAgIHwgNCAr
LS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9ody9uZXQvdmlydGlvLW5ldC5jIGIvaHcvbmV0L3ZpcnRpby1u
ZXQuYwo+PiBpbmRleCAzNjI3YmIxNzE3Li4wZDUwZThiZDM0IDEwMDY0NAo+PiAtLS0gYS9ody9u
ZXQvdmlydGlvLW5ldC5jCj4+ICsrKyBiL2h3L25ldC92aXJ0aW8tbmV0LmMKPj4gQEAgLTg3OSw2
ICs4NzksOSBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fbmV0X3NldF9mZWF0dXJlcyhWaXJ0SU9EZXZp
Y2UgKnZkZXYsIHVpbnQ2NF90IGZlYXR1cmVzKQo+PiAgICAgICAgICAgdmlydGlvX25ldF9hcHBs
eV9ndWVzdF9vZmZsb2FkcyhuKTsKPj4gICAgICAgfQo+PiAgIAo+PiArICAgIGlmICh2ZGV2LT5k
bWFfYXMgPT0gJmFkZHJlc3Nfc3BhY2VfbWVtb3J5KQo+PiArICAgICAgICBmZWF0dXJlcyAmPSB+
KDFVTEwgPDwgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0pOwo+PiArCj4+ICAgICAgIGZvciAoaSA9
IDA7ICBpIDwgbi0+bWF4X3F1ZXVlczsgaSsrKSB7Cj4+ICAgICAgICAgICBOZXRDbGllbnRTdGF0
ZSAqbmMgPSBxZW11X2dldF9zdWJxdWV1ZShuLT5uaWMsIGkpOwo+IFRoaXMgcG9rZXMgYXQgYWNr
ZWQgZmVhdHVyZXMuIEkgdGhpbmsgdGhleSBhcmUgYWxzbwo+IGd1ZXN0IHZpc2libGUgLi4uCgoK
SXQncyB0aGUgYWNrZWQgZmVhdHVyZXMgb2Ygdmhvc3QgZGV2aWNlLCBzbyBJIGd1ZXNzIG5vdD8K
CkUuZyB2aXJ0aW9fc2V0X2ZlYXR1cmVzX25vY2hlY2soKSBkaWQ6CgogwqDCoMKgIHZhbCAmPSB2
ZGV2LT5ob3N0X2ZlYXR1cmVzOwogwqDCoMKgIGlmIChrLT5zZXRfZmVhdHVyZXMpIHsKIMKgwqDC
oMKgwqDCoMKgIGstPnNldF9mZWF0dXJlcyh2ZGV2LCB2YWwpOwogwqDCoMKgIH0KIMKgwqDCoCB2
ZGV2LT5ndWVzdF9mZWF0dXJlcyA9IHZhbDsKClRoYW5rcwoKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
