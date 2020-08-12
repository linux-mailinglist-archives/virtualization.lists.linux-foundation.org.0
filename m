Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EF2423F3
	for <lists.virtualization@lfdr.de>; Wed, 12 Aug 2020 04:07:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCB8486932;
	Wed, 12 Aug 2020 02:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uK1qkFcBTcwm; Wed, 12 Aug 2020 02:07:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66CC68692F;
	Wed, 12 Aug 2020 02:07:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4340CC004D;
	Wed, 12 Aug 2020 02:07:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4242DC004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Aug 2020 02:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2B8F68692F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Aug 2020 02:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkKO5-djQn2b
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Aug 2020 02:07:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A304786918
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Aug 2020 02:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597198040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaFc7Ab1BP+3AGn68r+e13guY4/AqRwXlLyLy0Ig9QE=;
 b=d/TEMqh0V/mI03/PJGUM6DvGOSVtU/uRT4oZFxzNm4s8XzW2ldvYzrRr/2TtJk9DTgmWZL
 8je1TK+r7M1mOmpK8GzfFn9YQ95WYsfI0c3PROBHqAHaNKevSrYpNK0RpZIML7EpwYN5hy
 Ihr8MzldtFI8k1rD0Bis+1SWCEo4hps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-Srf9n_vOPOWxBBv-eiIIvw-1; Tue, 11 Aug 2020 22:07:18 -0400
X-MC-Unique: Srf9n_vOPOWxBBv-eiIIvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 777CBE919
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Aug 2020 02:07:17 +0000 (UTC)
Received: from [10.72.12.118] (ovpn-12-118.pek2.redhat.com [10.72.12.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB09310021B3;
 Wed, 12 Aug 2020 02:07:12 +0000 (UTC)
Subject: Re: vdpa: handling of VIRTIO_F_ACCESS_PLATFORM/VIRTIO_F_ORDER_PLATFORM
To: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20200811054754-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <be931c7e-16ed-979f-59be-6e721f6b0e8c@redhat.com>
Date: Wed, 12 Aug 2020 10:07:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811054754-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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

Ck9uIDIwMjAvOC8xMSDkuIvljYg1OjUyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gSGkh
Cj4gSSdkIGxpa2UgdG8gcmFpc2UgdGhlIHF1ZXN0aW9uIG9mIHdoZXRoZXIgd2UgY2FuIGRyb3Ag
dGhlIHJlcXVpcmVtZW50Cj4gb2YgVklSVElPX0ZfQUNDRVNTX1BMQVRGT1JNIGZyb20gdmRwYT8K
PiBBcyBmYXIgYXMgSSBjYW4gc2VlLCBpdCBpcyBtZXJlbHkgcmVxdWlyZWQgZm9yIHZpcnRpbyB2
ZHBhIC0KPiBzbyBzaG91bGQgd2Ugbm90IGVuZm9yY2UgaXQgdGhlcmU/CgoKSWYgd2UgZG9uJ3Qg
ZW5mb3JjZSBpdCwgdmlydGlvIHdpbGwgdXNlIFBBIHdoaWNoIGJyZWFrcyB0aGUgc2V0dXAgd2hl
biAKSU9NTVUgaXMgZW5hYmxlZC4gQXMgZGlzY3Vzc2VkIGluIHRoZSBwYXN0LCBtYW5kYXRpbmcg
RE1BIEFQSSBmb3IgdmlyaXRvIApjYW4ganVzdCBzb2x2ZSB0aGlzIGlzc3VlLgoKCj4KPiBUaGUg
cG9pbnQgaXMgc3VwcG9ydCBmb3IgbGVnYWN5IGd1ZXN0cyAtIHdoaWNoIG1vc3RseSBqdXN0IHdv
cmtzCj4gb24geDg2LgoKCkxlZ2FjeSBndWVzdCBzaG91bGQgd29yayBldmVuIGlmIHdlIG1hbmRh
dGUgQUNDRVNTX1BMQVRGT1JNLgoKVGhpcyBpcyBiZWNhdXNlIHdlIGRvbid0IHNpbXBseSBwYXNz
IHRocm91Z2ggZ3Vlc3QgZmVhdHVyZXMgKHFlbXUgd2lsbCAKYWx3YXlzIHNldCBBQ0NFU1NfUExB
VEZPUk0gdG8gdmhvc3QtdmRwYSkuCgoKPgo+IEFsc28sIHdoYXQgaXMgdGhlIHBsYW4gZm9yIFZJ
UlRJT19GX09SREVSX1BMQVRGT1JNPwoKCkkgdGhpbmsgd2Ugc2hvdWxkIG1hbmRhdGUgT1JERVJf
UExBVEZPUk0sIChldmVuIGZvciBndWVzdCkuCgpUaGFua3MKCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
