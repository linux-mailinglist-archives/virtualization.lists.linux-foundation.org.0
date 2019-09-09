Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7BAD8AB
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 14:16:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C78F91074;
	Mon,  9 Sep 2019 12:16:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 892A11062
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 12:16:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8803682B
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 12:16:01 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05262C049E10
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 12:16:01 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id b2so15472202qtt.10
	for <virtualization@lists.linux-foundation.org>;
	Mon, 09 Sep 2019 05:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=cR0iPk7k3gak2smW+VGCzi1D6+WqwWLkfLqRmEk+oQ0=;
	b=C7XnhrIAbxQ3NTV41glxvF5RRto+mRbOEgkHzlyiMK4u+hf8LSLPhQBM+8Fhcnufw7
	UTaoR3hZXxaYpM0ccByN3qWu24ry219c5fba3wJWZ1iztQUSmNvsr+An0so6kfM10zq6
	6llk+3X2mQpuzxi6QCqJ2fq+8ojWYmAbZiwlvsJ7zGQBDAuFnt32/y1RwX85jb3PMvlu
	vgBiHwMbO53i5c8p+JSNgQgxHskkSdfXNNYTfnivQsCeA3YxnB70EKF6irUA8PHhV9h6
	ZfrghnkKbljN07FFh3sTmLZPfWpxMr/rnwa7ylgaXjodBaXZ3r/U1xuCSfvv9VhCJ+Jv
	Hb5g==
X-Gm-Message-State: APjAAAXqlXWZAyU2ZFzvVh1dB88NOaHijjDaCLoEp8aygiWYBdSULSho
	gmyV7n0k4LC2EYjkiY57Ls+UwmnG7VevH+8W5FpR8O9ZITXsHQUgEhsqT5gRMG8zsi/LosWOgQY
	uRDCMemT5mqEnnUMUWJMxWgSSyyYlY/+WFZOOEjIbCQ==
X-Received: by 2002:aed:3527:: with SMTP id a36mr23116298qte.82.1568031360374; 
	Mon, 09 Sep 2019 05:16:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTjEC9gLktIgrr/FKS4EvJdW8yr2QsPhfhm1/EGltRDxNNwBhSFB09DwZLmFGxdw8mqFXn1g==
X-Received: by 2002:aed:3527:: with SMTP id a36mr23116262qte.82.1568031360138; 
	Mon, 09 Sep 2019 05:16:00 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	g194sm7059848qke.46.2019.09.09.05.15.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 05:15:59 -0700 (PDT)
Date: Mon, 9 Sep 2019 08:15:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/2] Revert and rework on the metadata accelreation
Message-ID: <20190909081537-mutt-send-email-mst@kernel.org>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190905135907.GB6011@mellanox.com>
	<7785d39b-b4e7-8165-516c-ee6a08ac9c4e@redhat.com>
	<20190906.151505.1486178691190611604.davem@davemloft.net>
	<bb9ae371-58b7-b7fc-b728-b5c5f55d3a91@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb9ae371-58b7-b7fc-b728-b5c5f55d3a91@redhat.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	jglisse@redhat.com, jgg@mellanox.com, David Miller <davem@davemloft.net>
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

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDM6MTg6MDFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvNiDkuIvljYg5OjE1LCBEYXZpZCBNaWxsZXIgd3JvdGU6Cj4gPiBG
cm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gRGF0ZTogRnJpLCA2IFNl
cCAyMDE5IDE4OjAyOjM1ICswODAwCj4gPiAKPiA+ID4gT24gMjAxOS85LzUg5LiL5Y2IOTo1OSwg
SmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiA+IEkgdGhpbmsgeW91IHNob3VsZCBhcHBseSB0
aGUgcmV2ZXJ0IHRoaXMgY3ljbGUgYW5kIHJlYmFzZSB0aGUgb3RoZXIKPiA+ID4gPiBwYXRjaCBm
b3IgbmV4dC4uCj4gPiA+ID4gCj4gPiA+ID4gSmFzb24KPiA+ID4gWWVzLCB0aGUgcGxhbiBpcyB0
byByZXZlcnQgaW4gdGhpcyByZWxlYXNlIGN5Y2xlLgo+ID4gVGhlbiB5b3Ugc2hvdWxkIHJlc2V0
IHBhdGNoICMxIGFsbCBieSBpdHNlbGYgdGFyZ2V0dGluZyAnbmV0Jy4KPiAKPiAKPiBUaGFua3Mg
Zm9yIHRoZSByZW1pbmRpbmcuIEkgd2FudCB0aGUgcGF0Y2ggdG8gZ28gdGhyb3VnaCBNaWNoYWVs
J3Mgdmhvc3QKPiB0cmVlLCB0aGF0J3Mgd2h5IEkgZG9uJ3QgcHV0ICduZXQnIHByZWZpeC4gRm9y
IG5leHQgdGltZSwgbWF5YmUgSSBjYW4gdXNlCj4gInZob3N0IiBhcyBhIHByZWZpeCBmb3IgY2xh
c3NpZmljYXRpb24/CgpUaGF0J3MgZmluZSBieSBtZS4KCi0tIApNU1QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
