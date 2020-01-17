Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414D14061B
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 10:35:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 119788634C;
	Fri, 17 Jan 2020 09:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OBcp4M53gJz; Fri, 17 Jan 2020 09:35:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09E59864D0;
	Fri, 17 Jan 2020 09:35:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA407C1D8D;
	Fri, 17 Jan 2020 09:35:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 148ECC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F46186DFF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmZlBjaNIpXE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5B34486DDC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579253726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQlUMs2/NB7cEZJ9F2n+VZER0LwIUDsqhwlPBsX2bmw=;
 b=B9Cfde4gzTBsdtkibDNpilv8NK5/5s7ihOY+EWegKbAHdS53Ilacv+zKiCQt91+EKIBMh6
 hWrDK+WbVOXjHX3s6QPbhgKO0+jiGrM1WAdeBcn+1IMkYW6g8dmodLbPJyNCDuffCTyE1+
 6gTJTasP8vCYu6BR1IICpAHnWksUkMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-OA_vQTWxNEqASHBKkg99Eg-1; Fri, 17 Jan 2020 04:35:25 -0500
X-MC-Unique: OA_vQTWxNEqASHBKkg99Eg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52861800D48;
 Fri, 17 Jan 2020 09:35:18 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEBED10016EB;
 Fri, 17 Jan 2020 09:35:01 +0000 (UTC)
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Randy Dunlap <rdunlap@infradead.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
 <55d84df0-803a-a81f-b49f-2d6fe8f78b96@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8d6ef81e-b42a-9a89-0857-f2732526a1af@redhat.com>
Date: Fri, 17 Jan 2020 17:35:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <55d84df0-803a-a81f-b49f-2d6fe8f78b96@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, jakub.kicinski@netronome.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, jiri@mellanox.com,
 mhabets@solarflare.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvMS8xNyDkuIvljYgxMjoxMiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDEvMTYv
MjAgNDo0MiBBTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL3ZkcGEvS2NvbmZpZyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBpbmRleCAz
MDMyNzI3YjRkOTguLjEyZWMyNWQ0ODQyMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aXJ0aW8v
dmRwYS9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBAQCAt
NywzICs3LDIwIEBAIGNvbmZpZyBWRFBBCj4+ICAgICAgICAgICAgIGRhdGFwYXRoIHdoaWNoIGNv
bXBsaWVzIHdpdGggdmlydGlvIHNwZWNpZmljYXRpb25zIHdpdGgKPj4gICAgICAgICAgICAgdmVu
ZG9yIHNwZWNpZmljIGNvbnRyb2wgcGF0aC4KPj4gICAKPj4gK21lbnVjb25maWcgVkRQQV9NRU5V
Cj4+ICsJYm9vbCAiVkRQQSBkcml2ZXJzIgo+PiArCWRlZmF1bHQgbgo+PiArCj4+ICtpZiBWRFBB
X01FTlUKPj4gKwo+PiArY29uZmlnIFZEUEFfU0lNCj4+ICsJdHJpc3RhdGUgInZEUEEgZGV2aWNl
IHNpbXVsYXRvciIKPj4gKyAgICAgICAgc2VsZWN0IFZEUEEKPj4gKyAgICAgICAgZGVmYXVsdCBu
Cj4+ICsgICAgICAgIGhlbHAKPj4gKyAgICAgICAgICB2RFBBIG5ldHdvcmtpbmcgZGV2aWNlIHNp
bXVsYXRvciB3aGljaCBsb29wIFRYIHRyYWZmaWMgYmFjawo+IAkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxvb3BzCj4KPj4gKyAgICAgICAgICB0byBSWC4gVGhp
cyBkZXZpY2UgaXMgdXNlZCBmb3IgdGVzdGluZywgcHJvdG90eXBpbmcgYW5kCj4+ICsgICAgICAg
ICAgZGV2ZWxvcG1lbnQgb2YgdkRQQS4KPj4gKwo+PiArZW5kaWYgIyBWRFBBX01FTlUKPiBNb3N0
IGxpbmVzIGFib3ZlIHVzZSBzcGFjZXMgZm9yIGluZGVudGF0aW9uLCB3aGlsZSB0aGV5IHNob3Vs
ZCB1c2UKPiB0YWIgKyAyIHNwYWNlcy4KCgpSaWdodCwgd2lsbCBmaXguCgpUaGFua3MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
