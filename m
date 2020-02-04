Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 342731514DA
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 05:07:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D375284DFF;
	Tue,  4 Feb 2020 04:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVZHCVe1LrhK; Tue,  4 Feb 2020 04:07:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB88E84DE6;
	Tue,  4 Feb 2020 04:07:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3DA0C0174;
	Tue,  4 Feb 2020 04:07:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06A25C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DFE382050E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-VTYpJ7cqut
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:07:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 05F3020506
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580789254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7B85Tuhdr78AsiT4Ni5YNT6BLFTLG2y3kO7hKIaH4E=;
 b=FlCp2ZsJEY28eO8BFBBd6IZuME691S+fTVnYhR9oMlRk4dtknw+Tdl9rJFjLvEIaXcCGLy
 cLAoKyRc0YJOgQsvR92Mhc/TfQV/JFFcKmIgo7rWlqxx3yYWEhocl1VhNedMjW1MYKxt1z
 0FR4nnnNp58mYpJUTnDzrukabec9XNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-IG-2EzjCNL6GTf6APFeeAw-1; Mon, 03 Feb 2020 23:07:23 -0500
X-MC-Unique: IG-2EzjCNL6GTf6APFeeAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AD66800D55;
 Tue,  4 Feb 2020 04:07:20 +0000 (UTC)
