Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC57CD2F
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 21:51:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5CD35413F;
	Wed, 31 Jul 2019 19:51:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50DA54167
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 19:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 232FA7DB
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 19:37:41 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id j8so27419562uan.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 12:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=+bKc7B4JzgT9DtuNjUTDcn35OMgA2VDnh+9KjBEbSOU=;
	b=C5evHELvdt7/9i0jlch6Sf9hvz7zYBIP4gK4BeBCgHbOEeuiLBlOfxov8L/Cn5FOlM
	gF3lpr3O/xwAitvvuwwkhrxB7xK807JpNAkcUaE7vicpKHuzZJ2Dm6HSFrqEO5P1Wfbn
	idZIPJaIxH2jpxeknSDFkhtUNqPPAPRBRsJh0NWIW82Pm01kJzDk26xPDiqrtaaDc+2u
	YiDQdMksZJjI1P8EV1F1+C/IHCAy8BmymR4xY1+m59xsZM6PW/NUzUFFlccvB27PWWCV
	A8B18a05WoodkOLGz83ioQt7u+HhFBndK71h7s5VXVzdnvSR3gk7BV86mYphXbahj+Ii
	Efeg==
X-Gm-Message-State: APjAAAUNxNmu8xkrjUJ/afj+7ldaSNb/Ve0fSLQZWpDjBFO9ZXYbH3g7
	3PyKRbu7uPjNUrSd4HvhiCXYFw==
X-Google-Smtp-Source: APXvYqw/uC7Sg0RgYeqV/6ZnjT1WzyZlwnkKUfrWxPSyTzC349Dq5/eLPf4Pq8CVGYdLBk+RnFtD3Q==
X-Received: by 2002:ab0:175:: with SMTP id 108mr75476010uak.136.1564601860284; 
	Wed, 31 Jul 2019 12:37:40 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	a23sm8006371vkl.52.2019.07.31.12.37.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 12:37:39 -0700 (PDT)
Date: Wed, 31 Jul 2019 15:37:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH V2 4/9] vhost: reset invalidate_count in
	vhost_set_vring_num_addr()
Message-ID: <20190731153640-mutt-send-email-mst@kernel.org>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-5-jasowang@redhat.com>
	<20190731124124.GD3946@ziepe.ca>
	<31ef9ed4-d74a-3454-a57d-fa843a3a802b@redhat.com>
	<20190731193252.GH3946@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731193252.GH3946@ziepe.ca>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDQ6MzI6NTJQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDA5OjI5OjI4UE0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9uIDIwMTkvNy8zMSDkuIvljYg4OjQxLCBKYXNvbiBHdW50
aG9ycGUgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDA0OjQ2OjUwQU0gLTA0
MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gVGhlIHZob3N0X3NldF92cmluZ19udW1fYWRk
cigpIGNvdWxkIGJlIGNhbGxlZCBpbiB0aGUgbWlkZGxlIG9mCj4gPiA+ID4gaW52YWxpZGF0ZV9y
YW5nZV9zdGFydCgpIGFuZCBpbnZhbGlkYXRlX3JhbmdlX2VuZCgpLiBJZiB3ZSBkb24ndCByZXNl
dAo+ID4gPiA+IGludmFsaWRhdGVfY291bnQgYWZ0ZXIgdGhlIHVuLXJlZ2lzdGVyaW5nIG9mIE1N
VSBub3RpZmllciwgdGhlCj4gPiA+ID4gaW52YWxpZGF0ZV9jb250IHdpbGwgcnVuIG91dCBvZiBz
eW5jIChlLmcgbmV2ZXIgcmVhY2ggemVybykuIFRoaXMgd2lsbAo+ID4gPiA+IGluIGZhY3QgZGlz
YWJsZSB0aGUgZmFzdCBhY2Nlc3NvciBwYXRoLiBGaXhpbmcgYnkgcmVzZXQgdGhlIGNvdW50IHRv
Cj4gPiA+ID4gemVyby4KPiA+ID4gPiAKPiA+ID4gPiBSZXBvcnRlZC1ieTogTWljaGFlbCBTLiBU
c2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiA+ID4gRGlkIE1pY2hhZWwgcmVwb3J0IHRoaXMgYXMg
d2VsbD8KPiA+IAo+ID4gCj4gPiBDb3JyZWN0IG1lIGlmIEkgd2FzIHdyb25nLiBJIHRoaW5rIGl0
J3MgcG9pbnQgNCBkZXNjcmliZWQgaW4KPiA+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5Lzcv
MjEvMjUuCj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQgdGhhdCBpcyB0YWxraW5nIGFib3V0Cj4gCj4g
QnV0IHRoaXMgZml4ZXMgd2hhdCBJIGRlc2NyaWJlZDoKPiAKPiBodHRwczovL2xrbWwub3JnL2xr
bWwvMjAxOS83LzIyLzU1NAo+IAo+IEphc29uCgpUaGVzZSBhcmUgdHdvIHJlYXNvbnMgZm9yIGEg
cG9zc2libGUgY291bnRlciBpbWJhbGFuY2UuClVuc3VycHJpc2luZ2x5IHRoZXkgYXJlIGJvdGgg
Zml4ZWQgaWYgeW91IHJlc2V0IHRoZSBjb3VudGVyIHRvIDAuCgotLSAKTVNUCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
