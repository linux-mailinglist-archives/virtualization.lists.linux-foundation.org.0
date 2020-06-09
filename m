Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8F1F339F
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 07:53:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4560621F76;
	Tue,  9 Jun 2020 05:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Lz+CzwjQOtr; Tue,  9 Jun 2020 05:53:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34599207A8;
	Tue,  9 Jun 2020 05:53:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0037DC016F;
	Tue,  9 Jun 2020 05:53:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 380A9C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2014D86D19
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANZbZ-X_CARp
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:53:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BEF6086D15
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591682000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/2A/WU2/svppr3uz/G5VVDxLgqlNP79/92mX4BoUzs=;
 b=HAu5QEAEvAWi4nMb8Joq/26yUQTPIu4p/wpROhFnMgrqY/wN+kwtHMb/sGl+0lUBSvydar
 lzj3z6tE7FM4zPZBxDg6yX7xjvv0UPcksXJNqpU7pY4CFlbC+SL7aHLulPKjt89G15/6Lk
 wFqJw7vXAK2OoZALY7lvD51sYrbmYT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-7lBnAItnOB6WES0WKXa7sA-1; Tue, 09 Jun 2020 01:53:16 -0400
X-MC-Unique: 7lBnAItnOB6WES0WKXa7sA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E871005510;
 Tue,  9 Jun 2020 05:53:15 +0000 (UTC)
Received: from [10.72.12.252] (ovpn-12-252.pek2.redhat.com [10.72.12.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E327510013D6;
 Tue,  9 Jun 2020 05:53:05 +0000 (UTC)
Subject: Re: [PATCH] vhost/test: fix up after API change
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200608124254.727184-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e747a953-3135-fef9-b098-fca11755d6e4@redhat.com>
Date: Tue, 9 Jun 2020 13:53:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608124254.727184-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, Zhu Lingshan <lingshan.zhu@intel.com>,
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

Ck9uIDIwMjAvNi84IOS4i+WNiDg6NDIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBQYXNz
IGEgZmxhZyB0byByZXF1ZXN0IGtlcm5lbCB0aHJlYWQgdXNlLgo+Cj4gRml4ZXM6IDAxZmNiMWNi
Yzg4ZSAoInZob3N0OiBhbGxvdyBkZXZpY2UgdGhhdCBkb2VzIG5vdCBkZXBlbmQgb24gdmhvc3Qg
d29ya2VyIikKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy92aG9zdC90ZXN0LmMgfCAyICstCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3Zob3N0L3Rlc3QuYyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5jCj4gaW5kZXggZjU1Y2I1ODRi
ODRhLi4xMjMwNGViOGRhMTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC90ZXN0LmMKPiAr
KysgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+IEBAIC0xMjIsNyArMTIyLDcgQEAgc3RhdGljIGlu
dCB2aG9zdF90ZXN0X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmYpCj4g
ICAJdnFzW1ZIT1NUX1RFU1RfVlFdID0gJm4tPnZxc1tWSE9TVF9URVNUX1ZRXTsKPiAgIAluLT52
cXNbVkhPU1RfVEVTVF9WUV0uaGFuZGxlX2tpY2sgPSBoYW5kbGVfdnFfa2ljazsKPiAgIAl2aG9z
dF9kZXZfaW5pdChkZXYsIHZxcywgVkhPU1RfVEVTVF9WUV9NQVgsIFVJT19NQVhJT1YgKyA2NCwK
PiAtCQkgICAgICAgVkhPU1RfVEVTVF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdIVCwgTlVM
TCk7Cj4gKwkJICAgICAgIFZIT1NUX1RFU1RfUEtUX1dFSUdIVCwgVkhPU1RfVEVTVF9XRUlHSFQs
IHRydWUsIE5VTEwpOwo+ICAgCj4gICAJZi0+cHJpdmF0ZV9kYXRhID0gbjsKPiAgIAoKCkFja2Vk
LWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKSnVzdCB0byBjb25maXJtLCBo
YXZlIHlvdSBxdWV1ZWQgdGhlIGRvb3JiZWxsIG1hcHBpbmcgcGF0Y2hlcyBhbHJlYWR5PyAKT3Ig
eW91IGV4cGVjdCBJIHNxdWFzaCB0aGlzIGludG8gdjIgb2YgZG9vcmJlbGwgbWFwcGluZyBzZXJp
ZXM/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
