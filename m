Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EBC220E9E
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 16:02:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A8FC8AE53;
	Wed, 15 Jul 2020 14:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xwg+7uEkw6NZ; Wed, 15 Jul 2020 14:02:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 173978AC05;
	Wed, 15 Jul 2020 14:02:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5825C0733;
	Wed, 15 Jul 2020 14:02:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEE4BC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 98052893EA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FC3Eeu-aX-gW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:02:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F9E288B07
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594821764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvHDwOoLbdSaOIDbTqIso84H/Gr3/SW89Du8SzMSm1c=;
 b=MB781OHZ2jB0ROJWdNwp4VMIUZlnqcWNnFT/x0wbwCeFytwG2f8+4HgAVXtcELhNivIluD
 5jhxpUwpLY0wG1zG9SuK0R2rknXVKKkLxG8AHJWMf89bfMPxr1qYN/ZIAk1bMG7FzdxblL
 TpXm4p8YkcrbtR4pYcZd9Y3Ituq1m9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-X7wHNdWnOBqDZp5sCk_oAw-1; Wed, 15 Jul 2020 10:02:42 -0400
X-MC-Unique: X7wHNdWnOBqDZp5sCk_oAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3334880572E;
 Wed, 15 Jul 2020 14:02:41 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4900B19C4F;
 Wed, 15 Jul 2020 14:02:35 +0000 (UTC)
Subject: Re: [PATCH RFC don't apply] vdpa_sim: endian-ness for config space
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200715135540.22832-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8f39dcc1-0899-7ed8-8a6e-75672417b9e3@redhat.com>
Date: Wed, 15 Jul 2020 22:02:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715135540.22832-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNy8xNSDkuIvljYg5OjU4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gVkRQ
QSBzaW0gc3RvcmVzIGNvbmZpZyBzcGFjZSBhcyBuYXRpdmUgZW5kaWFuLCBidXQgdGhhdAo+IGlz
IHdyb25nOiBtb2Rlcm4gZ3Vlc3RzIGV4cGVjdCBMRS4KPiBJIGNvZGVkIHVwIHRoZSBmb2xsb3dp
bmcgdG8gZml4IGl0IHVwLCBidXQgaXQgaXMgd3JvbmcgdG9vOgo+IHZkcGFzaW1fY3JlYXRlIGlz
IGNhbGxlZCBiZWZvcmUgZ3Vlc3QgZmVhdHVyZXMgYXJlIGtub3duLgo+Cj4gU28gd2hhdCBzaG91
bGQgd2UgZG8/IE5ldyBpb2N0bCB0byBzcGVjaWZ5IHRoZSBpbnRlcmZhY2UgdXNlZD8KPiBNb3Jl
IGlkZWFzPwo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0
LmNvbT4KCgpDYW4gd2UgZG8gdGhlIGVuZGlhbiBjb252ZXJzaW9uIGluIHNldF9jb25maWcvZ2V0
X2NvbmZpZygpPwoKVGhhbmtzCgoKPgo+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0v
dmRwYV9zaW0uYyB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFf
c2ltLmMKPiBpbmRleCBhOWJjNWUwZmIzNTMuLmNjNzU0YWUwZWMxNSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBh
X3NpbS92ZHBhX3NpbS5jCj4gQEAgLTI0LDYgKzI0LDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9l
dGhlcmRldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3ZyaW5naC5oPgo+ICAgI2luY2x1ZGUg
PGxpbnV4L3ZkcGEuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19ieXRlb3JkZXIuaD4KPiAg
ICNpbmNsdWRlIDxsaW51eC92aG9zdF9pb3RsYi5oPgo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgv
dmlydGlvX2NvbmZpZy5oPgo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX25ldC5oPgo+
IEBAIC03Miw2ICs3MywyMyBAQCBzdHJ1Y3QgdmRwYXNpbSB7Cj4gICAJdTY0IGZlYXR1cmVzOwo+
ICAgfTsKPiAgIAo+ICsvKiBUT0RPOiBjcm9zcy1lbmRpYW4gc3VwcG9ydCAqLwo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgdmRwYXNpbV9pc19saXR0bGVfZW5kaWFuKHN0cnVjdCB2ZHBhc2ltICp2ZHBh
c2ltKQo+ICt7Cj4gKwlyZXR1cm4gdmlydGlvX2xlZ2FjeV9pc19saXR0bGVfZW5kaWFuKCkgfHwK
PiArCQkodmRwYXNpbS0+ZmVhdHVyZXMgJiAoMVVMTCA8PCBWSVJUSU9fRl9WRVJTSU9OXzEpKTsK
PiArfQo+ICsKPiArc3RhdGljIGlubGluZSB1MTYgdmRwYXNpbTE2X3RvX2NwdShzdHJ1Y3QgdmRw
YXNpbSAqdmRwYXNpbSwgX192aXJ0aW8xNiB2YWwpCj4gK3sKPiArCXJldHVybiBfX3ZpcnRpbzE2
X3RvX2NwdSh2ZHBhc2ltX2lzX2xpdHRsZV9lbmRpYW4odmRwYXNpbSksIHZhbCk7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBpbmxpbmUgX192aXJ0aW8xNiBjcHVfdG9fdmRwYXNpbTE2KHN0cnVjdCB2ZHBh
c2ltICp2ZHBhc2ltLCB1MTYgdmFsKQo+ICt7Cj4gKwlyZXR1cm4gX19jcHVfdG9fdmlydGlvMTYo
dmRwYXNpbV9pc19saXR0bGVfZW5kaWFuKHZkcGFzaW0pLCB2YWwpOwo+ICt9Cj4gKwo+ICAgc3Rh
dGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltX2RldjsKPiAgIAo+ICAgc3RhdGljIHN0cnVjdCB2
ZHBhc2ltICp2ZHBhX3RvX3NpbShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4gQEAgLTMzMiw4
ICszNTAsOCBAQCBzdGF0aWMgc3RydWN0IHZkcGFzaW0gKnZkcGFzaW1fY3JlYXRlKHZvaWQpCj4g
ICAJCWdvdG8gZXJyX2lvbW11Owo+ICAgCj4gICAJY29uZmlnID0gJnZkcGFzaW0tPmNvbmZpZzsK
PiAtCWNvbmZpZy0+bXR1ID0gMTUwMDsKPiAtCWNvbmZpZy0+c3RhdHVzID0gVklSVElPX05FVF9T
X0xJTktfVVA7Cj4gKwljb25maWctPm10dSA9IGNwdV90b192ZHBhc2ltMTYodmRwYXNpbSwgMTUw
MCk7Cj4gKwljb25maWctPnN0YXR1cyA9IGNwdV90b192ZHBhc2ltMTYodmRwYXNpbSwgVklSVElP
X05FVF9TX0xJTktfVVApOwo+ICAgCWV0aF9yYW5kb21fYWRkcihjb25maWctPm1hYyk7Cj4gICAK
PiAgIAl2cmluZ2hfc2V0X2lvdGxiKCZ2ZHBhc2ltLT52cXNbMF0udnJpbmcsIHZkcGFzaW0tPmlv
bW11KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
