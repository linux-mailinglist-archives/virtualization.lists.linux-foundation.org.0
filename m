Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B824EA06
	for <lists.virtualization@lfdr.de>; Fri, 21 Jun 2019 15:57:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A79DE8E;
	Fri, 21 Jun 2019 13:57:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62FFEE8E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 13:57:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E43A127B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 13:57:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id w20so2646729edd.2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 06:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
	:message-id:mime-version:content-transfer-encoding;
	bh=Vv3Wcv1F8z72B8BAiMnHckjaR7xCiJ8P8UB0AlZQiLY=;
	b=gbmTOgNv2T8G0G0MB126PHeU+OfhaJPSHHXEgUEtnLR4J530t4clNQJEn4vq+8e5NV
	EBy31teuPB+qhqN6jSOaibMK6ypCMtg1tZEREC7nVjd9mAfqyyyEGDPt+0DWK2v7x62G
	7T4IIut6rxbMRtKLW+77ZyAKP2VQwf+R0IOCRdzzNu6WAiTW3CU3DrAMd4l2UrqhTw+v
	jb3Zj9wcIrIOPdq17ieXz/uUH32PRo0SJ4eqNwNkhfMmzoHxrNnu3AHLhC2SsHqEh68q
	/oaBnHcCgYdgk3c9NPICGehZ1tJV7c6jpmrtS5DOOKwOiF7n3fkm571ZOF7RTZ8iRIpi
	CcEw==
X-Gm-Message-State: APjAAAVP9qEDulbZspi6bN8YFuVEEmJQZN4oVL3Bpo8APEbI+A81PMM+
	K+eN7McnGNrpbolN6FW2Uwi0Sg==
X-Google-Smtp-Source: APXvYqyDhvTDMLZyahHsOHOgpsHCpfII7U3/p7JTI+IDY5mLNcGC6WwwHLjUA/podhWODKZsrVDCOA==
X-Received: by 2002:a50:bdc2:: with SMTP id z2mr16007456edh.245.1561125471587; 
	Fri, 21 Jun 2019 06:57:51 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk.
	[85.204.121.218])
	by smtp.gmail.com with ESMTPSA id y3sm839335edr.27.2019.06.21.06.57.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:57:50 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id F33F81804B4; Fri, 21 Jun 2019 09:57:48 -0400 (EDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: David Ahern <dsahern@gmail.com>, Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Stats for XDP actions
In-Reply-To: <cd9136ff-4127-72a5-0857-2e5641ba5252@gmail.com>
References: <1548934830-2389-1-git-send-email-makita.toshiaki@lab.ntt.co.jp>
	<20190131101516-mutt-send-email-mst@kernel.org>
	<20190131.094523.2248120325911339180.davem@davemloft.net>
	<20190131211555.3b15c81f@carbon>
	<b8c97120-851f-450f-dc71-59350236329e@gmail.com>
	<20190204125307.08492005@redhat.com>
	<bdcfedd6-465d-4485-e268-25c4ce6b9fcf@gmail.com>
	<87tvevpf0y.fsf@toke.dk>
	<44ae964a-d3dd-6b7f-4bcc-21e07525bf41@gmail.com>
	<87sgs46la6.fsf@toke.dk>
	<cd9136ff-4127-72a5-0857-2e5641ba5252@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 21 Jun 2019 09:57:48 -0400
Message-ID: <87k1df6nxf.fsf@toke.dk>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>, hawk@kernel.org,
	mst@redhat.com, netdev@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Saeed Mahameed <saeedm@mellanox.com>, makita.toshiaki@lab.ntt.co.jp,
	Daniel Borkmann <borkmann@iogearbox.net>,
	David Miller <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>
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

RGF2aWQgQWhlcm4gPGRzYWhlcm5AZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9uIDYvMjAvMTkgMjo0
MiBQTSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+Pj4+IEkgZG9uJ3QgcmVjYWxs
IHNlZWluZyBhbnkgZm9sbG93LXVwIG9uIHRoaXMuIERpZCB5b3UgaGF2ZSBhIGNoYW5jZSB0bwo+
Pj4+IGZvcm11bGF0ZSB5b3VyIGlkZWFzPyA6KQo+Pj4+Cj4+Pgo+Pj4gTm90IHlldC4gQWxtb3N0
IGRvbmUgd2l0aCB0aGUgbmV4dGhvcCBjaGFuZ2VzLiBPbmNlIHRoYXQgaXMgb3V0IG9mIHRoZQo+
Pj4gd2F5IEkgY2FuIGNvbWUgYmFjayB0byB0aGlzLgo+PiAKPj4gUGluZz8gOikKPj4gCj4KPiBE
ZWZpbml0ZWx5IGJhY2sgdG8gdGhpcyBhZnRlciB0aGUgSnVseSA0dGggaG9saWRheS4KCkF3ZXNv
bWUhIEknbGwgd2FpdCB1bnRpbCB0aGVuIGJlZm9yZSBidWdnaW5nIHlvdSBhZ2Fpbi4uLiA7KQoK
LVRva2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
