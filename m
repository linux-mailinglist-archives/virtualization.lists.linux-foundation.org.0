Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E61CC8A
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 18:10:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C74AEDCF;
	Tue, 14 May 2019 16:10:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 148EBD9C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 16:10:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E039A87D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 16:10:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i3so3479668wml.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 09:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=wYcnLcHNEWzuyUPaOSPaqvipKhwQq75NVlrWVwfonxY=;
	b=ZGiH+OA8k4jf/LxyDfiEnNxqcW1XDkOid568Nz8FQXW3CEBa6HvCzIzoFZ2NxTsz1I
	d61JIwaU+z3DKrgzCejFBA8/SyZE66V1IYnmP9UCE/LW37f3AEWipayHhsQ7sfb870UR
	ytynJgV0CZgBY3vDDhQ3oXE+EZ27alybPiWGjijJNCQS8m4ykEvUHGfPkmIklSTAj54I
	CDhQIq3mkD3hlBKMC7wGfu0VbUvbOYc/pwdMTgUXE6QRG1GWz7KUndUtcd9x19s2/WEb
	ljIZijzIYU0RZpViJJ72aVSnSfTobcf8CTEkVSPt7tZYRLxVeDtUfkAh2BuNAJQQTYql
	2/8Q==
X-Gm-Message-State: APjAAAVxtYERqmWiwVvc4QfIVcyMuMTnChlztE/uXrTaT+da6yiXeg5T
	tjoRCNlnoOorStcG1Fgvani82g==
X-Google-Smtp-Source: APXvYqxqlLOgXzEWalLGMo/rtA7vvFLalOSyrklAhb9ipPKK7DakL4gduRG3L+0mF5EDXgRvQwftWw==
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr9244992wmt.136.1557850244405;
	Tue, 14 May 2019 09:10:44 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151])
	by smtp.gmail.com with ESMTPSA id l2sm5293724wmf.16.2019.05.14.09.10.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 09:10:43 -0700 (PDT)
Date: Tue, 14 May 2019 18:10:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 8/8] vsock/virtio: make the RX buffer size tunable
Message-ID: <20190514161041.y4exigcwwys34naf@steredhat>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-9-sgarzare@redhat.com>
	<eddb5a89-ed44-3a65-0181-84f7f27dd2cb@redhat.com>
	<8e72ef5e-cf6a-a635-3f76-bdeac95761b8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e72ef5e-cf6a-a635-3f76-bdeac95761b8@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDg6NDY6MTlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzUvMTMg5LiL5Y2INjowNSwgSmFzb24gV2FuZyB3cm90ZToKPiA+IAo+
ID4gT24gMjAxOS81LzEwIOS4i+WNiDg6NTgsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPiA+
ID4gVGhlIFJYIGJ1ZmZlciBzaXplIGRldGVybWluZXMgdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBv
ZiB0aGUKPiA+ID4gdnNvY2svdmlydGlvIGd1ZXN0IGRyaXZlciwgc28gd2UgbWFrZSBpdCB0dW5h
YmxlIHRocm91Z2gKPiA+ID4gYSBtb2R1bGUgcGFyYW1ldGVyLgo+ID4gPiAKPiA+ID4gVGhlIHNp
emUgYWxsb3dlZCBhcmUgYmV0d2VlbiA0IEtCIGFuZCA2NCBLQiBpbiBvcmRlciB0byBiZQo+ID4g
PiBjb21wYXRpYmxlIHdpdGggb2xkIGhvc3QgZHJpdmVycy4KPiA+ID4gCj4gPiA+IFN1Z2dlc3Rl
ZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBTdGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4gPiAKPiA+
IAo+ID4gSSBkb24ndCBzZWUgbXVjaCB2YWx1ZSBvZiBkb2luZyB0aGlzIHRocm91Z2gga2VybmVs
IGNvbW1hbmQgbGluZS4gV2UKPiA+IHNob3VsZCBkZWFsIHdpdGggdGhlbSBhdXRvbWF0aWNhbGx5
IGxpa2Ugd2hhdCB2aXJ0aW8tbmV0IGRpZC4gT3IgZXZlbiBhCj4gPiBtb2R1bGUgcGFyYW1ldGVy
IGlzIGJldHRlci4KPiA+IAo+ID4gVGhhbmtzCj4gCj4gCj4gU29ycnksIEkgbWlzcmVhZCB0aGUg
cGF0Y2guIEJ1dCBldmVuIG1vZHVsZSBwYXJhbWV0ZXIgaXMgc29tZXRoaW5nIG5vdAo+IGZsZXhp
YmxlIGVub3VnaC4gV2Ugc2hvdWxkIGRlYWwgd2l0aCB0aGVtIHRyYW5zcGFyZW50bHkuCj4gCgpP
a2F5LCBJJ2xsIHRyeSB0byB1bmRlcnN0YW5kIGhvdyB3ZSBjYW4gYXV0b21hdGljYWxseSBhZGFw
dCB0aGUgUlgKYnVmZmVyIHNpemUuIFNpbmNlIHRoZSBmbG93IGlzIHN0cmVhbSBiYXNlZCwgdGhl
IHJlY2VpdmVyIGRvZXNuJ3Qga25vdyB0aGUKb3JpZ2luYWwgcGFja2V0IHNpemUuCgpNYXliZSBJ
IGNhbiByZXVzZSB0aGUgRVdNQSBhcHByb2FjaCB0byB1bmRlcnN0YW5kIGlmIHRoZSBidWZmZXJz
IGFyZQplbnRpcmVseSBmaWxsZWQgb3Igbm90LgpJbiB0aGF0IGNhc2UgSSBjYW4gaW5jcmVhc2Ug
KGUuZy4gZG91YmxlKSBvciBkZWNyZWFzZSB0aGUgc2l6ZS4KCkknbGwgdHJ5IHRvIGRvIGl0IQoK
VGhhbmtzLApTdGVmYW5vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
