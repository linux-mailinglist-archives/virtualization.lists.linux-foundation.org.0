Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D723B2A5
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 04:14:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09B028493F;
	Tue,  4 Aug 2020 02:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awr-8PVoJhbO; Tue,  4 Aug 2020 02:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BE88867D4;
	Tue,  4 Aug 2020 02:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42C89C004C;
	Tue,  4 Aug 2020 02:14:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30B8EC004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 02:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 19FF4856E9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 02:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bu1o7qPPo5a1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 02:14:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 52662853D3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 02:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596507249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dinaWVnkMHZ+VIU43BHevlr8tggRrHlhVfqluBTGxHE=;
 b=RTbv1LDkzp/FYEhCMrnqJyNXnuDkizL48asC4zCXrgM2+2sGAZm1j5l72Tad05ktmVSyey
 oCDEtADygZWod/yQo3E/UvjyYtAgbuI6t5pYoJuUCpLuSDSv7LNA2MttzA/sInKBaXKJuU
 dxoWoF8ejAausaRFbvahyCttI9KS6EU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-KpE0kHG8NU2ucALeTek8wA-1; Mon, 03 Aug 2020 22:14:07 -0400
X-MC-Unique: KpE0kHG8NU2ucALeTek8wA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27836106B246;
 Tue,  4 Aug 2020 02:14:06 +0000 (UTC)
Received: from [10.72.13.197] (ovpn-13-197.pek2.redhat.com [10.72.13.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07A5C5C6DD;
 Tue,  4 Aug 2020 02:13:51 +0000 (UTC)
Subject: Re: [PATCH] virtio_pci_modern: Fix the comment of
 virtio_pci_find_capability()
To: Yi Wang <wang.yi59@zte.com.cn>, mst@redhat.com
References: <1596455545-43556-1-git-send-email-wang.yi59@zte.com.cn>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <75b74fe2-a025-7f31-cc14-61605e00aad5@redhat.com>
Date: Tue, 4 Aug 2020 10:13:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596455545-43556-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: wang.liang82@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>,
 linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn,
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

Ck9uIDIwMjAvOC8zIOS4i+WNiDc6NTIsIFlpIFdhbmcgd3JvdGU6Cj4gRnJvbTogTGlhbyBQaW5n
ZmFuZyA8bGlhby5waW5nZmFuZ0B6dGUuY29tLmNuPgo+Cj4gRml4IHRoZSBjb21tZW50IG9mIHZp
cnRpb19wY2lfZmluZF9jYXBhYmlsaXR5KCkgYnkgYWRkaW5nIG1pc3NpbmcgY29tbWVudAo+IGZv
ciB0aGUgbGFzdCBwYXJhbWV0ZXI6IGJhcnMuCj4KPiBGaXhlczogNTlhNWIwZjdiZjc0ICgidmly
dGlvLXBjaTogYWxsb2Mgb25seSByZXNvdXJjZXMgYWN0dWFsbHkgdXNlZC4iKQo+IFNpZ25lZC1v
ZmYtYnk6IExpYW8gUGluZ2ZhbmcgPGxpYW8ucGluZ2ZhbmdAenRlLmNvbS5jbj4KPiBTaWduZWQt
b2ZmLWJ5OiBZaSBXYW5nIDx3YW5nLnlpNTlAenRlLmNvbS5jbj4KCgpBY2tlZC1ieTogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+IC0tLQo+ICAgZHJpdmVycy92aXJ0aW8vdmly
dGlvX3BjaV9tb2Rlcm4uYyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYyBiL2Ry
aXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMKPiBpbmRleCBkYjkzY2VkZDI2MmYuLjli
ZGM2ZjY4MjIxZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVy
bi5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYwo+IEBAIC00ODEs
NiArNDgxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2aXJ0aW9fY29uZmlnX29wcyB2aXJ0aW9f
cGNpX2NvbmZpZ19vcHMgPSB7Cj4gICAgKiBAZGV2OiB0aGUgcGNpIGRldmljZQo+ICAgICogQGNm
Z190eXBlOiB0aGUgVklSVElPX1BDSV9DQVBfKiB2YWx1ZSB3ZSBzZWVrCj4gICAgKiBAaW9yZXNv
dXJjZV90eXBlczogSU9SRVNPVVJDRV9NRU0gYW5kL29yIElPUkVTT1VSQ0VfSU8uCj4gKyAqIEBi
YXJzOiB0aGUgYml0bWFzayBvZiBCQVJzCj4gICAgKgo+ICAgICogUmV0dXJucyBvZmZzZXQgb2Yg
dGhlIGNhcGFiaWxpdHksIG9yIDAuCj4gICAgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
