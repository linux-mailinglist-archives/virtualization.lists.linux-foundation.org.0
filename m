Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF71D6F4F
	for <lists.virtualization@lfdr.de>; Mon, 18 May 2020 05:27:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E78DE883E4;
	Mon, 18 May 2020 03:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3u7VlFoh1yBx; Mon, 18 May 2020 03:27:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07100883DA;
	Mon, 18 May 2020 03:27:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA9BAC07FF;
	Mon, 18 May 2020 03:27:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 846F1C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 03:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 678D120349
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 03:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DRp8AGyG7zO0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 03:27:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5008820009
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 03:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589772466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWq69cxc6uMliMSLmzS+y2EN4gmCm0BpLb7U6ruoHg0=;
 b=CdDKS8HTH6L6NKbyOBHKBaJ8sHW5bkX2hpddAmkVwp/02k4l1dKMQIRFiHyXjAKtq8Yg82
 kN59+1sez7du8a+HsKJPJWucS1KN/MVxOU/iStEePnWE8Vf+YXuRjBm9Gf67F5sA12P84K
 J751ihtAAj8aSqmrzCQCU8OriqXdRQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-bZgQyu2AMO-a8DtVqHT04g-1; Sun, 17 May 2020 23:27:44 -0400
X-MC-Unique: bZgQyu2AMO-a8DtVqHT04g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D42A8015D2;
 Mon, 18 May 2020 03:27:43 +0000 (UTC)
Received: from [10.72.13.232] (ovpn-13-232.pek2.redhat.com [10.72.13.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE12E10013D9;
 Mon, 18 May 2020 03:27:38 +0000 (UTC)
Subject: Re: [PATCH] vhost: missing __user tags
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200515153347.1092235-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f6d7e432-0951-8c3f-829e-78466fd39446@redhat.com>
Date: Mon, 18 May 2020 11:27:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515153347.1092235-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, kbuild test robot <lkp@intel.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNS8xNSDkuIvljYgxMTozMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IHNw
YXJzZSB3YXJucyBhYm91dCBjb252ZXJ0aW5nIHZvaWQgKiB0byB2b2lkIF9fdXNlciAqLiBUaGlz
IGlzIG5vdCBuZXcKPiBidXQgb25seSBnb3Qgbm90aWNlZCBub3cgdGhhdCB2aG9zdCBpcyBidWls
dCBvbiBtb3JlIHN5c3RlbXMuCj4gVGhpcyBpcyBqdXN0IGEgcXVlc3Rpb24gb2YgX191c2VyIHRh
Z3MgbWlzc2luZyBpbiBhIGNvdXBsZSBvZiBwbGFjZXMsCj4gc28gZml4IGl0IHVwLgo+Cj4gRml4
ZXM6IGY4ODk0OTEzODA1OCAoInZob3N0OiBpbnRyb2R1Y2UgTygxKSB2cSBtZXRhZGF0YSBjYWNo
ZSIpCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gLS0tCj4g
ICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9z
dC92aG9zdC5jIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gaW5kZXggZDQ1MGUxNmM1YzI1Li4y
MWE1OWI1OThlZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gKysrIGIv
ZHJpdmVycy92aG9zdC92aG9zdC5jCj4gQEAgLTczMCw3ICs3MzAsNyBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgX191c2VyICp2aG9zdF92cV9tZXRhX2ZldGNoKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUg
KnZxLAo+ICAgCWlmICghbWFwKQo+ICAgCQlyZXR1cm4gTlVMTDsKPiAgIAo+IC0JcmV0dXJuICh2
b2lkICopKHVpbnRwdHJfdCkobWFwLT5hZGRyICsgYWRkciAtIG1hcC0+c3RhcnQpOwo+ICsJcmV0
dXJuICh2b2lkIF9fdXNlciAqKSh1aW50cHRyX3QpKG1hcC0+YWRkciArIGFkZHIgLSBtYXAtPnN0
YXJ0KTsKPiAgIH0KPiAgIAo+ICAgLyogQ2FuIHdlIHN3aXRjaCB0byB0aGlzIG1lbW9yeSB0YWJs
ZT8gKi8KPiBAQCAtODY5LDcgKzg2OSw3IEBAIHN0YXRpYyB2b2lkIF9fdXNlciAqX192aG9zdF9n
ZXRfdXNlcl9zbG93KHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLAo+ICAgICogbm90IGhhcHBl
biBpbiB0aGlzIGNhc2UuCj4gICAgKi8KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3VzZXIgKl9f
dmhvc3RfZ2V0X3VzZXIoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gLQkJCQkJICAgIHZv
aWQgKmFkZHIsIHVuc2lnbmVkIGludCBzaXplLAo+ICsJCQkJCSAgICB2b2lkIF9fdXNlciAqYWRk
ciwgdW5zaWduZWQgaW50IHNpemUsCj4gICAJCQkJCSAgICBpbnQgdHlwZSkKPiAgIHsKPiAgIAl2
b2lkIF9fdXNlciAqdWFkZHIgPSB2aG9zdF92cV9tZXRhX2ZldGNoKHZxLAoKCkFja2VkLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
