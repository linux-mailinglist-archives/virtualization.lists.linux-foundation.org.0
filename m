Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD915511C
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 04:38:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 917F4862D4;
	Fri,  7 Feb 2020 03:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SR0AJq5qIU7; Fri,  7 Feb 2020 03:38:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3453386277;
	Fri,  7 Feb 2020 03:38:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E89CC013E;
	Fri,  7 Feb 2020 03:38:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99AAEC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87A8D2040F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOUzDfcwUWFm
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:38:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A0552036D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581046716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3Qcvm/Sy3qQWlT2RBAuTJM+EqKL92nFComMce7p/ho=;
 b=TUqviYSXADZXOIMkhfZk9kJGtkozB/fE6yvkVoIrFCDtz4Q/OFb4feE/dxkXCMWeeMH5bw
 iW8RWXScl1wGemHSGjdJP6EpFMby8qxwEXqz6TATyelcqdqw+zR6K3sPqds5nw2qSCxQWM
 eRpDru65rGiOceva6NzUHHR+8tRGpJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-6YLNfqkvMBWf41eIHZ9zzQ-1; Thu, 06 Feb 2020 22:38:32 -0500
X-MC-Unique: 6YLNfqkvMBWf41eIHZ9zzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AEBB10054E3;
 Fri,  7 Feb 2020 03:38:31 +0000 (UTC)
Received: from [10.72.13.183] (ovpn-13-183.pek2.redhat.com [10.72.13.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5148C100194E;
 Fri,  7 Feb 2020 03:38:26 +0000 (UTC)
Subject: Re: [PATCH] tools/virtio: option to build an out of tree module
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200206080125.1178242-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d4581772-8314-e746-dbea-2603e0447cdd@redhat.com>
Date: Fri, 7 Feb 2020 11:38:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200206080125.1178242-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMi82IOS4i+WNiDQ6MDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBIYW5k
eSBmb3IgdGVzdGluZyB3aXRoIGRpc3RybyBrZXJuZWxzLgo+IFdhcm4gdGhhdCB0aGUgcmVzdWx0
aW5nIG1vZHVsZSBpcyBjb21wbGV0ZWx5IHVuc3VwcG9ydGVkLAo+IGFuZCBpc24ndCBpbnRlbmRl
ZCBmb3IgcHJvZHVjdGlvbiB1c2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJr
aW4gPG1zdEByZWRoYXQuY29tPgo+IC0tLQo+ICAgdG9vbHMvdmlydGlvL01ha2VmaWxlIHwgMTMg
KysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy92aXJ0aW8vTWFrZWZpbGUgYi90b29scy92
aXJ0aW8vTWFrZWZpbGUKPiBpbmRleCA4ZTJhOTA4MTE1YzIuLjk0MTA2Y2RlNDllMyAxMDA2NDQK
PiAtLS0gYS90b29scy92aXJ0aW8vTWFrZWZpbGUKPiArKysgYi90b29scy92aXJ0aW8vTWFrZWZp
bGUKPiBAQCAtOCw3ICs4LDE4IEBAIENGTEFHUyArPSAtZyAtTzIgLVdlcnJvciAtV2FsbCAtSS4g
LUkuLi9pbmNsdWRlLyAtSSAuLi8uLi91c3IvaW5jbHVkZS8gLVduby1wb2luCj4gICB2cGF0aCAl
LmMgLi4vLi4vZHJpdmVycy92aXJ0aW8gLi4vLi4vZHJpdmVycy92aG9zdAo+ICAgbW9kOgo+ICAg
CSR7TUFLRX0gLUMgYHB3ZGAvLi4vLi4gTT1gcHdkYC92aG9zdF90ZXN0IFY9JHtWfQo+IC0uUEhP
Tlk6IGFsbCB0ZXN0IG1vZCBjbGVhbgo+ICsKPiArI29vdDogYnVpbGQgdmhvc3QgYXMgYW4gb3V0
IG9mIHRyZWUgbW9kdWxlIGZvciBhIGRpc3RybyBrZXJuZWwKPiArI25vIGVmZm9ydCBpcyB0YWtl
biB0byBtYWtlIGl0IGFjdHVhbGx5IGJ1aWxkIG9yIHdvcmssIGJ1dCB0ZW5kcyB0byBtb3N0bHkg
d29yawo+ICsjaWYgdGhlIGRpc3RybyBrZXJuZWwgaXMgdmVyeSBjbG9zZSB0byB1cHN0cmVhbQo+
ICsjdW5zdXBwb3J0ZWQhIHRoaXMgaXMgYSBkZXZlbG9wbWVudCB0b29sIG9ubHksIGRvbid0IHVz
ZSB0aGUKPiArI3Jlc3VsdGluZyBtb2R1bGVzIGluIHByb2R1Y3Rpb24hCj4gK29vdDoKPiArCWVj
aG8gIlVOU1VQUE9SVEVEISBEb24ndCB1c2UgdGhlIHJlc3VsdGluZyBtb2R1bGVzIGluIHByb2R1
Y3Rpb24hIgo+ICsJS0NGTEFHUz0iLUkgImBwd2RgLy4uLy4uL2RyaXZlcnMvdmhvc3QgJHtNQUtF
fSAtQyAvdXNyL3NyYy9rZXJuZWxzLyQkKHVuYW1lIC1yKSBNPWBwd2RgL3Zob3N0X3Rlc3QgVj0k
e1Z9Cj4gKwlLQ0ZMQUdTPSItSSAiYHB3ZGAvLi4vLi4vZHJpdmVycy92aG9zdCAke01BS0V9IC1D
IC91c3Ivc3JjL2tlcm5lbHMvJCQodW5hbWUgLXIpIE09YHB3ZGAvLi4vLi4vZHJpdmVycy92aG9z
dCBWPSR7Vn0gQ09ORklHX1ZIT1NUX1ZTT0NLPW4KCgpBbnkgcmVhc29uIGZvciBkaXNhYmxpbmcg
dnNvY2sgaGVyZT8KClRoYW5rcwoKCj4gKwo+ICsuUEhPTlk6IGFsbCB0ZXN0IG1vZCBjbGVhbiB2
aG9zdCBvb3QKPiAgIGNsZWFuOgo+ICAgCSR7Uk19ICoubyB2cmluZ2hfdGVzdCB2aXJ0aW9fdGVz
dCB2aG9zdF90ZXN0LyoubyB2aG9zdF90ZXN0Ly4qLmNtZCBcCj4gICAgICAgICAgICAgICAgIHZo
b3N0X3Rlc3QvTW9kdWxlLnN5bXZlcnMgdmhvc3RfdGVzdC9tb2R1bGVzLm9yZGVyICouZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
