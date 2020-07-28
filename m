Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C64230454
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 09:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8763E869B8;
	Tue, 28 Jul 2020 07:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91YxHhq45laM; Tue, 28 Jul 2020 07:42:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8737F8698D;
	Tue, 28 Jul 2020 07:42:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FE86C004D;
	Tue, 28 Jul 2020 07:42:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1EB9C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C43487E65
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qP7ZvoFPyyi7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:42:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7DDBD87DAA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595922153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtbfdviuzmJuORt1hYZ3533gUnFhPHnrFXSr+c808HM=;
 b=gWbUOajHJMDd0lB2GpKLtBR3YAxisNYgRsXa3uizVTIqqsBYsg3akbnRVjmuBT8GozrO7V
 xlmHe3koTP8yp6VcKmAng+hd70im+AvzuGbsluj4C2qOXmQjPBRyTeIEPJckh7hFzUKPdr
 qYuyiOPzquLhQqcl/7qOKZYUManGuuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-bpRnA74JNyuGR9WtoRE1iw-1; Tue, 28 Jul 2020 03:42:28 -0400
X-MC-Unique: bpRnA74JNyuGR9WtoRE1iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21446100960F;
 Tue, 28 Jul 2020 07:42:27 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE395712C2;
 Tue, 28 Jul 2020 07:42:22 +0000 (UTC)
Subject: Re: [PATCH V4 3/6] vDPA: add get_vq_irq() in vdpa_config_ops
To: Zhu Lingshan <lingshan.zhu@intel.com>, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, sean.j.christopherson@intel.com,
 wanpengli@tencent.com
References: <20200728042405.17579-1-lingshan.zhu@intel.com>
 <20200728042405.17579-4-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <110786e5-4b0c-f745-a038-174f2d45cf6a@redhat.com>
Date: Tue, 28 Jul 2020 15:42:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728042405.17579-4-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: shahafs@mellanox.com, parav@mellanox.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eli@mellanox.com
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

Ck9uIDIwMjAvNy8yOCDkuIvljYgxMjoyNCwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IFRoaXMgY29t
bWl0IGFkZHMgYSBuZXcgZnVuY3Rpb24gZ2V0X3ZxX2lycSgpIGluIHN0cnVjdAo+IHZkcGFfY29u
ZmlnX29wcywgd2hpY2ggd2lsbCByZXR1cm4gdGhlIGlycSBudW1iZXIgb2YgYQo+IHZpcnRxdWV1
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNv
bT4KPiBTdWdnZXN0ZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gLS0t
Cj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCB8IDYgKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92ZHBhLmggYi9p
bmNsdWRlL2xpbnV4L3ZkcGEuaAo+IGluZGV4IDIzOWRiNzk0MzU3Yy4uY2ViYzc5MTczYWFhIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvdmRwYS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC92
ZHBhLmgKPiBAQCAtODcsNiArODcsMTEgQEAgc3RydWN0IHZkcGFfZGV2aWNlIHsKPiAgICAqCQkJ
CUB2ZGV2OiB2ZHBhIGRldmljZQo+ICAgICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4Cj4gICAg
KgkJCQlSZXR1cm5zIHRoZSBub3RpZmNhdGlvbiBhcmVhCj4gKyAqIEBnZXRfdnFfaXJxOgkJCUdl
dCB0aGUgaXJxIG51bWJlciBvZiBhIHZpcnRxdWV1ZQo+ICsgKgkJCQlAdmRldjogdmRwYSBkZXZp
Y2UKPiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4Cj4gKyAqCQkJCVJldHVybnMgdTMyOiBp
cnEgbnVtYmVyIG9mIGEgdmlydHF1ZXVlLAo+ICsgKgkJCQktRUlOVkFMIGlmIG5vIGlycSBhc3Np
Z25lZC4KCgpJIHRoaW5rIHdlIGNhbiBub3QgZ2V0IC1FSU5WQUwgc2luY2UgdGhlIGZ1bmN0aW9u
IHdpbGwgcmV0dXJuIGEgdTMyLgoKVGhhbmtzCgoKPiAgICAqIEBnZXRfdnFfYWxpZ246CQlHZXQg
dGhlIHZpcnRxdWV1ZSBhbGlnbiByZXF1aXJlbWVudAo+ICAgICoJCQkJZm9yIHRoZSBkZXZpY2UK
PiAgICAqCQkJCUB2ZGV2OiB2ZHBhIGRldmljZQo+IEBAIC0xNzgsNiArMTgzLDcgQEAgc3RydWN0
IHZkcGFfY29uZmlnX29wcyB7Cj4gICAJdTY0ICgqZ2V0X3ZxX3N0YXRlKShzdHJ1Y3QgdmRwYV9k
ZXZpY2UgKnZkZXYsIHUxNiBpZHgpOwo+ICAgCXN0cnVjdCB2ZHBhX25vdGlmaWNhdGlvbl9hcmVh
Cj4gICAJKCpnZXRfdnFfbm90aWZpY2F0aW9uKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHUx
NiBpZHgpOwo+ICsJdTMyICgqZ2V0X3ZxX2lycSkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHYsIHUx
NiBpZHgpOwo+ICAgCj4gICAJLyogRGV2aWNlIG9wcyAqLwo+ICAgCXUzMiAoKmdldF92cV9hbGln
bikoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
