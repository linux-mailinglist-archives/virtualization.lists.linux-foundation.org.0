Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5BB1571DA
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 10:38:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0B8B585116;
	Mon, 10 Feb 2020 09:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTDnFGXwBJbK; Mon, 10 Feb 2020 09:38:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D8E084D41;
	Mon, 10 Feb 2020 09:38:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8322CC18DD;
	Mon, 10 Feb 2020 09:38:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17AC4C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 06C93846BF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6+tZZDmiY4c
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E40008444E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581327499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zC1wxKXo1uidgu4KRoB+bUUgf/UV+X7/Kq+jTW6HCAc=;
 b=Xqy7M9gW8jA3Ty9LhorOwi3pnQZ1/78jin6a2nWncRL2NYcdG9QoWisp1aX108XBUqTtI4
 iFRtblFeA4j6DaAOrFcoDwwcYOjT9Vq+0lwgMZyFdGxwzgKKwo+/jDS1KWiHcOsAkg6UN9
 UBcXA474luncNdeSAt7tuYOeAWN0zDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-3jrNtrgbN0OUaoHHbYFikA-1; Mon, 10 Feb 2020 04:38:17 -0500
X-MC-Unique: 3jrNtrgbN0OUaoHHbYFikA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9069818AB2C0;
 Mon, 10 Feb 2020 09:38:16 +0000 (UTC)
Received: from [10.36.117.242] (ovpn-117-242.ams2.redhat.com [10.36.117.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D831591820;
 Mon, 10 Feb 2020 09:38:12 +0000 (UTC)
Subject: Re: [PATCH] virtio_balloon: Fix unused label warning
To: Borislav Petkov <bp@alien8.de>, virtualization@lists.linux-foundation.org
References: <20200210093328.15349-1-bp@alien8.de>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <c6ee9611-745b-0292-9fde-c037d2e407a9@redhat.com>
Date: Mon, 10 Feb 2020 10:38:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210093328.15349-1-bp@alien8.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: LKML <linux-kernel@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMTAuMDIuMjAgMTA6MzMsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToKPiBGcm9tOiBCb3Jpc2xh
diBQZXRrb3YgPGJwQHN1c2UuZGU+Cj4gCj4gRml4Cj4gCj4gICBkcml2ZXJzL3ZpcnRpby92aXJ0
aW9fYmFsbG9vbi5jOiBJbiBmdW5jdGlvbiDigJh2aXJ0YmFsbG9vbl9wcm9iZeKAmToKPiAgIGRy
aXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmM6OTYzOjE6IHdhcm5pbmc6IGxhYmVsIOKAmG91
dF9kZWxfdnFz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1sYWJlbF0KPiAgICAg
OTYzIHwgb3V0X2RlbF92cXM6Cj4gICAgICAgICB8IF5+Cj4gCj4gVGhlIENPTkZJR19CQUxMT09O
X0NPTVBBQ1RJT04gaWZkZWZmZXJ5IHNob3VsZCBlbmNsb3NlIGl0IHRvby4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBCb3Jpc2xhdiBQZXRrb3YgPGJwQHN1c2UuZGU+Cj4gQ2M6IERhdmlkIEhpbGRlbmJy
YW5kIDxkYXZpZEByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFs
bG9vbi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYyBi
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMKPiBpbmRleCA3YmZlMzY1ZDkzNzIuLmI2
ZWQ1ZjhiY2NiMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5j
Cj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+IEBAIC05NTksOSArOTU5
LDkgQEAgc3RhdGljIGludCB2aXJ0YmFsbG9vbl9wcm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAq
dmRldikKPiAgCWlwdXQodmItPnZiX2Rldl9pbmZvLmlub2RlKTsKPiAgb3V0X2tlcm5fdW5tb3Vu
dDoKPiAgCWtlcm5fdW5tb3VudChiYWxsb29uX21udCk7Cj4gLSNlbmRpZgo+ICBvdXRfZGVsX3Zx
czoKPiAgCXZkZXYtPmNvbmZpZy0+ZGVsX3Zxcyh2ZGV2KTsKPiArI2VuZGlmCj4gIG91dF9mcmVl
X3ZiOgo+ICAJa2ZyZWUodmIpOwo+ICBvdXQ6Cj4gCgpPaCwgcmlnaHQsIHRoYW5rcyEKClJldmll
d2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KCi0tIApUaGFua3Ms
CgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
