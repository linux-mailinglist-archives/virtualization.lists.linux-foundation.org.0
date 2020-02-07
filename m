Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CB15510A
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 04:37:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFC9786822;
	Fri,  7 Feb 2020 03:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2gaZOPjseL5; Fri,  7 Feb 2020 03:37:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 05C9B8696A;
	Fri,  7 Feb 2020 03:37:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8EF4C013E;
	Fri,  7 Feb 2020 03:37:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA65C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 23BA287C88
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fX10RB2NQmId
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:37:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 632EA87C7D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581046668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/nMtXSXwUKQmIwf5ajaCDX1OBTlUcvNzOolgf7JA/W4=;
 b=cLOdLL/t+ogBOGtSUj3d2N+3BgB5U2PSA1twuNg0T0+mZnP+eDaYfQCxOicUUphpWpKFql
 eC7f8wMuo5PL9O4Fpa7oETxLfHxmskRcmI2x5ezuHLFPXHD2ja06GBMZX5200vNd/Hh+kp
 TRwPIxHvk7oR+f+VreXQaUGXbCTKj4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-oT27ycCXPZ-X0TopriGtWQ-1; Thu, 06 Feb 2020 22:37:47 -0500
X-MC-Unique: oT27ycCXPZ-X0TopriGtWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF7DA18B9FC1;
 Fri,  7 Feb 2020 03:37:45 +0000 (UTC)
Received: from [10.72.13.183] (ovpn-13-183.pek2.redhat.com [10.72.13.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 384A05C3FD;
 Fri,  7 Feb 2020 03:37:38 +0000 (UTC)
Subject: Re: [PATCH] virtio_balloon: prevent pfn array overflow
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200206074644.1177551-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <461dc5d5-4635-7b44-49bf-49422295e873@redhat.com>
Date: Fri, 7 Feb 2020 11:37:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200206074644.1177551-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-mm@kvack.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMi82IOS4i+WNiDM6NDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBNYWtl
IHN1cmUsIGF0IGJ1aWxkIHRpbWUsIHRoYXQgcGZuIGFycmF5IGlzIGJpZyBlbm91Z2ggdG8gaG9s
ZCBhIHNpbmdsZQo+IHBhZ2UuICBJdCBoYXBwZW5zIHRvIGJlIHRydWUgc2luY2UgdGhlIFBBR0Vf
U0hJRlQgdmFsdWUgYXQgdGhlIG1vbWVudCBpcwo+IDIwLCB3aGljaCBpcyAxTSAtIGV4YWN0bHkg
MjU2IDRLIGJhbGxvb24gcGFnZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJr
aW4gPG1zdEByZWRoYXQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxv
b24uYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jIGIvZHJpdmVycy92aXJ0aW8v
dmlydGlvX2JhbGxvb24uYwo+IGluZGV4IDhlNDAwZWNlOTI3My4uMjQ1N2M1NGI2MTg1IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMKPiArKysgYi9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jCj4gQEAgLTE1OCw2ICsxNTgsOCBAQCBzdGF0aWMgdm9p
ZCBzZXRfcGFnZV9wZm5zKHN0cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIsCj4gICB7Cj4gICAJdW5z
aWduZWQgaW50IGk7Cj4gICAKPiArCUJVSUxEX0JVR19PTihWSVJUSU9fQkFMTE9PTl9QQUdFU19Q
RVJfUEFHRSA+IFZJUlRJT19CQUxMT09OX0FSUkFZX1BGTlNfTUFYKTsKPiArCj4gICAJLyoKPiAg
IAkgKiBTZXQgYmFsbG9vbiBwZm5zIHBvaW50aW5nIGF0IHRoaXMgcGFnZS4KPiAgIAkgKiBOb3Rl
IHRoYXQgdGhlIGZpcnN0IHBmbiBwb2ludHMgYXQgc3RhcnQgb2YgdGhlIHBhZ2UuCgoKQWNrZWQt
Ynk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
