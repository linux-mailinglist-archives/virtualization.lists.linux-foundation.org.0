Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6071A427C
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 08:21:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6BEC8815E;
	Fri, 10 Apr 2020 06:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rgAFASPU68m; Fri, 10 Apr 2020 06:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 868B38816B;
	Fri, 10 Apr 2020 06:21:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72A6EC0177;
	Fri, 10 Apr 2020 06:21:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 299BFC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 06:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 134E988164
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 06:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXC4j8rnYJr0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 06:21:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 266758815E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586499673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLUdw7D/EcbCC4PhngbwYSwRK7VO2nDFahJzRTXLZAM=;
 b=QLwoDrrIDFEpbqr0fmaiBDafuooUmYHKxtIJShoYFXUKG2RkDkc4t8AVVrW02JOYEiZ+U+
 nrAVEqtHN7cEibS9U44V0N3zMaCaFqaMr4Ci30NT2vgpizAxx+MgTGEz9bUiMlVVXKoeu0
 IcI7kI/CBG+NNitSBGahld+TxHW8SuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-Wi1lpvTxPdOy0zhbrDjSmg-1; Fri, 10 Apr 2020 02:21:09 -0400
X-MC-Unique: Wi1lpvTxPdOy0zhbrDjSmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C15D1005513;
 Fri, 10 Apr 2020 06:21:08 +0000 (UTC)
Received: from [10.72.12.205] (ovpn-12-205.pek2.redhat.com [10.72.12.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA521272A6;
 Fri, 10 Apr 2020 06:21:03 +0000 (UTC)
Subject: Re: [PATCH] vdpa: allow a 32 bit vq alignment
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200409202825.10115-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bed03b3a-ebc0-2a93-7e6b-8f884eab747b@redhat.com>
Date: Fri, 10 Apr 2020 14:21:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200409202825.10115-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 virtualization@lists.linux-foundation.org
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

Q2MgTGluZyBTaGFuLgoKT24gMjAyMC80LzEwIOS4iuWNiDQ6MjgsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiBnZXRfdnFfYWxpZ24gcmV0dXJucyB1MTYgbm93LCBidXQgdGhhdCdzIG5vdCBl
bm91Z2ggZm9yCj4gc3lzdGVtcy9kZXZpY2VzIHdpdGggNjRLIHBhZ2VzLiBBbGwgY2FsbGVycyBh
c3NpZ24gaXQgdG8KPiBhIHUzMiB2YXJpYWJsZSBhbnl3YXksIHNvIGxldCdzIGp1c3QgY2hhbmdl
IHRoZSByZXR1cm4KPiB2YWx1ZSB0eXBlIHRvIHUzMi4KPgo+IENjOiAiWmh1LCBMaW5nc2hhbiIg
PGxpbmdzaGFuLnpodUBpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgIHwgMiAr
LQo+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgfCAyICstCj4gICBpbmNsdWRl
L2xpbnV4L3ZkcGEuaCAgICAgICAgICAgICB8IDIgKy0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRw
YS9pZmN2Zi9pZmN2Zl9tYWluLmMgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4g
aW5kZXggMjhkOWU1ZGU1Njc1Li5hYmY2YTA2MWNhYjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92
ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9t
YWluLmMKPiBAQCAtMjI2LDcgKzIyNiw3IEBAIHN0YXRpYyB1MzIgaWZjdmZfdmRwYV9nZXRfdmVu
ZG9yX2lkKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYpCj4gICAJcmV0dXJuIElGQ1ZGX1NV
QlNZU19WRU5ET1JfSUQ7Cj4gICB9Cj4gICAKPiAtc3RhdGljIHUxNiBpZmN2Zl92ZHBhX2dldF92
cV9hbGlnbihzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGFfZGV2KQo+ICtzdGF0aWMgdTMyIGlmY3Zm
X3ZkcGFfZ2V0X3ZxX2FsaWduKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYpCj4gICB7Cj4g
ICAJcmV0dXJuIElGQ1ZGX1FVRVVFX0FMSUdOTUVOVDsKPiAgIH0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRw
YV9zaW0uYwo+IGluZGV4IDcyODYzZDAxYTEyYS4uNzk1N2QyZDQxZmM0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4gKysrIGIvZHJpdmVycy92ZHBhL3Zk
cGFfc2ltL3ZkcGFfc2ltLmMKPiBAQCAtNDM1LDcgKzQzNSw3IEBAIHN0YXRpYyB1NjQgdmRwYXNp
bV9nZXRfdnFfc3RhdGUoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhLCB1MTYgaWR4KQo+ICAgCXJl
dHVybiB2cmgtPmxhc3RfYXZhaWxfaWR4Owo+ICAgfQo+ICAgCj4gLXN0YXRpYyB1MTYgdmRwYXNp
bV9nZXRfdnFfYWxpZ24oc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhKQo+ICtzdGF0aWMgdTMyIHZk
cGFzaW1fZ2V0X3ZxX2FsaWduKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSkKPiAgIHsKPiAgIAly
ZXR1cm4gVkRQQVNJTV9RVUVVRV9BTElHTjsKPiAgIH0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC92ZHBhLmggYi9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+IGluZGV4IDczM2FjZmI3ZWY4NC4u
NTQ1M2FmODdhMzNlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvdmRwYS5oCj4gKysrIGIv
aW5jbHVkZS9saW51eC92ZHBhLmgKPiBAQCAtMTY0LDcgKzE2NCw3IEBAIHN0cnVjdCB2ZHBhX2Nv
bmZpZ19vcHMgewo+ICAgCXU2NCAoKmdldF92cV9zdGF0ZSkoc3RydWN0IHZkcGFfZGV2aWNlICp2
ZGV2LCB1MTYgaWR4KTsKPiAgIAo+ICAgCS8qIERldmljZSBvcHMgKi8KPiAtCXUxNiAoKmdldF92
cV9hbGlnbikoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKPiArCXUzMiAoKmdldF92cV9hbGln
bikoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKPiAgIAl1NjQgKCpnZXRfZmVhdHVyZXMpKHN0
cnVjdCB2ZHBhX2RldmljZSAqdmRldik7Cj4gICAJaW50ICgqc2V0X2ZlYXR1cmVzKShzdHJ1Y3Qg
dmRwYV9kZXZpY2UgKnZkZXYsIHU2NCBmZWF0dXJlcyk7Cj4gICAJdm9pZCAoKnNldF9jb25maWdf
Y2IpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
