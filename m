Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65116025C
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 08:46:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03DDE863E1;
	Sun, 16 Feb 2020 07:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KiQ3DS-tsG6E; Sun, 16 Feb 2020 07:46:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8958F860B2;
	Sun, 16 Feb 2020 07:46:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69F62C0177;
	Sun, 16 Feb 2020 07:46:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6EBEC0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B5B52203D0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLnMtTQvfyld
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:46:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 1A14E20134
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:46:42 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id l2so6993930otp.4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 23:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=kj2lE0jHDBa2FxapHGg1DD4EY4FRFGnToV7pEuklTd8=;
 b=gAbgxHflRHUuYX0gda/X4GBGNO18szIyG2edr2LCaYV9RI6DV21LkOssLzSyMwigHr
 BXP2pfCii1hxN7/51ejAASwSZYPQB0soT1F5EMKnIFsH58o7QY8ai1Qz3UQW9CgpEiNI
 3I+0TSYtLyrdn8sWC2q9weHCV9zCTXNMRKUpl6LBKpfPbMcVded9dyffSg0Wg568BttQ
 L56dCKagXUd2NI9tgrpaJH9W7hxOlttZGvIvHfeJF/cNKF4xKwQY7d00z77afIhQlrIV
 5mY4f/KOyDXwD8yTwbEbm4gOvHZZuWHj59ovFI+PA4K8q3kbOmtlceH6UQRgNFssl+Wh
 dixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kj2lE0jHDBa2FxapHGg1DD4EY4FRFGnToV7pEuklTd8=;
 b=QMmgizGwK190b3UZCvLIoOekzItjBCRWEtfdaEyccBeZsCrVMHffaZfjsWGxQBAZRy
 5e9UC5fAGPtB8Lk2uUBOSTzbxibRdCtOaPF0IpsG9PeetIoGGdDVE8wFRUo0uj1W6mPw
 6v8TsLXUmWRM0/zaNGTJ4K8BZ7u81VpRpV64nz69Vd84TmRaWhYOiUQyXG6tIFGr9Va2
 NHb7627x4jzarRJv3hlg8pYgYMUX+yff5puHM7p9p3n1gqDouwRqvkkb7JjN+Dur959X
 3PRnDkdUe+Ea/OqMqUoyQYW+Q/6LCBv/yoHC6k+dt4b3UN7bz4Tu0rke5iInXg5a7uJY
 hELA==
X-Gm-Message-State: APjAAAVdCDg/USdeTBHZ9dYxiHudJxPKSrMBrD7yHLRDzs65zMwkQGoV
 UTh9AxplKAPEhfytr4x2vQw=
X-Google-Smtp-Source: APXvYqyEJ55CSatcdJZKGpRX/SkBTQMott4Gv5M5GnWG+srfHaPgcFgbJNha6HQb6sr2fZYtNew5Rg==
X-Received: by 2002:a9d:6415:: with SMTP id h21mr8611393otl.152.1581839201169; 
 Sat, 15 Feb 2020 23:46:41 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id c7sm4178864otn.81.2020.02.15.23.46.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 15 Feb 2020 23:46:40 -0800 (PST)
Date: Sun, 16 Feb 2020 00:46:39 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] virtio_balloon: Fix unused label warning
Message-ID: <20200216074639.GA25292@ubuntu-m2-xlarge-x86>
References: <20200210093328.15349-1-bp@alien8.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210093328.15349-1-bp@alien8.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "Michael S. Tsirkin" <mst@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMTA6MzM6MjhBTSArMDEwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IEZyb206IEJvcmlzbGF2IFBldGtvdiA8YnBAc3VzZS5kZT4KPiAKPiBGaXgKPiAK
PiAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmM6IEluIGZ1bmN0aW9uIOKAmHZpcnRi
YWxsb29uX3Byb2Jl4oCZOgo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYzo5NjM6
MTogd2FybmluZzogbGFiZWwg4oCYb3V0X2RlbF92cXPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWxhYmVsXQo+ICAgICA5NjMgfCBvdXRfZGVsX3ZxczoKPiAgICAgICAgIHwgXn4K
PiAKPiBUaGUgQ09ORklHX0JBTExPT05fQ09NUEFDVElPTiBpZmRlZmZlcnkgc2hvdWxkIGVuY2xv
c2UgaXQgdG9vLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzbGF2IFBldGtvdiA8YnBAc3VzZS5k
ZT4KPiBDYzogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
cnRpby92aXJ0aW9fYmFsbG9vbi5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+
IGluZGV4IDdiZmUzNjVkOTM3Mi4uYjZlZDVmOGJjY2IxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmlydGlvL3ZpcnRpb19iYWxsb29uLmMKPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFs
bG9vbi5jCj4gQEAgLTk1OSw5ICs5NTksOSBAQCBzdGF0aWMgaW50IHZpcnRiYWxsb29uX3Byb2Jl
KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ICAJaXB1dCh2Yi0+dmJfZGV2X2luZm8uaW5v
ZGUpOwo+ICBvdXRfa2Vybl91bm1vdW50Ogo+ICAJa2Vybl91bm1vdW50KGJhbGxvb25fbW50KTsK
PiAtI2VuZGlmCj4gIG91dF9kZWxfdnFzOgo+ICAJdmRldi0+Y29uZmlnLT5kZWxfdnFzKHZkZXYp
Owo+ICsjZW5kaWYKCkkgbm90aWNlZCB0aGUgc2FtZSBpc3N1ZSBhbmQgc2VudCBhbiBhbG1vc3Qg
aWRlbnRpY2FsIHBhdGNoIFsxXSBidXQgSQprZXB0IHRoZSBjYWxsIHRvIGRlbF92cXMgb3V0c2lk
ZSBvZiB0aGUgQ09ORklHX0JBTExPT05fQ09NUEFDVElPTiBndWFyZApzaW5jZSBpdCBzZWVtcyBs
aWtlIHRoYXQgc2hvdWxkIHN0aWxsIGJlIGNhbGxlZCB3aGVuIHRoYXQgY29uZmlnIGlzCnVuc2V0
LCBhcyB0aGF0IHdhcyB0aGUgY2FzZSBiZWZvcmUgY29tbWl0IDFhZDZmNThlYTkzNiAoInZpcnRp
b19iYWxsb29uOgpGaXggbWVtb3J5IGxlYWtzIG9uIGVycm9ycyBpbiB2aXJ0YmFsbG9vbl9wcm9i
ZSgpIikuIElzIHRoaXMgcGF0Y2ggZnVsbHkKY29ycmVjdD8gSSBhbSBub3QgYSB2aXJ0aW8gZXhw
ZXJ0IGF0IGFsbCwganVzdCBub3RpY2luZyBmcm9tIGEgYnJpZWYKcmVhZGluZyBvZiB0aGlzIGZ1
bmN0aW9uLgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAwMjE2MDA0MDM5
LjIzNDY0LTEtbmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tLwoKQ2hlZXJzLApOYXRoYW4KCj4gIG91
dF9mcmVlX3ZiOgo+ICAJa2ZyZWUodmIpOwo+ICBvdXQ6Cj4gLS0gCj4gMi4yMS4wCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
