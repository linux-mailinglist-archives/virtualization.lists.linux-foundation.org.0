Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C124DB8D
	for <lists.virtualization@lfdr.de>; Thu, 20 Jun 2019 22:42:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E3558DC8;
	Thu, 20 Jun 2019 20:42:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 03C39DBC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 20:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 930B9E6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 20:42:45 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r12so6584887edo.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 13:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
	:message-id:mime-version:content-transfer-encoding;
	bh=kg/vXKsNF33eTvftr/hHbD2ELxSm5XGUTYV0HrDOTPw=;
	b=EvoEoWthWuKZjdBJPRT2y+ZWAFxWke3V0I2SVrMrMGnCsUZWG0uFRi1TxgQPI5/VjD
	DTjmUT6vnpdzG4Ql3LojGis9sq8xpO7LbmldIrXCQrcQa0daoVSSg8WLpDTv3bU5YJpn
	e2uos2759SJm+boaHuS0YIS1Gmn/AbQCirsx8ax2H0p/YwM3SiKpHdEa00gLorzw8bOF
	t0KrHOWnw6NtktP3LXKc4lUD6tNNQc92fSuIkoNYG3pO06gYxvZ8Be4rUCyigTtAjLIY
	2LTaXXuT+4XwpvUFIoov/UGj/2e6q1fHADzNLz4k0r66hov0iXkpPnMaHobhTHwwgBty
	CXEg==
X-Gm-Message-State: APjAAAUQWsvqt2HeUO2Hs6EqLvpGT3vTfUbf2cFykGvn2pYbv/yeIStw
	nywo/9twFOhQSEtL5ZfFmhT4eg==
X-Google-Smtp-Source: APXvYqxm6YtOspkLjredVVCfkyeaTOtUQvWN3OQCfOTmE/G9D4JjUmzJsJML4w1yC4UbD58XiQofMw==
X-Received: by 2002:a50:cc47:: with SMTP id n7mr22159808edi.58.1561063364270; 
	Thu, 20 Jun 2019 13:42:44 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
	by smtp.gmail.com with ESMTPSA id f36sm172258ede.47.2019.06.20.13.42.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 13:42:43 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 5EC171804B2; Thu, 20 Jun 2019 16:42:41 -0400 (EDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: David Ahern <dsahern@gmail.com>, Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Stats for XDP actions
In-Reply-To: <44ae964a-d3dd-6b7f-4bcc-21e07525bf41@gmail.com>
References: <1548934830-2389-1-git-send-email-makita.toshiaki@lab.ntt.co.jp>
	<20190131101516-mutt-send-email-mst@kernel.org>
	<20190131.094523.2248120325911339180.davem@davemloft.net>
	<20190131211555.3b15c81f@carbon>
	<b8c97120-851f-450f-dc71-59350236329e@gmail.com>
	<20190204125307.08492005@redhat.com>
	<bdcfedd6-465d-4485-e268-25c4ce6b9fcf@gmail.com>
	<87tvevpf0y.fsf@toke.dk>
	<44ae964a-d3dd-6b7f-4bcc-21e07525bf41@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 20 Jun 2019 16:42:41 -0400
Message-ID: <87sgs46la6.fsf@toke.dk>
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

RGF2aWQgQWhlcm4gPGRzYWhlcm5AZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9uIDQvMTgvMTkgODoy
NCBBTSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+Pj4+Cj4+Pgo+Pj4gVW5kZXJz
dG9vZC4gSG9wZWZ1bGx5IGluIE1hcmNoIEkgd2lsbCBnZXQgc29tZSB0aW1lIHRvIGNvbWUgYmFj
ayB0byB0aGlzCj4+PiBhbmQgcHJvcG9zZSBhbiBpZGVhIG9uIHdoYXQgSSB3b3VsZCBsaWtlIHRv
IHNlZSAtIG5hbWVseSwgdGhlIGFkbWluIGhhcwo+Pj4gYSBjb25maWcgb3B0aW9uIGF0IGxvYWQg
dGltZSB0byBlbmFibGUgZHJpdmVyIGNvdW50ZXJzIHZlcnN1cyBjdXN0b20gbWFwCj4+PiBjb3Vu
dGVycy4gKG1lYW5pbmcgdGhlIG9wZXJhdG9yIG9mIHRoZSBub2RlIGNob29zZXMgc3RhbmRhcmQg
c3RhdHMgb3Zlcgo+Pj4gc3RyaWN0IHBlcmZvcm1hbmNlLikgQnV0IG9mIGNvdXJzZSB0aGF0IG1l
YW5zIHRoZSBkcml2ZXJzIGhhdmUgdGhlIGNvZGUKPj4+IHRvIGNvbGxlY3QgdGhvc2Ugc3RhdHMu
Cj4+IAo+PiBIaSBEYXZpZAo+PiAKPj4gSSBkb24ndCByZWNhbGwgc2VlaW5nIGFueSBmb2xsb3ct
dXAgb24gdGhpcy4gRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvCj4+IGZvcm11bGF0ZSB5b3VyIGlk
ZWFzPyA6KQo+PiAKPgo+IE5vdCB5ZXQuIEFsbW9zdCBkb25lIHdpdGggdGhlIG5leHRob3AgY2hh
bmdlcy4gT25jZSB0aGF0IGlzIG91dCBvZiB0aGUKPiB3YXkgSSBjYW4gY29tZSBiYWNrIHRvIHRo
aXMuCgpQaW5nPyA6KQoKLVRva2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
