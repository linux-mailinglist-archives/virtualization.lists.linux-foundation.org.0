Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D821C6B78
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 10:21:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EEA7A86C24;
	Wed,  6 May 2020 08:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5rTt15rgBpC; Wed,  6 May 2020 08:21:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04C9287196;
	Wed,  6 May 2020 08:21:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF1EBC0859;
	Wed,  6 May 2020 08:21:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9D6FC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C8DFA8855D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDPFNBqMzz+i
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4193588557
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588753288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nF+0VU5uQHo07GYFoGqtLNbg64uaIEB/qw6oVIMZLHo=;
 b=OgYb0KwvGTV8a2ylKpntvvLVomBOVTojFUiLGqIHZV5Q62X3qxI67gzZjkwtcWIl2EjkiY
 lR4GFCgK70vXUUNMscsEuM030E26aXN9ZMf/h17kXERH5FSt78To8hbOrSqrqhJtCrvUEE
 OFWk3JwLLkqTUCuEtarJuKDqc/pMuPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-wJzohBH7M3qY_BjjNFOlpA-1; Wed, 06 May 2020 04:21:26 -0400
X-MC-Unique: wJzohBH7M3qY_BjjNFOlpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 315A745F;
 Wed,  6 May 2020 08:21:25 +0000 (UTC)
Received: from [10.72.13.165] (ovpn-13-165.pek2.redhat.com [10.72.13.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30289579AD;
 Wed,  6 May 2020 08:21:17 +0000 (UTC)
Subject: Re: [PATCH net-next 2/2] virtio-net: fix the XDP truesize calculation
 for mergeable buffers
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506061633.16327-2-jasowang@redhat.com>
 <20200506033259-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <789fc6e6-9667-a609-c777-a9b1fed72f41@redhat.com>
Date: Wed, 6 May 2020 16:21:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506033259-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMjAvNS82IOS4i+WNiDM6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIE1heSAwNiwgMjAyMCBhdCAwMjoxNjozM1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBXZSBzaG91bGQgbm90IGV4Y2x1ZGUgaGVhZHJvb20gYW5kIHRhaWxyb29tIHdoZW4gWERQIGlz
IHNldC4gU28gdGhpcwo+PiBwYXRjaCBmaXhlcyB0aGlzIGJ5IGluaXRpYWxpemluZyB0aGUgdHJ1
ZXNpemUgZnJvbSBQQUdFX1NJWkUgd2hlbiBYRFAKPj4gaXMgc2V0Lgo+Pgo+PiBDYzogSmVzcGVy
IERhbmdhYXJkIEJyb3Vlcjxicm91ZXJAcmVkaGF0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFz
b24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IFNlZW1zIHRvbyBhZ2dyZXNzaXZlLCB3ZSBk
byBub3QgdXNlIHVwIHRoZSB3aG9sZSBwYWdlIGZvciB0aGUgc2l6ZS4KPgo+Cj4KCkZvciBYRFAg
eWVzLCB3ZSBkbzoKCnN0YXRpYyB1bnNpZ25lZCBpbnQgZ2V0X21lcmdlYWJsZV9idWZfbGVuKHN0
cnVjdCByZWNlaXZlX3F1ZXVlICpycSwKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqAgc3RydWN0IGV3bWFfcGt0X2xlbiAqYXZnX3BrdF9sZW4sCiDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgIHVuc2lnbmVkIGludCByb29tKQp7CiDCoMKgwqAgY29uc3Qg
c2l6ZV90IGhkcl9sZW4gPSBzaXplb2Yoc3RydWN0IHZpcnRpb19uZXRfaGRyX21yZ19yeGJ1Zik7
CiDCoMKgwqAgdW5zaWduZWQgaW50IGxlbjsKCiDCoMKgwqAgaWYgKHJvb20pCiDCoMKgwqAgwqDC
oMKgIHJldHVybiBQQUdFX1NJWkUgLSByb29tOwoKLi4uCgpUaGFua3MKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
