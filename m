Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35E21CDC2
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 05:32:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E30486FC4;
	Mon, 13 Jul 2020 03:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tl9J1ZfmhFvl; Mon, 13 Jul 2020 03:31:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A639F86FD9;
	Mon, 13 Jul 2020 03:31:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A299C0733;
	Mon, 13 Jul 2020 03:31:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 060F5C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DF25E888C2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zaA468AvHQk
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:31:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0F70A88995
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594611115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyZHuYtJrGj2meth1Sm/wJxgmzcWzcHt3+2ZKG1/cLQ=;
 b=XF3QMf+muv5yotT7/6cgxZY8MNQqIYNvEydMw/6ywJovgBMnw7U52H+VAEEXOkXSIG90wx
 wj7KSZhGmMcE8pdhZmsQFxvPf2fZJGGX4AsidDNrWYCF6ajcBu7oVCk2WKB1nQE3ZZ9vPS
 +LvwrYZ7/UQZVtdyj0dom+hhlZYj6/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-nd3WMGC_Mj-Yat-odoEbZw-1; Sun, 12 Jul 2020 23:31:54 -0400
X-MC-Unique: nd3WMGC_Mj-Yat-odoEbZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5A41800597;
 Mon, 13 Jul 2020 03:31:52 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EDFF5C6C0;
 Mon, 13 Jul 2020 03:31:44 +0000 (UTC)
Subject: Re: [PATCH] vhost/scsi: fix up req type endian-ness
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200710104849.406023-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8acbce23-275a-141a-0bfb-1535c6edcbb4@redhat.com>
Date: Mon, 13 Jul 2020 11:31:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710104849.406023-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

Ck9uIDIwMjAvNy8xMCDkuIvljYg2OjQ4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gdmhv
c3Qvc2NzaSBkb2Vzbid0IGhhbmRsZSB0eXBlIGNvbnZlcnNpb24gY29ycmVjdGx5Cj4gZm9yIHJl
cXVlc3QgdHlwZSB3aGVuIHVzaW5nIHZpcnRpbyAxLjAgYW5kIHVwIGZvciBCRSwKPiBvciBjcm9z
cy1lbmRpYW4gcGxhdGZvcm1zLgo+Cj4gRml4IGl0IHVwIHVzaW5nIHZob3N0XzMyX3RvX2NwdS4K
Pgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBT
LiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3Qvc2NzaS5j
IHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9zY3NpLmMgYi9kcml2ZXJzL3Zob3N0L3Nj
c2kuYwo+IGluZGV4IDZmYjRkN2VjZmExOS4uYjIyYWRmMDNmNTg0IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvdmhvc3Qvc2NzaS5jCj4gKysrIGIvZHJpdmVycy92aG9zdC9zY3NpLmMKPiBAQCAtMTIx
NSw3ICsxMjE1LDcgQEAgdmhvc3Rfc2NzaV9jdGxfaGFuZGxlX3ZxKHN0cnVjdCB2aG9zdF9zY3Np
ICp2cywgc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4gICAJCQljb250aW51ZTsKPiAgIAkJ
fQo+ICAgCj4gLQkJc3dpdGNoICh2X3JlcS50eXBlKSB7Cj4gKwkJc3dpdGNoICh2aG9zdDMyX3Rv
X2NwdSh2cSwgdl9yZXEudHlwZSkpIHsKPiAgIAkJY2FzZSBWSVJUSU9fU0NTSV9UX1RNRjoKPiAg
IAkJCXZjLnJlcSA9ICZ2X3JlcS50bWY7Cj4gICAJCQl2Yy5yZXFfc2l6ZSA9IHNpemVvZihzdHJ1
Y3QgdmlydGlvX3Njc2lfY3RybF90bWZfcmVxKTsKCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
