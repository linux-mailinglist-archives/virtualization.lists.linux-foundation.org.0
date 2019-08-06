Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08683125
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 14:04:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6DC4AE1C;
	Tue,  6 Aug 2019 12:04:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BFA3BC7F
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 12:04:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5519D8A9
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 12:04:18 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d17so5276221qtj.8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 06 Aug 2019 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=/FPGr6jzHPYMmvLrWMP/4jeZ5wMtWr8MomConqYdxCw=;
	b=kwN8iZgGsA616k+ie7zVtqoKkPJCUoU9iiNH6foaeOBTxgKFKg+cZig/4zEdPfsbAE
	imTkOw+N/gal+1pboal/fWK91KxOgzhhMdL0iTRREJABvKyEt3Ufx9IKidWtLDpA7wlG
	9D0U+Ocv+7+jGN8gmxkVmfJqgoulbE7JQaMbA++nVny+EMylWeaEfpgkD0hSjvguAUdx
	LTme6+JAjIDsU31cell6nZpPIOasOpsE3BLX48Nh53wDpRS1MGS6UPgJlSEriefVBoaW
	X9Q/yQXt7r0a9KNgEj2XwtztzIPh4TLr8mCicotwiPelZo/OQ+sSdt6ODRD0nTuMLItg
	nPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=/FPGr6jzHPYMmvLrWMP/4jeZ5wMtWr8MomConqYdxCw=;
	b=MO+GxGR9WxjBtq4JhJ+pITicsPasNoRnrrls1m7vFYDmeNJtFld+0Bep8xsd7LFFJJ
	/v3MVTzIkt6f6fex8pcMCyLel7aUiLTdM7Icz/vNtgJWMFBQm4/xLNO9N+nXPzQCY4jV
	L/3CAEeZhG/fmu94B2cx573vlN4gVGH7oWAyn6Ivvnla5KHB8T3/X8k/LsOVv3trrG93
	dJuPzuAuMt4GNKN2qsmBbveHzqcyyUelPmV/Ol9Zw7pJyabKVNtDJk534hJdUN91B0Uy
	PYZks0rgQEOnX2smzxZI0Pc1GjzkTnpubodAtlVsYvpSwJLPUX6hCWynxlgSrM/uEG1a
	o8Zw==
X-Gm-Message-State: APjAAAV7MFjtbM3VBbJ37uWiQ5/LPiD6h3zVPt2EMY6nRUcPA/coTsgj
	NggalePNvscbbVUKxqlCnFVdaA==
X-Google-Smtp-Source: APXvYqyl6pRejslnyvYVBtbHRarAvLE8/IwB9kBOqtljVW3kFuK45lKI6xsfV3oqosPPvOz7rhnfwA==
X-Received: by 2002:ac8:252e:: with SMTP id 43mr2606764qtm.61.1565093057443;
	Tue, 06 Aug 2019 05:04:17 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	c45sm44553632qte.70.2019.08.06.05.04.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Aug 2019 05:04:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1huyCO-0003hy-5t; Tue, 06 Aug 2019 09:04:16 -0300
