Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C7226A032
	for <lists.virtualization@lfdr.de>; Tue, 15 Sep 2020 09:53:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE1C6870A2;
	Tue, 15 Sep 2020 07:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwcQBzjub0CX; Tue, 15 Sep 2020 07:53:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E2FD870A9;
	Tue, 15 Sep 2020 07:53:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3BAFC0051;
	Tue, 15 Sep 2020 07:53:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 287BAC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 17234870A6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AN4RrIrJ8iVw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:53:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3B06F870A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600156405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGaRRpjQpf+p1Uh5RvyOwyknbPxdKoLhOu6iSyQOJLQ=;
 b=CvxHaP96CKDSfEhVFfqiXyF+ln4QEftHglvVYy3QiiIw2AU2EyRu8A1n5BpR4u5prjweW2
 bXhD1QFv7lKCqtK5w9sQPEHCvVFelQbe+3PiLzG+rsMG2CgVolQ+hNVV/rsnpbxtAKsFzD
 VWE3uXQsHlT6zhk/wfXY0zivH+y7ehQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-CKquWnuHPniKTi8BnrRA9A-1; Tue, 15 Sep 2020 03:53:23 -0400
X-MC-Unique: CKquWnuHPniKTi8BnrRA9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F8A58014D9;
 Tue, 15 Sep 2020 07:53:22 +0000 (UTC)
Received: from [10.72.13.94] (ovpn-13-94.pek2.redhat.com [10.72.13.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A4A27EB8B;
 Tue, 15 Sep 2020 07:53:17 +0000 (UTC)
Subject: Re: [PATCH] vhost: reduce stack usage in log_used
To: Li Wang <li.wang@windriver.com>, mst@redhat.com
References: <1199326218.16921082.1600051335160.JavaMail.zimbra@redhat.com>
 <1600106889-25013-1-git-send-email-li.wang@windriver.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7c22eeb8-6060-929d-15d7-f1403b98c17f@redhat.com>
Date: Tue, 15 Sep 2020 15:53:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600106889-25013-1-git-send-email-li.wang@windriver.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvOS8xNSDkuIrljYgyOjA4LCBMaSBXYW5nIHdyb3RlOgo+IEZpeCB0aGUgd2Fybmlu
ZzogWy1XZXJyb3I9LVdmcmFtZS1sYXJnZXItdGhhbj1dCj4KPiBkcml2ZXJzL3Zob3N0L3Zob3N0
LmM6IEluIGZ1bmN0aW9uIGxvZ191c2VkOgo+IGRyaXZlcnMvdmhvc3Qvdmhvc3QuYzoxOTA2OjE6
Cj4gd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTA0MCBieXRlcyBpcyBsYXJnZXIgdGhhbiAx
MDI0IGJ5dGVzCj4KPiBTaWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaS53YW5nQHdpbmRyaXZlci5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyICstCj4gICBkcml2ZXJzL3Zo
b3N0L3Zob3N0LmggfCAxICsKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5jIGIvZHJp
dmVycy92aG9zdC92aG9zdC5jCj4gaW5kZXggYjQ1NTE5Yy4uMzE4MzdhNQo+IC0tLSBhL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+IEBAIC0xODg0
LDcgKzE4ODQsNyBAQCBzdGF0aWMgaW50IGxvZ193cml0ZV9odmEoc3RydWN0IHZob3N0X3ZpcnRx
dWV1ZSAqdnEsIHU2NCBodmEsIHU2NCBsZW4pCj4gICAKPiAgIHN0YXRpYyBpbnQgbG9nX3VzZWQo
c3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsIHU2NCB1c2VkX29mZnNldCwgdTY0IGxlbikKPiAg
IHsKPiAtCXN0cnVjdCBpb3ZlYyBpb3ZbNjRdOwo+ICsJc3RydWN0IGlvdmVjICppb3YgPSB2cS0+
bG9nX2lvdjsKPiAgIAlpbnQgaSwgcmV0Owo+ICAgCj4gICAJaWYgKCF2cS0+aW90bGIpCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaCBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+
IGluZGV4IDkwMzJkM2MuLjVmZTRiNDcKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPiAr
KysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPiBAQCAtMTIzLDYgKzEyMyw3IEBAIHN0cnVjdCB2
aG9zdF92aXJ0cXVldWUgewo+ICAgCS8qIExvZyB3cml0ZSBkZXNjcmlwdG9ycyAqLwo+ICAgCXZv
aWQgX191c2VyICpsb2dfYmFzZTsKPiAgIAlzdHJ1Y3Qgdmhvc3RfbG9nICpsb2c7Cj4gKwlzdHJ1
Y3QgaW92ZWMgbG9nX2lvdls2NF07Cj4gICAKPiAgIAkvKiBSaW5nIGVuZGlhbm5lc3MuIERlZmF1
bHRzIHRvIGxlZ2FjeSBuYXRpdmUgZW5kaWFubmVzcy4KPiAgIAkgKiBTZXQgdG8gdHJ1ZSB3aGVu
IHN0YXJ0aW5nIGEgbW9kZXJuIHZpcnRpbyBkZXZpY2UuICovCgoKQWNrZWQtYnk6IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
