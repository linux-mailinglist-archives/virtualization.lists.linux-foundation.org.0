Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE54389AE
	for <lists.virtualization@lfdr.de>; Sun, 24 Oct 2021 17:10:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1698640164;
	Sun, 24 Oct 2021 15:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21XBqlROCfI9; Sun, 24 Oct 2021 15:10:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC63040163;
	Sun, 24 Oct 2021 15:10:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89240C0036;
	Sun, 24 Oct 2021 15:10:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77F1BC000E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Oct 2021 15:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518094025D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Oct 2021 15:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tronnes.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QFnxS8446Cx
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Oct 2021 15:10:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D8E5400DD
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Oct 2021 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5txuCn/Ya1wCyoQ6MmVCFYNnO61OkJHTBuUMLqd3+dA=; b=rekqq0WjZqKW+abPNcrSQRFDqB
 9YANC+be+mndTZD4FaLFUn+d2CK6TIAUJ60XsFJOc9PIXJtxCV9mQ3AZB7PDkLq6jrN2DJHIPKkLr
 60VvF+//XOr2Twu3G1oKo2D3QkQjOFKbNmtsw1j6K/DLz9atY/hNi8OD4YgLsXZtK50xdsEWUPPT5
 sQ8lE4nuW009SVfISbGG4sqmWyvJ8TP4oTT2P5+9VSD/QJ43i0QvY0vXgvhmGDVSfFV4BWOP1aFu9
 GlrFRjexVh+PneNk18tB6SC7tHaNgxPAhM1m7IDVAN1NdcppaLA7igg7K1OpCOeMcaq/iHX4Zwysn
 eIpYb12A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50038
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mef8T-000243-8H; Sun, 24 Oct 2021 17:10:09 +0200
Subject: Re: [PATCH 6/9] drm/fb-helper: Allocate shadow buffer of surface
 height
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-7-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <fd218727-24c6-831f-0218-8d21ac22d9d7@tronnes.org>
Date: Sun, 24 Oct 2021 17:10:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022132829.7697-7-tzimmermann@suse.de>
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CgpEZW4gMjIuMTAuMjAyMSAxNS4yOCwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gQWxsb2Nh
dGluZyBhIHNoYWRvdyBidWZmZXIgb2YgdGhlIGhlaWdodCBvZiB0aGUgYnVmZmVyIG9iamVjdCBk
b2VzCj4gbm90IHN1cHBvcnQgZmJkZXYgb3ZlcmFsbG9jYXRpb24uIFVzZSBzdXJmYWNlIGhlaWdo
dCBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