Date: Tue, 6 Aug 2019 09:04:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190806120416.GB11627@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<11b2a930-eae4-522c-4132-3f8a2da05666@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11b2a930-eae4-522c-4132-3f8a2da05666@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTI6MjA6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMiDkuIvljYg4OjQ2LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwNTo0MDowN1BNICswODAwLCBKYXNvbiBXYW5nIHdy
b3RlOgo+ID4gPiA+IFRoaXMgbXVzdCBiZSBhIHByb3BlciBiYXJyaWVyLCBsaWtlIGEgc3Bpbmxv
Y2ssIG11dGV4LCBvcgo+ID4gPiA+IHN5bmNocm9uaXplX3JjdS4KPiA+ID4gCj4gPiA+IEkgc3Rh
cnQgd2l0aCBzeW5jaHJvbml6ZV9yY3UoKSBidXQgYm90aCB5b3UgYW5kIE1pY2hhZWwgcmFpc2Ug
c29tZQo+ID4gPiBjb25jZXJuLgo+ID4gSSd2ZSBhbHNvIGlkbHkgd29uZGVyZWQgaWYgY2FsbGlu
ZyBzeW5jaHJvbml6ZV9yY3UoKSB1bmRlciB0aGUgdmFyaW91cwo+ID4gbW0gbG9ja3MgaXMgYSBk
ZWFkbG9jayBzaXR1YXRpb24uCj4gCj4gCj4gTWF5YmUsIHRoYXQncyB3aHkgSSBzdWdnZXN0IHRv
IHVzZSB2aG9zdF93b3JrX2ZsdXNoKCkgd2hpY2ggaXMgbXVjaAo+IGxpZ2h0d2VpZ2h0IGNhbiBj
YW4gYWNoaWV2ZSB0aGUgc2FtZSBmdW5jdGlvbi4gSXQgY2FuIGd1YXJhbnRlZSBhbGwgcHJldmlv
dXMKPiB3b3JrIGhhcyBiZWVuIHByb2Nlc3NlZCBhZnRlciB2aG9zdF93b3JrX2ZsdXNoKCkgcmV0
dXJuLgoKSWYgdGhpbmdzIGFyZSBhbHJlYWR5IHJ1bm5pbmcgaW4gYSB3b3JrLCB0aGVuIHllcywg
eW91IGNhbiBwaWdneWJhY2sKb24gdGhlIGV4aXN0aW5nIHNwaW5sb2NrcyBpbnNpZGUgdGhlIHdv
cmtxdWV1ZSBhbmQgYmUgT2sKCkhvd2V2ZXIsIGlmIHRoYXQgd29yayBpcyBkb2luZyBhbnkgY29w
eV9mcm9tX3VzZXIsIHRoZW4gdGhlIGZsdXNoCmJlY29tZXMgZGVwZW5kZW50IG9uIHN3YXAgYW5k
IGl0IHdvbid0IHdvcmsgYWdhaW4uLi4KCj4gPiA+IDEpIHNwaW5sb2NrOiBhZGQgbG90cyBvZiBv
dmVyaGVhZCBvbiBkYXRhcGF0aCwgdGhpcyBsZWFkcyAwIHBlcmZvcm1hbmNlCj4gPiA+IGltcHJv
dmVtZW50Lgo+ID4gSSB0aGluayB0aGUgdG9waWMgaGVyZSBpcyBjb3JyZWN0bmVzcyBub3QgcGVy
Zm9ybWFuY2UgaW1wcm92ZW1lbnQ+IAogCj4gQnV0IHRoZSB3aG9sZSBzZXJpZXMgaXMgdG8gc3Bl
ZWQgdXAgdmhvc3QuCgpTbz8gU3RhcnRpbmcgd2l0aCBhIHdob2xlIGJ1bmNoIG9mIGNyYXp5LCBw
b3NzaWJseSBicm9rZW4sIGxvY2tpbmcgYW5kCmNsYWltaW5nIGEgcGVyZm9ybWFuY2Ugd2luIGlz
IG5vdCByZWFzb25hYmxlLgoKPiBTcGlubG9jayBpcyBjb3JyZWN0IGJ1dCBtYWtlIHRoZSB3aG9s
ZSBzZXJpZXMgbWVhbmluZ2xlc3MgY29uc2lkZXIgaXQgd29uJ3QKPiBicmluZyBhbnkgcGVyZm9y
bWFuY2UgaW1wcm92ZW1lbnQuCgpZb3UgY2FuJ3QgaW52ZW50IGEgZmFzdGVyIHNwaW5sb2NrIGJ5
IG9wZW5jb2Rpbmcgc29tZSB3aWxkCnNjaGVtZS4gVGhlcmUgaXMgbm90aGluZyBzcGVjaWFsIGFi
b3V0IHRoZSB1c2FnZSBoZXJlLCBpdCBuZWVkcyBhCmJsb2NraW5nIGxvY2ssIHBsYWluIGFuZCBz
aW1wbGUuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
