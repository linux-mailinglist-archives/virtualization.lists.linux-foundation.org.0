Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E15CC20C676
	for <lists.virtualization@lfdr.de>; Sun, 28 Jun 2020 08:21:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB0BA204E6;
	Sun, 28 Jun 2020 06:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8Z2IcMAMFjD; Sun, 28 Jun 2020 06:21:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D8FA0204CD;
	Sun, 28 Jun 2020 06:21:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A691AC08A5;
	Sun, 28 Jun 2020 06:21:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB241C016E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D9A4486B43
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaENcAIUIcB6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:21:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0CD5086B2C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593325310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydPGKU0wBmZmxp53ZfzQQ4RSolY15yJxARcJFXOo5Tg=;
 b=gtbwA3PlgaZ9KWLLpB/Akm+zfuDiaTxMiwsQpinspRzqSt88J34W3b0TC0kFF3/0rVtRGI
 ApqxBEh0k03FUyUet2zc1zfDZTYtGP6KUTqJPAVFfJP60fg20QARey0TQmdWzZeuVWbfev
 0csvkXvW7NOvD6Sv0Z65JLY2vRF4mhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-jrplHYykOrKSTXxU9WOO0w-1; Sun, 28 Jun 2020 02:21:41 -0400
X-MC-Unique: jrplHYykOrKSTXxU9WOO0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0F378015F5;
 Sun, 28 Jun 2020 06:21:40 +0000 (UTC)
Received: from [10.72.13.164] (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 286C0121B12;
 Sun, 28 Jun 2020 06:21:20 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] virtio: virtio_has_iommu_quirk ->
 virtio_has_dma_quirk
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200624232035.704217-1-mst@redhat.com>
 <20200624232035.704217-3-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <95941961-1c75-e2a5-d49b-7d7e204b7a41@redhat.com>
