Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5AD1A3E41
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 04:32:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDE7887836;
	Fri, 10 Apr 2020 02:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiBwVm0RcrW8; Fri, 10 Apr 2020 02:31:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 354848784C;
	Fri, 10 Apr 2020 02:31:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06440C0177;
	Fri, 10 Apr 2020 02:31:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33CCAC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 02:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1BFA28625B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 02:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id beYqFuGEdLOI
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 02:31:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E2BEE86257
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 02:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586485914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReY0zPHNpW7Jzyke6wRlOB3aMGGtHD3+Ak3PVHlfvWQ=;
 b=OkCrzYWDCY+2sWxJ4CQ3bOqopTXbR8kB/f8aQk7MLec4n0a3ZcfwyvuK/RXs1zFkOzIuMS
 SyNtZJPu/zg6Fg45PuDeuhCIhFkb89P7GdFZDRITsZs3VtpH8v4iLbyDOaYxe4CU5Ay51U
 +WNduHsxwHngUq3vGZH4rE+SG6r4KxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-gdLCRZsxOdup0vSP7zyKJw-1; Thu, 09 Apr 2020 22:31:52 -0400
X-MC-Unique: gdLCRZsxOdup0vSP7zyKJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA251800D4A;
 Fri, 10 Apr 2020 02:31:51 +0000 (UTC)
Received: from [10.72.13.185] (ovpn-13-185.pek2.redhat.com [10.72.13.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9350D5C1C3;
 Fri, 10 Apr 2020 02:31:46 +0000 (UTC)
Subject: Re: [PATCH] vdpa: allow a 32 bit vq alignment
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200409202825.10115-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dc49858e-a71d-7bb4-29db-5cb5d1c3e181@redhat.com>
Date: Fri, 10 Apr 2020 10:31:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200409202825.10115-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNC8xMCDkuIrljYg0OjI4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gZ2V0
X3ZxX2FsaWduIHJldHVybnMgdTE2IG5vdywgYnV0IHRoYXQncyBub3QgZW5vdWdoIGZvcgo+IHN5
c3RlbXMvZGV2aWNlcyB3aXRoIDY0SyBwYWdlcy4gQWxsIGNhbGxlcnMgYXNzaWduIGl0IHRvCj4g
YSB1MzIgdmFyaWFibGUgYW55d2F5LCBzbyBsZXQncyBqdXN0IGNoYW5nZSB0aGUgcmV0dXJuCj4g
dmFsdWUgdHlwZSB0byB1MzIuCj4KPiBDYzogIlpodSwgTGluZ3NoYW4iIDxsaW5nc2hhbi56aHVA
aW50ZWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gLS0t
CgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKPiAgIGRyaXZl
cnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgIHwgMiArLQo+ICAgZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmMgfCAyICstCj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCAgICAgICAgICAg
ICB8IDIgKy0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgYi9k
cml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gaW5kZXggMjhkOWU1ZGU1Njc1Li5hYmY2
YTA2MWNhYjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+
ICsrKyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBAQCAtMjI2LDcgKzIyNiw3
IEBAIHN0YXRpYyB1MzIgaWZjdmZfdmRwYV9nZXRfdmVuZG9yX2lkKHN0cnVjdCB2ZHBhX2Rldmlj
ZSAqdmRwYV9kZXYpCj4gICAJcmV0dXJuIElGQ1ZGX1NVQlNZU19WRU5ET1JfSUQ7Cj4gICB9Cj4g
ICAKPiAtc3RhdGljIHUxNiBpZmN2Zl92ZHBhX2dldF92cV9hbGlnbihzdHJ1Y3QgdmRwYV9kZXZp
Y2UgKnZkcGFfZGV2KQo+ICtzdGF0aWMgdTMyIGlmY3ZmX3ZkcGFfZ2V0X3ZxX2FsaWduKHN0cnVj
dCB2ZHBhX2RldmljZSAqdmRwYV9kZXYpCj4gICB7Cj4gICAJcmV0dXJuIElGQ1ZGX1FVRVVFX0FM
SUdOTUVOVDsKPiAgIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFf
c2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+IGluZGV4IDcyODYzZDAx
YTEyYS4uNzk1N2QyZDQxZmM0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92
ZHBhX3NpbS5jCj4gKysrIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiBAQCAt
NDM1LDcgKzQzNSw3IEBAIHN0YXRpYyB1NjQgdmRwYXNpbV9nZXRfdnFfc3RhdGUoc3RydWN0IHZk
cGFfZGV2aWNlICp2ZHBhLCB1MTYgaWR4KQo+ICAgCXJldHVybiB2cmgtPmxhc3RfYXZhaWxfaWR4
Owo+ICAgfQo+ICAgCj4gLXN0YXRpYyB1MTYgdmRwYXNpbV9nZXRfdnFfYWxpZ24oc3RydWN0IHZk
cGFfZGV2aWNlICp2ZHBhKQo+ICtzdGF0aWMgdTMyIHZkcGFzaW1fZ2V0X3ZxX2FsaWduKHN0cnVj
dCB2ZHBhX2RldmljZSAqdmRwYSkKPiAgIHsKPiAgIAlyZXR1cm4gVkRQQVNJTV9RVUVVRV9BTElH
TjsKPiAgIH0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92ZHBhLmggYi9pbmNsdWRlL2xp
bnV4L3ZkcGEuaAo+IGluZGV4IDczM2FjZmI3ZWY4NC4uNTQ1M2FmODdhMzNlIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvdmRwYS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPiBA
QCAtMTY0LDcgKzE2NCw3IEBAIHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgewo+ICAgCXU2NCAoKmdl
dF92cV9zdGF0ZSkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1MTYgaWR4KTsKPiAgIAo+ICAg
CS8qIERldmljZSBvcHMgKi8KPiAtCXUxNiAoKmdldF92cV9hbGlnbikoc3RydWN0IHZkcGFfZGV2
aWNlICp2ZGV2KTsKPiArCXUzMiAoKmdldF92cV9hbGlnbikoc3RydWN0IHZkcGFfZGV2aWNlICp2
ZGV2KTsKPiAgIAl1NjQgKCpnZXRfZmVhdHVyZXMpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldik7
Cj4gICAJaW50ICgqc2V0X2ZlYXR1cmVzKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHU2NCBm
ZWF0dXJlcyk7Cj4gICAJdm9pZCAoKnNldF9jb25maWdfY2IpKHN0cnVjdCB2ZHBhX2RldmljZSAq
dmRldiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
