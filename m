Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D95887B9
	for <lists.virtualization@lfdr.de>; Wed,  3 Aug 2022 09:09:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00EA2817AB;
	Wed,  3 Aug 2022 07:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00EA2817AB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JJYt01Jn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 453EpDRHeJu6; Wed,  3 Aug 2022 07:09:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC04E817AC;
	Wed,  3 Aug 2022 07:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC04E817AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDA2DC0078;
	Wed,  3 Aug 2022 07:09:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C76D8C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Aug 2022 07:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E2EB60E69
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Aug 2022 07:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2EB60E69
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=JJYt01Jn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eMGvixwXSe1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Aug 2022 07:08:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5038460E46
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5038460E46
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Aug 2022 07:08:58 +0000 (UTC)
Received: from localhost (unknown [213.194.152.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: rcn)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FB406601B14;
 Wed,  3 Aug 2022 08:08:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659510536;
 bh=Eve3Lr0Cb9xre2AkLAV1bWZOKV4+4t925HBE9wMRarE=;
 h=From:To:Cc:Subject:References:In-reply-to:Date:From;
 b=JJYt01JngWP5KICr3wnQ+IXrWv7a1PglME1yHLOlQxDp3+V8sUjET+zElYM4pUHvZ
 XmSSq+QqHeVhXfRftslgZrZGOLK2RJ5oNaDABT4uqNb31laQsQ99cQRjX5GlAw/t7M
 Nsja/+0sUmWw+19JQDRqGTkFx/wVPXiI/5iytZ6Jjs8cw8IuKNoEcjr5aHS/ZrDVyK
 xloJEfSUJx0nfzYn3YndAPM2HP0HuJUhgw4pgshC9bCo7NsTviyT5vAm+Xsg+6uuWt
 btNusU4pJQ4Pl53MOSV5Ay+/YuXrnFeOCZILW+VMbtcv6PeRZJgXoqTXzAI/x/RQ2N
 HMtHAq/AuYDSA==
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
 <YulJQKL22sB31lfU@casper.infradead.org>
In-reply-to: <YulJQKL22sB31lfU@casper.infradead.org>
Date: Wed, 03 Aug 2022 09:08:53 +0200
Message-ID: <874jytst16.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Cc: virtualization@lists.linux-foundation.org, mst@redhat.com,
 kernel@collabora.com, linux-doc@vger.kernel.org
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

TWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyaXRlczoKCj4gT24gVHVlLCBB
dWcgMDIsIDIwMjIgYXQgMDI6NDI6MjJQTSArMDIwMCwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToK
Pj4gK0luIHRoaXMgY2FzZSwgd2hlbiB0aGUgaW50ZXJydXB0IGFycml2ZXMgOmM6ZnVuYzpgdnBf
aW50ZXJydXB0YCB3aWxsIGJlCj4+ICtjYWxsZWQgYW5kIGl0IHdpbGwgdWx0aW1hdGVseSBsZWFk
IHRvIGEgY2FsbCB0bwo+PiArOmM6ZnVuYzpgdnJpbmdfaW50ZXJydXB0YCwgd2hpY2ggZW5kcyB1
cCBjYWxsaW5nIHRoZSB2aXJ0cXVldWUgY2FsbGJhY2sKPj4gK2Z1bmN0aW9uOjoKPgo+IFlvdSBk
b24ndCBuZWVkIHRvIHVzZSA6YzpmdW5jOmBmb29gLiAgWW91IGNhbiBqdXN0IHdyaXRlIGZvbygp
IGFuZCB0aGUKPiB0b29saW5nIHdpbGwgY29udmVydCBpdCBpbnRvIDpjOmZ1bmM6YGZvb2AgZm9y
IHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
