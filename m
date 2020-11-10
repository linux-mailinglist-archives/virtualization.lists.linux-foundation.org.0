Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BED2AD050
	for <lists.virtualization@lfdr.de>; Tue, 10 Nov 2020 08:21:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D945320457;
	Tue, 10 Nov 2020 07:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWsqrA73WBAO; Tue, 10 Nov 2020 07:21:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5C06B2044F;
	Tue, 10 Nov 2020 07:21:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39B04C016F;
	Tue, 10 Nov 2020 07:21:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5441C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 07:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BBC502044F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 07:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRxbY5w+gUS3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 07:20:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 7455F2042B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604992857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QOTDZeraTDO7qssTdQxdHgHxw/ERqq7xNQOpRhF6WU=;
 b=T0OF0AKqc+Fd/wVH4HoJ5r8hM/++/XjLGurRV0gwh9T5Y64VNv6IQv3OeOfCoqkpj6q7Cx
 CLFMhJFtEbPWSRX80+4MG3MT46FIDdZrsOOETy4lNrC4p47A29n/l3epehYf/OjPvNNyqm
 wnGI8iKo6xyR4WD0H0Sns+eVu9afHDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-Uf3eP6YrNEmVx5Vilrz5FQ-1; Tue, 10 Nov 2020 02:20:56 -0500
X-MC-Unique: Uf3eP6YrNEmVx5Vilrz5FQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D22771E5CA0;
 Tue, 10 Nov 2020 07:20:46 +0000 (UTC)
Received: from [10.72.13.94] (ovpn-13-94.pek2.redhat.com [10.72.13.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 945B376666;
 Tue, 10 Nov 2020 07:20:44 +0000 (UTC)
Subject: Re: [PATCH 1/5] vhost: add helper to check if a vq has been setup
To: Mike Christie <michael.christie@oracle.com>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, mst@redhat.com, pbonzini@redhat.com,
 stefanha@redhat.com, virtualization@lists.linux-foundation.org
References: <1604986403-4931-1-git-send-email-michael.christie@oracle.com>
 <1604986403-4931-2-git-send-email-michael.christie@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8ca030cf-593b-3b43-1551-7de37ebe4187@redhat.com>
Date: Tue, 10 Nov 2020 15:20:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1604986403-4931-2-git-send-email-michael.christie@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvMTEvMTAg5LiL5Y2IMTozMywgTWlrZSBDaHJpc3RpZSB3cm90ZToKPiBUaGlzIGFk
ZHMgYSBoZWxwZXIgY2hlY2sgaWYgYSB2cSBoYXMgYmVlbiBzZXR1cC4gVGhlIG5leHQgcGF0Y2hl
cwo+IHdpbGwgdXNlIHRoaXMgd2hlbiB3ZSBtb3ZlIHRoZSB2aG9zdCBzY3NpIGNtZCBwcmVhbGxv
Y2F0aW9uIGZyb20gcGVyCj4gc2Vzc2lvbiB0byBwZXIgdnEuIEluIHRoZSBwZXIgdnEgY2FzZSwg
d2Ugb25seSB3YW50IHRvIGFsbG9jYXRlIGNtZHMKPiBmb3IgdnFzIHRoYXQgaGF2ZSBhY3R1YWxs
eSBiZWVuIHNldHVwIGFuZCBub3QgZm9yIGFsbCB0aGUgcG9zc2libGUKPiB2cXMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWtlIENocmlzdGllIDxtaWNoYWVsLmNocmlzdGllQG9yYWNsZS5jb20+Cj4g
LS0tCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA2ICsrKysrKwo+ICAgZHJpdmVycy92aG9z
dC92aG9zdC5oIHwgMSArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
Ywo+IGluZGV4IDVjODM1YTIuLmEyNjJlMTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92
aG9zdC5jCj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gQEAgLTMwNCw2ICszMDQsMTIg
QEAgc3RhdGljIHZvaWQgdmhvc3RfdnJpbmdfY2FsbF9yZXNldChzdHJ1Y3Qgdmhvc3RfdnJpbmdf
Y2FsbCAqY2FsbF9jdHgpCj4gICAJbWVtc2V0KCZjYWxsX2N0eC0+cHJvZHVjZXIsIDB4MCwgc2l6
ZW9mKHN0cnVjdCBpcnFfYnlwYXNzX3Byb2R1Y2VyKSk7Cj4gICB9Cj4gICAKPiArYm9vbCB2aG9z
dF92cV9pc19zZXR1cChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiArewo+ICsJcmV0dXJu
IHZxLT5hdmFpbCAmJiB2cS0+ZGVzYyAmJiB2cS0+dXNlZCAmJiB2aG9zdF92cV9hY2Nlc3Nfb2so
dnEpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHZob3N0X3ZxX2lzX3NldHVwKTsKPiArCj4g
ICBzdGF0aWMgdm9pZCB2aG9zdF92cV9yZXNldChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gICAJ
CQkgICBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiAgIHsKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aG9zdC92aG9zdC5oIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gaW5kZXggZTAxNmNk
My4uYjA2MzMyNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPiArKysgYi9k
cml2ZXJzL3Zob3N0L3Zob3N0LmgKPiBAQCAtMTkwLDYgKzE5MCw3IEBAIGludCB2aG9zdF9nZXRf
dnFfZGVzYyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICosCj4gICAJCSAgICAgIHN0cnVjdCB2aG9z
dF9sb2cgKmxvZywgdW5zaWduZWQgaW50ICpsb2dfbnVtKTsKPiAgIHZvaWQgdmhvc3RfZGlzY2Fy
ZF92cV9kZXNjKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKiwgaW50IG4pOwo+ICAgCj4gK2Jvb2wg
dmhvc3RfdnFfaXNfc2V0dXAoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpOwo+ICAgaW50IHZo
b3N0X3ZxX2luaXRfYWNjZXNzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKik7Cj4gICBpbnQgdmhv
c3RfYWRkX3VzZWQoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqLCB1bnNpZ25lZCBpbnQgaGVhZCwg
aW50IGxlbik7Cj4gICBpbnQgdmhvc3RfYWRkX3VzZWRfbihzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVl
ICosIHN0cnVjdCB2cmluZ191c2VkX2VsZW0gKmhlYWRzLAoKCkFja2VkLWJ5OiBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
