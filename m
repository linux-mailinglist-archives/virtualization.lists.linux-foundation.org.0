Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F55263996
	for <lists.virtualization@lfdr.de>; Thu, 10 Sep 2020 03:56:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 970AD86DA1;
	Thu, 10 Sep 2020 01:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KiLPuVszFT8w; Thu, 10 Sep 2020 01:56:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 91DC586C56;
	Thu, 10 Sep 2020 01:56:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C72BC0051;
	Thu, 10 Sep 2020 01:56:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CE40C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 01:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C00087074
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 01:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sp8pJOCrfVVG
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 01:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 63AAB87068
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599702991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0C1QtHwLo5ZP+Ar8+ErpMK60qaWJInbsQRohKM7A1QA=;
 b=LUsjB9UuYzodxp7abyYPX8m1Ef4ICHzWnSxzJ1OU3GLt5qjUYDWcAPMZobiRzKkWeCFjkU
 4eClBQlpQW7j3h+z7+b/lPifRkge7XCRTwWav2cukFDwEqqp6zcFrRWiaVapbS5z7Q15Z/
 VZQmNwAfFUsUQ+0nVB9k7AcH2gjNC1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-ZMZwJTTFNGOE9gvdtSDulw-1; Wed, 09 Sep 2020 21:56:28 -0400
X-MC-Unique: ZMZwJTTFNGOE9gvdtSDulw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9D6F593B2;
 Thu, 10 Sep 2020 01:56:24 +0000 (UTC)
Received: from [10.72.13.124] (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0B3B60BF1;
 Thu, 10 Sep 2020 01:56:06 +0000 (UTC)
Subject: Re: [PATCH] vhost-vdpa: fix memory leak in error path
To: Li Qiang <liq3ea@163.com>, mst@redhat.com
References: <20200909154120.363209-1-liq3ea@163.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bfae5c35-355a-8d8a-5057-a970db24ee41@redhat.com>
Date: Thu, 10 Sep 2020 09:56:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909154120.363209-1-liq3ea@163.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, liq3ea@gmail.com, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMjAvOS85IOS4i+WNiDExOjQxLCBMaSBRaWFuZyB3cm90ZToKPiBGcmVlIHRoZSAncGFn
ZV9saXN0JyB3aGVuIHRoZSAnbnBhZ2VzJyBpcyB6ZXJvLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGkg
UWlhbmcgPGxpcTNlYUAxNjMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgfCA4
ICsrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jIGIvZHJpdmVycy92aG9z
dC92ZHBhLmMKPiBpbmRleCAzZmFiOTRmODg4OTQuLjZhOWZjYWYxODMxZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gQEAg
LTYwOSw4ICs2MDksMTAgQEAgc3RhdGljIGludCB2aG9zdF92ZHBhX3Byb2Nlc3NfaW90bGJfdXBk
YXRlKHN0cnVjdCB2aG9zdF92ZHBhICp2LAo+ICAgCQlndXBfZmxhZ3MgfD0gRk9MTF9XUklURTsK
PiAgIAo+ICAgCW5wYWdlcyA9IFBBR0VfQUxJR04obXNnLT5zaXplICsgKGlvdmEgJiB+UEFHRV9N
QVNLKSkgPj4gUEFHRV9TSElGVDsKPiAtCWlmICghbnBhZ2VzKQo+IC0JCXJldHVybiAtRUlOVkFM
Owo+ICsJaWYgKCFucGFnZXMpIHsKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJCWdvdG8gZnJlZV9w
YWdlOwo+ICsJfQo+ICAgCj4gICAJbW1hcF9yZWFkX2xvY2soZGV2LT5tbSk7Cj4gICAKPiBAQCAt
NjY2LDYgKzY2OCw4IEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9wcm9jZXNzX2lvdGxiX3VwZGF0
ZShzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwKPiAgIAkJYXRvbWljNjRfc3ViKG5wYWdlcywgJmRldi0+
bW0tPnBpbm5lZF92bSk7Cj4gICAJfQo+ICAgCW1tYXBfcmVhZF91bmxvY2soZGV2LT5tbSk7Cj4g
Kwo+ICtmcmVlX3BhZ2U6Cj4gICAJZnJlZV9wYWdlKCh1bnNpZ25lZCBsb25nKXBhZ2VfbGlzdCk7
Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0KCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwoKQWNr
ZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
