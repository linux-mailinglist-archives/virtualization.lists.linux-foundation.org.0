Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C522BD5DE9
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 10:53:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BAA0D2668;
	Mon, 14 Oct 2019 08:52:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AF8C22562
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 08:38:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 51C276D6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 08:38:42 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3CDA8553D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 08:38:41 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id k2so8186344wrn.7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 01:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=zgV9pC+zt0gI/V422zTkhHPL1PoCXjjbpPu+KeAB0w0=;
	b=MyNCvUjSdbFv7VpUmPA9S5sA/+J0zQUHX1I5grJe6BrYRx9Qe5ScJXlN2lB6EiPojy
	74d5TxC3NEXFQgGdPfEYOhBN0Lczx5Hvh4/f9Bk3N24O4JLAdfy6eF3Z+Op3vlqx0FKa
	cZgm1Eey8z0rIe36zmNwXm3WkqznKH39jJcix2CikWkib9k+Mmc9mMFPm96T3SDzz6Sh
	7J+zrafkC87Wz5fXUTtN2cJOPlMJnLMZ8/lr23IMf8bcqRs5mzccOcktTtk9JmvVqlId
	fbxwZl/kt4ihnX+a6qohaebUVdTdjD70loCe8Dwk7aZ8BuvqXMUpQbUK5HL3XhVf8l7E
	bWzQ==
X-Gm-Message-State: APjAAAUEoRkE88PsBrIRZyNINT07eOOnf2Rs9rmL2NW/Dl4tSZmpGHQu
	4lptDkO0F1AqH6IFQ/Xpb5PY+dlG/U86lUNAGzXKo5fqZB0HWy5c8OnBffob2M83YEaCuzbH2CO
	udmV8CJWrxjXdjh2DpZM7Ddba8BeK++sAjUfvp4TheA==
X-Received: by 2002:a1c:3284:: with SMTP id
	y126mr14533756wmy.164.1571042320317; 
	Mon, 14 Oct 2019 01:38:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7BekhhYUaPdPVvYSoK18HhJqtlF38AkAYk8aK0SjlT68meT4y2oI/uOqPx7iwjAspulu58A==
X-Received: by 2002:a1c:3284:: with SMTP id
	y126mr14533736wmy.164.1571042320048; 
	Mon, 14 Oct 2019 01:38:40 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	x5sm22881456wrt.75.2019.10.14.01.38.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 01:38:39 -0700 (PDT)
Date: Mon, 14 Oct 2019 10:38:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20191014083836.fumqbp4sfn5usys6@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190830094059.c7qo5cxrp2nkrncd@steredhat>
	<20190901024525-mutt-send-email-mst@kernel.org>
	<CAGxU2F7fA5UtkuMQbOHHy0noOGZUtpepBNKFg5afD81bynMVUQ@mail.gmail.com>
	<20191014081724.GD22963@stefanha-x1.localdomain>
	<2398c960-b6d7-8af3-fa25-d75344335db7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2398c960-b6d7-8af3-fa25-d75344335db7@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
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

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDQ6MjE6MzVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzEwLzE0IOS4i+WNiDQ6MTcsIFN0ZWZhbiBIYWpub2N6aSB3cm90ZToKPiA+
IFNPX1ZNX1NPQ0tFVFNfQlVGRkVSX1NJWkUgbWlnaHQgaGF2ZSBiZWVuIHVzZWZ1bCBmb3IgVk1D
SS1zcGVjaWZpYwo+ID4gYXBwbGljYXRpb25zLCBidXQgd2Ugc2hvdWxkIHVzZSBTT19SQ1ZCVUYg
YW5kIFNPX1NOREJVRiBmb3IgcG9ydGFibGUKPiA+IGFwcGxpY2F0aW9ucyBpbiB0aGUgZnV0dXJl
LiAgVGhvc2Ugc29ja2V0IG9wdGlvbnMgYWxzbyB3b3JrIHdpdGggb3RoZXIKPiA+IGFkZHJlc3Mg
ZmFtaWxpZXMuCj4gPiAKCkkgdGhpbmsgaHlwZXJ2X3RyYW5zcG9ydCBzdGFydGVkIHRvIHVzZSBp
dCBpbiB0aGlzIHBhdGNoOgphYzM4M2Y1OGYzYzkgIGh2X3NvY2s6IHBlcmY6IEFsbG93IHRoZSBz
b2NrZXQgYnVmZmVyIHNpemUgb3B0aW9ucyB0byBpbmZsdWVuY2UKICAgICAgICAgICAgICB0aGUg
YWN0dWFsIHNvY2tldCBidWZmZXJzCgoKPiA+IEkgZ3Vlc3MgdGhlc2Ugc29ja29wdHMgYXJlIGJ5
cGFzc2VkIGJ5IEFGX1ZTT0NLIGJlY2F1c2UgaXQgZG9lc24ndCB1c2UKPiA+IHRoZSBjb21tb24g
c2tiIHF1ZXVpbmcgY29kZSBpbiBuZXQvY29yZS9zb2NrLmM6KC4gIEJ1dCBvbmUgZGF5IHdlIG1p
Z2h0Cj4gPiBtaWdyYXRlIHRvIGl0Li4uCj4gPiAKPiA+IFN0ZWZhbgo+IAo+IAo+ICsxLCB3ZSBz
aG91bGQgcmVhbGx5IGNvbnNpZGVyIHRvIHJldXNlIHRoZSBleGlzdCBzb2NrZXQgbWVjaGFuaXNt
IGluc3RlYWQgb2YKPiByZS1pbnZlbnRpbmcgd2hlZWxzLgoKKzEsIEkgdG90YWxseSBhZ3JlZS4g
SSdsbCBnbyB0aGlzIHdheS4KCkd1eXMsIHRoYW5rIHlvdSBhbGwgZm9yIHlvdXIgc3VnZ2VzdGlv
bnMhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