Date: Sun, 28 Jun 2020 14:21:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624232035.704217-3-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNi8yNSDkuIrljYg3OjIxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gTm93
IHRoYXQgdGhlIGNvcnJlc3BvbmRpbmcgZmVhdHVyZSBiaXQgaGFzIGJlZW4gcmVuYW1lZCwKPiBy
ZW5hbWUgdGhlIHF1aXJrIHRvbyAtIGl0J3MgYWJvdXQgc3BlY2lhbCB3YXlzIHRvCj4gZG8gRE1B
LCBub3QgbmVjZXNzYXJpbHkgYWJvdXQgdGhlIElPTU1VLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8IDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV92cS5jICAgICB8IDQgKystLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jp
bmcuYyAgICAgICAgICAgIHwgMiArLQo+ICAgaW5jbHVkZS9saW51eC92aXJ0aW9fY29uZmlnLmgg
ICAgICAgICAgIHwgNCArKy0tCj4gICB0b29scy92aXJ0aW8vbGludXgvdmlydGlvX2NvbmZpZy5o
ICAgICAgfCA0ICsrLS0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYwo+IGlu
ZGV4IDZjY2JkMDFjZDg4OC4uZTg3OTlhYjBjNzUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9vYmplY3QuYwo+IEBAIC0xNDEsNyArMTQxLDcgQEAgc3RhdGljIGludCB2aXJ0
aW9fZ3B1X29iamVjdF9zaG1lbV9pbml0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYs
Cj4gICAJCQkJCXN0cnVjdCB2aXJ0aW9fZ3B1X21lbV9lbnRyeSAqKmVudHMsCj4gICAJCQkJCXVu
c2lnbmVkIGludCAqbmVudHMpCj4gICB7Cj4gLQlib29sIHVzZV9kbWFfYXBpID0gIXZpcnRpb19o
YXNfaW9tbXVfcXVpcmsodmdkZXYtPnZkZXYpOwo+ICsJYm9vbCB1c2VfZG1hX2FwaSA9ICF2aXJ0
aW9faGFzX2RtYV9xdWlyayh2Z2Rldi0+dmRldik7Cj4gICAJc3RydWN0IHZpcnRpb19ncHVfb2Jq
ZWN0X3NobWVtICpzaG1lbSA9IHRvX3ZpcnRpb19ncHVfc2htZW0oYm8pOwo+ICAgCXN0cnVjdCBz
Y2F0dGVybGlzdCAqc2c7Cj4gICAJaW50IHNpLCByZXQ7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X3ZxLmMKPiBpbmRleCA5ZTY2M2E1ZDk5NTIuLjUzYWY2MGQ0ODRhNCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCj4gQEAgLTU5OSw3ICs1OTksNyBAQCB2b2lkIHZpcnRp
b19ncHVfY21kX3RyYW5zZmVyX3RvX2hvc3RfMmQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2
Z2RldiwKPiAgIAlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvID0gZ2VtX3RvX3ZpcnRpb19n
cHVfb2JqKG9ianMtPm9ianNbMF0pOwo+ICAgCXN0cnVjdCB2aXJ0aW9fZ3B1X3RyYW5zZmVyX3Rv
X2hvc3RfMmQgKmNtZF9wOwo+ICAgCXN0cnVjdCB2aXJ0aW9fZ3B1X3ZidWZmZXIgKnZidWY7Cj4g
LQlib29sIHVzZV9kbWFfYXBpID0gIXZpcnRpb19oYXNfaW9tbXVfcXVpcmsodmdkZXYtPnZkZXYp
Owo+ICsJYm9vbCB1c2VfZG1hX2FwaSA9ICF2aXJ0aW9faGFzX2RtYV9xdWlyayh2Z2Rldi0+dmRl
dik7Cj4gICAJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X3NobWVtICpzaG1lbSA9IHRvX3ZpcnRp
b19ncHVfc2htZW0oYm8pOwo+ICAgCj4gICAJaWYgKHVzZV9kbWFfYXBpKQo+IEBAIC0xMDE1LDcg
KzEwMTUsNyBAQCB2b2lkIHZpcnRpb19ncHVfY21kX3RyYW5zZmVyX3RvX2hvc3RfM2Qoc3RydWN0
IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKPiAgIAlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3Qg
KmJvID0gZ2VtX3RvX3ZpcnRpb19ncHVfb2JqKG9ianMtPm9ianNbMF0pOwo+ICAgCXN0cnVjdCB2
aXJ0aW9fZ3B1X3RyYW5zZmVyX2hvc3RfM2QgKmNtZF9wOwo+ICAgCXN0cnVjdCB2aXJ0aW9fZ3B1
X3ZidWZmZXIgKnZidWY7Cj4gLQlib29sIHVzZV9kbWFfYXBpID0gIXZpcnRpb19oYXNfaW9tbXVf
cXVpcmsodmdkZXYtPnZkZXYpOwo+ICsJYm9vbCB1c2VfZG1hX2FwaSA9ICF2aXJ0aW9faGFzX2Rt
YV9xdWlyayh2Z2Rldi0+dmRldik7Cj4gICAJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X3NobWVt
ICpzaG1lbSA9IHRvX3ZpcnRpb19ncHVfc2htZW0oYm8pOwo+ICAgCj4gICAJaWYgKHVzZV9kbWFf
YXBpKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+IGluZGV4IGExYTVjMmE5MTQyNi4uMzQyNTNjYjY5Y2I4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiArKysgYi9kcml2
ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gQEAgLTI0MCw3ICsyNDAsNyBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgdmlydHF1ZXVlX3VzZV9pbmRpcmVjdChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4g
ICAKPiAgIHN0YXRpYyBib29sIHZyaW5nX3VzZV9kbWFfYXBpKHN0cnVjdCB2aXJ0aW9fZGV2aWNl
ICp2ZGV2KQo+ICAgewo+IC0JaWYgKCF2aXJ0aW9faGFzX2lvbW11X3F1aXJrKHZkZXYpKQo+ICsJ
aWYgKCF2aXJ0aW9faGFzX2RtYV9xdWlyayh2ZGV2KSkKPiAgIAkJcmV0dXJuIHRydWU7Cj4gICAK
PiAgIAkvKiBPdGhlcndpc2UsIHdlIGFyZSBsZWZ0IHRvIGd1ZXNzLiAqLwo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3ZpcnRpb19jb25maWcuaCBiL2luY2x1ZGUvbGludXgvdmlydGlvX2Nv
bmZpZy5oCj4gaW5kZXggZjJjYzJhMGRmMTc0Li4zYjRlYWU1YWM1ZTMgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9saW51eC92aXJ0aW9fY29uZmlnLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRp
b19jb25maWcuaAo+IEBAIC0xNjIsMTAgKzE2MiwxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgdmly
dGlvX2hhc19mZWF0dXJlKGNvbnN0IHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LAo+ICAgfQo+
ICAgCj4gICAvKioKPiAtICogdmlydGlvX2hhc19pb21tdV9xdWlyayAtIGRldGVybWluZSB3aGV0
aGVyIHRoaXMgZGV2aWNlIGhhcyB0aGUgaW9tbXUgcXVpcmsKPiArICogdmlydGlvX2hhc19kbWFf
cXVpcmsgLSBkZXRlcm1pbmUgd2hldGhlciB0aGlzIGRldmljZSBoYXMgdGhlIERNQSBxdWlyawo+
ICAgICogQHZkZXY6IHRoZSBkZXZpY2UKPiAgICAqLwo+IC1zdGF0aWMgaW5saW5lIGJvb2wgdmly
dGlvX2hhc19pb21tdV9xdWlyayhjb25zdCBzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAr
c3RhdGljIGlubGluZSBib29sIHZpcnRpb19oYXNfZG1hX3F1aXJrKGNvbnN0IHN0cnVjdCB2aXJ0
aW9fZGV2aWNlICp2ZGV2KQo+ICAgewo+ICAgCS8qCj4gICAJICogTm90ZSB0aGUgcmV2ZXJzZSBw
b2xhcml0eSBvZiB0aGUgcXVpcmsgZmVhdHVyZSAoY29tcGFyZWQgdG8gbW9zdAo+IGRpZmYgLS1n
aXQgYS90b29scy92aXJ0aW8vbGludXgvdmlydGlvX2NvbmZpZy5oIGIvdG9vbHMvdmlydGlvL2xp
bnV4L3ZpcnRpb19jb25maWcuaAo+IGluZGV4IGY5OWFlNDI2NjhlMC4uZjI2NDBlNTA1YzRlIDEw
MDY0NAo+IC0tLSBhL3Rvb2xzL3ZpcnRpby9saW51eC92aXJ0aW9fY29uZmlnLmgKPiArKysgYi90
b29scy92aXJ0aW8vbGludXgvdmlydGlvX2NvbmZpZy5oCj4gQEAgLTQyLDEwICs0MiwxMCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgX192aXJ0aW9fY2xlYXJfYml0KHN0cnVjdCB2aXJ0aW9fZGV2aWNl
ICp2ZGV2LAo+ICAgCShfX3ZpcnRpb190ZXN0X2JpdCgoZGV2KSwgZmVhdHVyZSkpCj4gICAKPiAg
IC8qKgo+IC0gKiB2aXJ0aW9faGFzX2lvbW11X3F1aXJrIC0gZGV0ZXJtaW5lIHdoZXRoZXIgdGhp
cyBkZXZpY2UgaGFzIHRoZSBpb21tdSBxdWlyawo+ICsgKiB2aXJ0aW9faGFzX2RtYV9xdWlyayAt
IGRldGVybWluZSB3aGV0aGVyIHRoaXMgZGV2aWNlIGhhcyB0aGUgRE1BIHF1aXJrCj4gICAgKiBA
dmRldjogdGhlIGRldmljZQo+ICAgICovCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCB2aXJ0aW9faGFz
X2lvbW11X3F1aXJrKGNvbnN0IHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgdmlydGlvX2hhc19kbWFfcXVpcmsoY29uc3Qgc3RydWN0IHZpcnRpb19kZXZp
Y2UgKnZkZXYpCj4gICB7Cj4gICAJLyoKPiAgIAkgKiBOb3RlIHRoZSByZXZlcnNlIHBvbGFyaXR5
IG9mIHRoZSBxdWlyayBmZWF0dXJlIChjb21wYXJlZCB0byBtb3N0CgoKQWNrZWQtYnk6IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
