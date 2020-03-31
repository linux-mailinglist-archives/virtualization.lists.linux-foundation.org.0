Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA02198A03
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 04:36:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CD488836B;
	Tue, 31 Mar 2020 02:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xN0joFwBLXvp; Tue, 31 Mar 2020 02:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A463188367;
	Tue, 31 Mar 2020 02:36:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 856AEC07FF;
	Tue, 31 Mar 2020 02:36:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D3BAC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 381B724A5C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M58wTwjFUctj
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by silver.osuosl.org (Postfix) with ESMTPS id 423B520027
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585622171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nhe1R9fcd9sn8sBUTkjUECHmGPeTRwWPtrkYv9HeUA4=;
 b=cptWrn+cGBELuAIkrgUXdDX/JkSnhvMTYzJQQOgWfXxEQDDTn6D0Gcdni1KDcGZnhe1gPQ
 am9UnVqxE9i9Oj+x8mb108AyaSrJIKlDgHwyZ/x3PPZpYQmEUgq1dr9D7ywft8/fQu1SGj
 W0s0UzsHcuGhquRm7UIEQTFpOicNahM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-htrLS0PsNj2cJicau63YfA-1; Mon, 30 Mar 2020 22:36:09 -0400
X-MC-Unique: htrLS0PsNj2cJicau63YfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E29BA800D5B;
 Tue, 31 Mar 2020 02:36:07 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82F3F5C1C5;
 Tue, 31 Mar 2020 02:35:58 +0000 (UTC)
Subject: Re: [PATCH] vhost: vdpa: remove unnecessary null check
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Tiwei Bie <tiwei.bie@intel.com>,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
References: <20200330235040.GA9997@embeddedor>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <32ae2f4c-de7c-050b-85a2-489b6813fd5f@redhat.com>
Date: Tue, 31 Mar 2020 10:35:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200330235040.GA9997@embeddedor>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Ck9uIDIwMjAvMy8zMSDkuIrljYg3OjUwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IGNv
bnRhaW5lcl9vZiBpcyBuZXZlciBudWxsLCBzbyB0aGlzIG51bGwgY2hlY2sgaXMKPiB1bm5lY2Vz
c2FyeS4KPgo+IEFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTQ5MjAwNiAoIkxvZ2ljYWxseSBkZWFk
IGNvZGUiKQo+IEZpeGVzOiAyMDQ1M2E0NWZiMDYgKCJ2aG9zdDogaW50cm9kdWNlIHZEUEEtYmFz
ZWQgYmFja2VuZCIpCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2
b0BlbWJlZGRlZG9yLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3QvdmRwYS5jIHwgMiAtLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aG9zdC92ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IGluZGV4IDQyMWYwMmE4NTMw
YS4uM2QyY2I4MTE3NTdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gKysr
IGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPiBAQCAtNjc4LDggKzY3OCw2IEBAIHN0YXRpYyBpbnQg
dmhvc3RfdmRwYV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkK
PiAgIAlpbnQgbnZxcywgaSwgciwgb3BlbmVkOwo+ICAgCj4gICAJdiA9IGNvbnRhaW5lcl9vZihp
bm9kZS0+aV9jZGV2LCBzdHJ1Y3Qgdmhvc3RfdmRwYSwgY2Rldik7Cj4gLQlpZiAoIXYpCj4gLQkJ
cmV0dXJuIC1FTk9ERVY7Cj4gICAKPiAgIAlvcGVuZWQgPSBhdG9taWNfY21weGNoZygmdi0+b3Bl
bmVkLCAwLCAxKTsKPiAgIAlpZiAob3BlbmVkKQoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
