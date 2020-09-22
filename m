Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721827383F
	for <lists.virtualization@lfdr.de>; Tue, 22 Sep 2020 03:59:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ECB5F2152E;
	Tue, 22 Sep 2020 01:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WADZdv8bL7qm; Tue, 22 Sep 2020 01:58:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E48292079A;
	Tue, 22 Sep 2020 01:58:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2AABC0051;
	Tue, 22 Sep 2020 01:58:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BDEFC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 01:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFC87214F6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 01:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pqCbkniHI8B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 01:58:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D37AC2079A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 01:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600739933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zreSqKSTNRDAh7fOPqLlhi7nKX6J3ywk4wzexdlKViI=;
 b=R8l5gmwtUzP7+PS9OnxgIJcOPZgxcjDJSdMlj6vnC6SbozJVXjm9KIbec6rXziNsKJI146
 e2v1w5Pxc+6LvyzhRHfWcQCzofh+XbsbNyU9WRJL8pZ/IQ5DsbkLUaaHJLe4LzHQpUOhDO
 Klg0/uhr/xulj0u7+me2U+fys5EhrTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-pnhuC_u2Pzum7jft6brYzw-1; Mon, 21 Sep 2020 21:58:49 -0400
X-MC-Unique: pnhuC_u2Pzum7jft6brYzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C3DF1868402;
 Tue, 22 Sep 2020 01:58:48 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D85187366D;
 Tue, 22 Sep 2020 01:58:39 +0000 (UTC)
Subject: Re: [PATCH 1/8] vhost vdpa: fix vhost_vdpa_open error handling
To: Mike Christie <michael.christie@oracle.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, mst@redhat.com,
 pbonzini@redhat.com, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org
References: <1600712588-9514-1-git-send-email-michael.christie@oracle.com>
 <1600712588-9514-2-git-send-email-michael.christie@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e857cdd5-f1f6-0227-282d-3d4e690a60d6@redhat.com>
Date: Tue, 22 Sep 2020 09:58:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600712588-9514-2-git-send-email-michael.christie@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvOS8yMiDkuIrljYgyOjIzLCBNaWtlIENocmlzdGllIHdyb3RlOgo+IFdlIG11c3Qg
ZnJlZSB0aGUgdnFzIGFycmF5IGluIHRoZSBvcGVuIGZhaWx1cmUgcGF0aCwgYmVjYXVzZQo+IHZo
b3N0X3ZkcGFfcmVsZWFzZSB3aWxsIG5vdCBiZSBjYWxsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBN
aWtlIENocmlzdGllIDxtaWNoYWVsLmNocmlzdGllQG9yYWNsZS5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL3Zob3N0L3ZkcGEuYyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3Zk
cGEuYwo+IGluZGV4IDNmYWI5NGYuLjMzMDEyMTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9z
dC92ZHBhLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IEBAIC04MDgsNiArODA4LDcg
QEAgc3RhdGljIGludCB2aG9zdF92ZHBhX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0
IGZpbGUgKmZpbGVwKQo+ICAgCj4gICBlcnJfaW5pdF9pb3RsYjoKPiAgIAl2aG9zdF9kZXZfY2xl
YW51cCgmdi0+dmRldik7Cj4gKwlrZnJlZSh2cXMpOwo+ICAgZXJyOgo+ICAgCWF0b21pY19kZWMo
JnYtPm9wZW5lZCk7Cj4gICAJcmV0dXJuIHI7CgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
