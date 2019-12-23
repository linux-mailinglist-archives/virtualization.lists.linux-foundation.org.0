Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F73129339
	for <lists.virtualization@lfdr.de>; Mon, 23 Dec 2019 09:43:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3571E86138;
	Mon, 23 Dec 2019 08:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8QaY2M0RlvO; Mon, 23 Dec 2019 08:43:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 701A086005;
	Mon, 23 Dec 2019 08:43:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40F8EC1D82;
	Mon, 23 Dec 2019 08:43:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43B60C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 08:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 313A48543A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 08:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25NEVikGEv65
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 08:43:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3945B85FC4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 08:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577090632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9Vt9aITJ0g63smVGvQqe7KZcDWn2ziP1vtUVkzcCrA=;
 b=RzK9jbTzI4ZNHbGUoYBVf0xGbdWEyaJjXjod77IF0bORsEHbjtBexDaia9hqvNdGQV466+
 vpKx1STt53Rp1z9HpGJfhs8yyOwbVF1GPuYqUkim4BqL2VfB9tb+IF3SI3huBo1WshkGBW
 UJjxSeA6gqFcG6RjIaLvauLkuYb1dHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-9fNGjymUPNqPkYBGt7BNAA-1; Mon, 23 Dec 2019 03:43:48 -0500
X-MC-Unique: 9fNGjymUPNqPkYBGt7BNAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF614800D41;
 Mon, 23 Dec 2019 08:43:46 +0000 (UTC)
Received: from [10.72.12.41] (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 301065D9D6;
 Mon, 23 Dec 2019 08:43:42 +0000 (UTC)
Subject: Re: [PATCH] virtio-mmio: convert to devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>, mst@redhat.com
References: <20191222190839.4863-1-tiny.windzz@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <209a1d81-00f7-ab22-ccca-36c1a014b345@redhat.com>
Date: Mon, 23 Dec 2019 16:43:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191222190839.4863-1-tiny.windzz@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvMTIvMjMg5LiK5Y2IMzowOCwgWWFuZ3RhbyBMaSB3cm90ZToKPiBVc2UgZGV2bV9w
bGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgdG8gc2ltcGxpZnkgY29kZSwgd2hpY2gKPiBjb250
YWlucyBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UsIGRldm1fcmVxdWVzdF9tZW1fcmVnaW9uIGFuZAo+
IGRldm1faW9yZW1hcC4KPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPHRpbnkud2luZHp6
QGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMgfCAxNSAr
KystLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMg
Yi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5jCj4gaW5kZXggZTA5ZWRiNWM1ZTA2Li45N2Q1
NzI1ZmQ5YTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uYwo+ICsr
KyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiBAQCAtNTMxLDE4ICs1MzEsOSBAQCBz
dGF0aWMgdm9pZCB2aXJ0aW9fbW1pb19yZWxlYXNlX2RldihzdHJ1Y3QgZGV2aWNlICpfZCkKPiAg
IHN0YXRpYyBpbnQgdmlydGlvX21taW9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgIHsKPiAgIAlzdHJ1Y3QgdmlydGlvX21taW9fZGV2aWNlICp2bV9kZXY7Cj4gLQlzdHJ1
Y3QgcmVzb3VyY2UgKm1lbTsKPiAgIAl1bnNpZ25lZCBsb25nIG1hZ2ljOwo+ICAgCWludCByYzsK
PiAgIAo+IC0JbWVtID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVN
LCAwKTsKPiAtCWlmICghbWVtKQo+IC0JCXJldHVybiAtRUlOVkFMOwo+IC0KPiAtCWlmICghZGV2
bV9yZXF1ZXN0X21lbV9yZWdpb24oJnBkZXYtPmRldiwgbWVtLT5zdGFydCwKPiAtCQkJcmVzb3Vy
Y2Vfc2l6ZShtZW0pLCBwZGV2LT5uYW1lKSkKPiAtCQlyZXR1cm4gLUVCVVNZOwo+IC0KPiAgIAl2
bV9kZXYgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCp2bV9kZXYpLCBHRlBfS0VS
TkVMKTsKPiAgIAlpZiAoIXZtX2RldikKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gQEAgLTU1NCw5
ICs1NDUsOSBAQCBzdGF0aWMgaW50IHZpcnRpb19tbWlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gICAJSU5JVF9MSVNUX0hFQUQoJnZtX2Rldi0+dmlydHF1ZXVlcyk7Cj4g
ICAJc3Bpbl9sb2NrX2luaXQoJnZtX2Rldi0+bG9jayk7Cj4gICAKPiAtCXZtX2Rldi0+YmFzZSA9
IGRldm1faW9yZW1hcCgmcGRldi0+ZGV2LCBtZW0tPnN0YXJ0LCByZXNvdXJjZV9zaXplKG1lbSkp
Owo+IC0JaWYgKHZtX2Rldi0+YmFzZSA9PSBOVUxMKQo+IC0JCXJldHVybiAtRUZBVUxUOwo+ICsJ
dm1fZGV2LT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+
ICsJaWYgKElTX0VSUih2bV9kZXYtPmJhc2UpKQo+ICsJCXJldHVybiBQVFJfRVJSKHZtX2Rldi0+
YmFzZSk7Cj4gICAKPiAgIAkvKiBDaGVjayBtYWdpYyB2YWx1ZSAqLwo+ICAgCW1hZ2ljID0gcmVh
ZGwodm1fZGV2LT5iYXNlICsgVklSVElPX01NSU9fTUFHSUNfVkFMVUUpOwoKCkFja2VkLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
