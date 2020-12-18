Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44C2DDDCC
	for <lists.virtualization@lfdr.de>; Fri, 18 Dec 2020 06:20:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8E8701FEAE;
	Fri, 18 Dec 2020 05:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rl4Gx0+M1xIs; Fri, 18 Dec 2020 05:20:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 55C6920108;
	Fri, 18 Dec 2020 05:20:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 335C7C0893;
	Fri, 18 Dec 2020 05:20:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9075AC0893
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 05:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8C9CC8772A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 05:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fccMLUGMDHP
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 05:20:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 345A587722
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 05:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608268837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94PrZx6Z4+qP5Gaz/7jmhZepyks5QupCBhkE6trvHVw=;
 b=DIhkfHgF+pjPSuH47VzC+t9553PHbTsvO1UXk/jPOkTkiCix/3Is8ndTOjjojr3RUVxdBP
 ZjKSTD+Xel9Gy7nFD5CB35lxs0ExSE09+zcWJFsm5tfvCwtEVh1JkWs383kLegRU5MJrTa
 y254t9XzPoAYWSYzG9ci+kiXgVLjokA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-KcdK9ONvOK-xU_LaUCn9uQ-1; Fri, 18 Dec 2020 00:20:33 -0500
X-MC-Unique: KcdK9ONvOK-xU_LaUCn9uQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0842107ACE3;
 Fri, 18 Dec 2020 05:20:32 +0000 (UTC)
Received: from [10.72.12.111] (ovpn-12-111.pek2.redhat.com [10.72.12.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0812910021B3;
 Fri, 18 Dec 2020 05:20:23 +0000 (UTC)
Subject: Re: [PATCH -next] vdpa: Mark macaddr_buf with static keyword
To: Zou Wei <zou_wei@huawei.com>, mst@redhat.com
References: <1608256295-69649-1-git-send-email-zou_wei@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <93257e41-f0d6-11d7-678e-9b94a55ce3cd@redhat.com>
Date: Fri, 18 Dec 2020 13:20:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608256295-69649-1-git-send-email-zou_wei@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: mgurtovoy@nvidia.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

Ck9uIDIwMjAvMTIvMTgg5LiK5Y2IOTo1MSwgWm91IFdlaSB3cm90ZToKPiBGaXggdGhlIGZvbGxv
d2luZyBzcGFyc2Ugd2FybmluZzoKPgo+IGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9u
ZXQuYzozNjo0OiB3YXJuaW5nOiBzeW1ib2wgJ21hY2FkZHJfYnVmJyB3YXMgbm90IGRlY2xhcmVk
LiBTaG91bGQgaXQgYmUgc3RhdGljPwo+Cj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtj
aUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9uZXQuYyB8IDIgKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9uZXQuYyBiL2RyaXZlcnMv
dmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9uZXQuYwo+IGluZGV4IGMxMGI2OTguLmYwNDgyNDIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltX25ldC5jCj4gKysrIGIv
ZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltX25ldC5jCj4gQEAgLTMzLDcgKzMzLDcgQEAg
c3RhdGljIGNoYXIgKm1hY2FkZHI7Cj4gICBtb2R1bGVfcGFyYW0obWFjYWRkciwgY2hhcnAsIDAp
Owo+ICAgTU9EVUxFX1BBUk1fREVTQyhtYWNhZGRyLCAiRXRoZXJuZXQgTUFDIGFkZHJlc3MiKTsK
PiAgIAo+IC11OCBtYWNhZGRyX2J1ZltFVEhfQUxFTl07Cj4gK3N0YXRpYyB1OCBtYWNhZGRyX2J1
ZltFVEhfQUxFTl07Cj4gICAKPiAgIHN0YXRpYyBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbV9uZXRf
ZGV2OwoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCgo+ICAg
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