Received: from [10.72.12.170] (ovpn-12-170.pek2.redhat.com [10.72.12.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A691001920;
 Tue,  4 Feb 2020 04:07:02 +0000 (UTC)
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org
References: <20200128033215.GO1870@kadam>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d2babc39-8583-bf06-20d1-1a3be990f711@redhat.com>
Date: Tue, 4 Feb 2020 12:07:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200128033215.GO1870@kadam>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: jakub.kicinski@netronome.com, kvm@vger.kernel.org, mst@redhat.com,
 mhabets@solarflare.com, haotian.wang@sifive.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 kbuild-all@lists.01.org, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMS8yOCDkuIrljYgxMTozMiwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBIaSBKYXNv
biwKPgo+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9K
YXNvbi1XYW5nL3ZEUEEtc3VwcG9ydC8yMDIwMDExNy0xNzAyNDMKPiBiYXNlOiAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21zdC92aG9zdC5naXQgbGlu
dXgtbmV4dAoKCldpbGwgZml4IHRoaXMuCgpUaGFua3MKCgo+Cj4gSWYgeW91IGZpeCB0aGUgaXNz
dWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4KPiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgo+Cj4gc21hdGNoIHdhcm5pbmdzOgo+IGRyaXZlcnMvdmlydGlv
L3ZkcGEvdmRwYV9zaW0uYzoyODggdmRwYXNpbV9hbGxvY19jb2hlcmVudCgpIHdhcm46IHJldHVy
bmluZyBmcmVlZCBtZW1vcnkgJ2FkZHInCj4KPiAjIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNp
L2xpbnV4L2NvbW1pdC81NTA0Nzc2OWIzZTk3NGQ2OGIyYWFiNWNlMDAyMjQ1OWIxNzJhMjNmCj4g
Z2l0IHJlbW90ZSBhZGQgbGludXgtcmV2aWV3IGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xp
bnV4Cj4gZ2l0IHJlbW90ZSB1cGRhdGUgbGludXgtcmV2aWV3Cj4gZ2l0IGNoZWNrb3V0IDU1MDQ3
NzY5YjNlOTc0ZDY4YjJhYWI1Y2UwMDIyNDU5YjE3MmEyM2YKPiB2aW0gKy9hZGRyICsyODggZHJp
dmVycy92aXJ0aW8vdmRwYS92ZHBhX3NpbS5jCj4KPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5n
IDIwMjAtMDEtMTYgIDI2MyAgc3RhdGljIHZvaWQgKnZkcGFzaW1fYWxsb2NfY29oZXJlbnQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5n
IDIwMjAtMDEtMTYgIDI2NCAgCQkJCSAgICBkbWFfYWRkcl90ICpkbWFfYWRkciwgZ2ZwX3QgZmxh
ZywKPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5nIDIwMjAtMDEtMTYgIDI2NSAgCQkJCSAgICB1
bnNpZ25lZCBsb25nIGF0dHJzKQo+IDU1MDQ3NzY5YjNlOTc0IEphc29uIFdhbmcgMjAyMC0wMS0x
NiAgMjY2ICB7Cj4gNTUwNDc3NjliM2U5NzQgSmFzb24gV2FuZyAyMDIwLTAxLTE2ICAyNjcgIAlz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSBkZXZfdG9fdmRwYShkZXYpOwo+IDU1MDQ3NzY5YjNl
OTc0IEphc29uIFdhbmcgMjAyMC0wMS0xNiAgMjY4ICAJc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0g
PSB2ZHBhX3RvX3NpbSh2ZHBhKTsKPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5nIDIwMjAtMDEt
MTYgIDI2OSAgCXN0cnVjdCB2aG9zdF9pb3RsYiAqaW9tbXUgPSB2ZHBhc2ltLT5pb21tdTsKPiA1
NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5nIDIwMjAtMDEtMTYgIDI3MCAgCXZvaWQgKmFkZHIgPSBr
bWFsbG9jKHNpemUsIGZsYWcpOwo+IDU1MDQ3NzY5YjNlOTc0IEphc29uIFdhbmcgMjAyMC0wMS0x
NiAgMjcxICAJaW50IHJldDsKPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5nIDIwMjAtMDEtMTYg
IDI3Mgo+IDU1MDQ3NzY5YjNlOTc0IEphc29uIFdhbmcgMjAyMC0wMS0xNiAgMjczICAJaWYgKCFh
ZGRyKQo+IDU1MDQ3NzY5YjNlOTc0IEphc29uIFdhbmcgMjAyMC0wMS0xNiAgMjc0ICAJCSpkbWFf
YWRkciA9IERNQV9NQVBQSU5HX0VSUk9SOwo+IDU1MDQ3NzY5YjNlOTc0IEphc29uIFdhbmcgMjAy
MC0wMS0xNiAgMjc1ICAJZWxzZSB7Cj4gNTUwNDc3NjliM2U5NzQgSmFzb24gV2FuZyAyMDIwLTAx
LTE2ICAyNzYgIAkJdTY0IHBhID0gdmlydF90b19waHlzKGFkZHIpOwo+IDU1MDQ3NzY5YjNlOTc0
IEphc29uIFdhbmcgMjAyMC0wMS0xNiAgMjc3Cj4gNTUwNDc3NjliM2U5NzQgSmFzb24gV2FuZyAy
MDIwLTAxLTE2ICAyNzggIAkJcmV0ID0gdmhvc3RfaW90bGJfYWRkX3JhbmdlKGlvbW11LCAodTY0
KXBhLAo+IDU1MDQ3NzY5YjNlOTc0IEphc29uIFdhbmcgMjAyMC0wMS0xNiAgMjc5ICAJCQkJCSAg
ICAodTY0KXBhICsgc2l6ZSAtIDEsCj4gNTUwNDc3NjliM2U5NzQgSmFzb24gV2FuZyAyMDIwLTAx
LTE2ICAyODAgIAkJCQkJICAgIHBhLCBWSE9TVF9NQVBfUlcpOwo+IDU1MDQ3NzY5YjNlOTc0IEph
c29uIFdhbmcgMjAyMC0wMS0xNiAgMjgxICAJCWlmIChyZXQpIHsKPiA1NTA0Nzc2OWIzZTk3NCBK
YXNvbiBXYW5nIDIwMjAtMDEtMTYgIDI4MiAgCQkJa2ZyZWUoYWRkcik7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5e
Xl5eXl5eXgo+IDU1MDQ3NzY5YjNlOTc0IEphc29uIFdhbmcgMjAyMC0wMS0xNiAgMjgzICAJCQkq
ZG1hX2FkZHIgPSBETUFfTUFQUElOR19FUlJPUjsKPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5n
IDIwMjAtMDEtMTYgIDI4NCAgCQl9IGVsc2UKPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5nIDIw
MjAtMDEtMTYgIDI4NSAgCQkJKmRtYV9hZGRyID0gKGRtYV9hZGRyX3QpcGE7Cj4gNTUwNDc3Njli
M2U5NzQgSmFzb24gV2FuZyAyMDIwLTAxLTE2ICAyODYgIAl9Cj4gNTUwNDc3NjliM2U5NzQgSmFz
b24gV2FuZyAyMDIwLTAxLTE2ICAyODcKPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBXYW5nIDIwMjAt
MDEtMTYgQDI4OCAgCXJldHVybiBhZGRyOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl4KPiA1NTA0Nzc2OWIzZTk3NCBKYXNvbiBX
YW5nIDIwMjAtMDEtMTYgIDI4OSAgfQo+Cj4gLS0tCj4gMC1EQVkga2VybmVsIHRlc3QgaW5mcmFz
dHJ1Y3R1cmUgICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyCj4g
aHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L2tidWlsZC1hbGxAbGlzdHMuMDEu
b3JnIEludGVsIENvcnBvcmF0aW9uCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
