Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC072D093E
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 03:51:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1AA2E8766E;
	Mon,  7 Dec 2020 02:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuhikuFJLnPa; Mon,  7 Dec 2020 02:51:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F9E987669;
	Mon,  7 Dec 2020 02:51:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6820CC013B;
	Mon,  7 Dec 2020 02:51:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5312C013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 02:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D263487669
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 02:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUK77ZRm-DWW
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 02:51:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 78D2187666
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 02:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607309513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK1gkUDCVU2wXhLmdo9y4e2VFlC9AyfBMYWVi3JTuH0=;
 b=TT23swG/ZLhdn2bQM4s5FcY9hj/Qjt55Ae6s5mZdaut8q2QG3gZjoldTGVerlJXcnYvtDK
 DPOWOVuaUzpiJNHOgsUJVNJd8HNWv+Fk6FjVx0IJ8i3cliJBCzQJPYu8bO0F47S/lKHTm/
 MsF65oSC5J62Gf/PrcaKh15xboEDaa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-qTtKdB2CO4-FOUQ3lhPbRQ-1; Sun, 06 Dec 2020 21:51:51 -0500
X-MC-Unique: qTtKdB2CO4-FOUQ3lhPbRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52ECC801B12;
 Mon,  7 Dec 2020 02:51:50 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8164E5D9DC;
 Mon,  7 Dec 2020 02:51:45 +0000 (UTC)
Subject: Re: [PATCH] vdpa/mlx5: Use write memory barrier after updating CQ
 index
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20201206105719.123753-1-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dd7cde10-2e75-1bd3-68ad-f4988274b37d@redhat.com>
Date: Mon, 7 Dec 2020 10:51:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206105719.123753-1-elic@nvidia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvMTIvNiDkuIvljYg2OjU3LCBFbGkgQ29oZW4gd3JvdGU6Cj4gTWFrZSBzdXJlIHRv
IHB1dCB3cml0ZSBtZW1vcnkgYmFycmllciBhZnRlciB1cGRhdGluZyBDUSBjb25zdW1lciBpbmRl
eAo+IHNvIHRoZSBoYXJkd2FyZSBrbm93cyB0aGF0IHRoZXJlIGFyZSBhdmFpbGFibGUgQ1FFIHNs
b3RzIGluIHRoZSBxdWV1ZS4KPgo+IEZhaWx1cmUgdG8gZG8gdGhpcyBjYW4gY2F1c2UgdGhlIHVw
ZGF0ZSBvZiB0aGUgUlggZG9vcmJlbGwgcmVjb3JkIHRvIGdldAo+IHVwZGF0ZWQgYmVmb3JlIHRo
ZSBDUSBjb25zdW1lciBpbmRleCByZXN1bHRpbmcgaW4gQ1Egb3ZlcnJ1bi4KPgo+IENoYW5nZS1J
ZDogSWIwYWU0YzExOGNjZTUyNGM5ZjQ5MmIzMjU2OTE3OWYzYzFmMDRjYzEKPiBGaXhlczogMWE4
NmIzNzdhYTIxICgidmRwYS9tbHg1OiBBZGQgVkRQQSBkcml2ZXIgZm9yIHN1cHBvcnRlZCBtbHg1
IGRldmljZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEVsaSBDb2hlbiA8ZWxpY0BudmlkaWEuY29tPgo+
IC0tLQo+ICAgZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIHwgNSArKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYyBiL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3Zu
ZXQuYwo+IGluZGV4IDFmNDA4OWM2ZjlkNy4uMjk1ZjQ2ZWVhMmE1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1
L25ldC9tbHg1X3ZuZXQuYwo+IEBAIC00NzgsNiArNDc4LDExIEBAIHN0YXRpYyBpbnQgbWx4NV92
ZHBhX3BvbGxfb25lKHN0cnVjdCBtbHg1X3ZkcGFfY3EgKnZjcSkKPiAgIHN0YXRpYyB2b2lkIG1s
eDVfdmRwYV9oYW5kbGVfY29tcGxldGlvbnMoc3RydWN0IG1seDVfdmRwYV92aXJ0cXVldWUgKm12
cSwgaW50IG51bSkKPiAgIHsKPiAgIAltbHg1X2NxX3NldF9jaSgmbXZxLT5jcS5tY3EpOwo+ICsK
PiArCS8qIG1ha2Ugc3VyZSBDUSBjb3N1bWVyIHVwZGF0ZSBpcyB2aXNpYmxlIHRvIHRoZSBoYXJk
d2FyZSBiZWZvcmUgdXBkYXRpbmcKPiArCSAqIFJYIGRvb3JiZWxsIHJlY29yZC4KPiArCSAqLwo+
ICsJd21iKCk7Cj4gICAJcnhfcG9zdCgmbXZxLT52cXFwLCBudW0pOwo+ICAgCWlmIChtdnEtPmV2
ZW50X2NiLmNhbGxiYWNrKQo+ICAgCQltdnEtPmV2ZW50X2NiLmNhbGxiYWNrKG12cS0+ZXZlbnRf
Y2IucHJpdmF0ZSk7CgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
