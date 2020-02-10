Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457D1571BD
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 10:33:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1A8D84798;
	Mon, 10 Feb 2020 09:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZgUGKOsbeLJb; Mon, 10 Feb 2020 09:33:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB1428472A;
	Mon, 10 Feb 2020 09:33:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD16FC0171;
	Mon, 10 Feb 2020 09:33:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40892C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 36EC086D92
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iynGLURL8QJ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:33:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A44BB86D37
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:33:42 +0000 (UTC)
Received: from zn.tnic (p200300EC2F05D4003DBA28C5722DFF0F.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f05:d400:3dba:28c5:722d:ff0f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 73B301EC0664;
 Mon, 10 Feb 2020 10:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1581327219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=VCLFBh9D1PTtDNNjEMEWbYlkj1/32Dza49ERXlI5n9g=;
 b=P6KFzeJ0JTq6ZpM5f+2IP1m06wrA+7IS0Orbtn85J0bDnN9kVXMe1qfoUkkyJJ5Ld5aemo
 3oT0lTFbEaCuT1TVZsS2EckT1o3j36qtdgQO7NWcW0XOSxmvNAkYwv5HOei0BTUwtlwtTk
 LLLVv5yp2VVX3oALeHdL2w+Al5ZKeFo=
From: Borislav Petkov <bp@alien8.de>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio_balloon: Fix unused label warning
Date: Mon, 10 Feb 2020 10:33:28 +0100
Message-Id: <20200210093328.15349-1-bp@alien8.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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

RnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgoKRml4CgogIGRyaXZlcnMvdmlydGlv
L3ZpcnRpb19iYWxsb29uLmM6IEluIGZ1bmN0aW9uIOKAmHZpcnRiYWxsb29uX3Byb2Jl4oCZOgog
IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmM6OTYzOjE6IHdhcm5pbmc6IGxhYmVsIOKA
mG91dF9kZWxfdnFz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1sYWJlbF0KICAg
IDk2MyB8IG91dF9kZWxfdnFzOgogICAgICAgIHwgXn4KClRoZSBDT05GSUdfQkFMTE9PTl9DT01Q
QUNUSU9OIGlmZGVmZmVyeSBzaG91bGQgZW5jbG9zZSBpdCB0b28uCgpTaWduZWQtb2ZmLWJ5OiBC
b3Jpc2xhdiBQZXRrb3YgPGJwQHN1c2UuZGU+CkNjOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b19iYWxsb29uLmMKaW5kZXggN2JmZTM2NWQ5MzcyLi5iNmVkNWY4YmNjYjEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMKKysrIGIvZHJpdmVycy92aXJ0aW8vdmly
dGlvX2JhbGxvb24uYwpAQCAtOTU5LDkgKzk1OSw5IEBAIHN0YXRpYyBpbnQgdmlydGJhbGxvb25f
cHJvYmUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCiAJaXB1dCh2Yi0+dmJfZGV2X2luZm8u
aW5vZGUpOwogb3V0X2tlcm5fdW5tb3VudDoKIAlrZXJuX3VubW91bnQoYmFsbG9vbl9tbnQpOwot
I2VuZGlmCiBvdXRfZGVsX3ZxczoKIAl2ZGV2LT5jb25maWctPmRlbF92cXModmRldik7CisjZW5k
aWYKIG91dF9mcmVlX3ZiOgogCWtmcmVlKHZiKTsKIG91dDoKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
