Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C1F1EB5
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 20:25:46 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E2938E1F;
	Wed,  6 Nov 2019 19:25:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 725E5C03
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 19:25:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E7FD1844
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 19:25:38 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DE073689E
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 19:25:38 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id 6so10647055qkc.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 06 Nov 2019 11:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=J/Zt/NfiTx+Ld2uAQJIUZCZlEBcXHtsRtDQxesGEOxE=;
	b=FL21vQVXcEI1j7brN/QkjzqyXVaCiaSDNguP3jtfplbq+OsbSyDIKHKVWc4CbPWboA
	iR+sTa2V9KYQKIKUlSi4E4t3N5BFUNBShivwetB59Y36XJc98KFEwPTxcRPix0i/RwDX
	ek5bur8PQODVVEZO0owwIUPskaQO1iCh/xmxZUdyMh2oFc+aLvHBak0iE02CQTwA7qe6
	v3WjEqT08daQ4wMTJ0UEjzsJOBPHAbda8j5l28pOlNIwNCCcZmK7jddE6EFaJobvpzOo
	IJKdZYhKkHmOsYOXPJDKi0sbOPRLPworWmRROGbOSGf95F7xqtzhRowWHoGUt3vPrTSM
	MH4A==
X-Gm-Message-State: APjAAAUG4sZrQ8q013LYIQrVatGgg5t7kStWHfKacTSK1MlVgUJR24qv
	lbK41mXKC7R45JKHqTtCB4aNUfJE+lSXmXflHfXVI4EZe/Hv9rAmWi/1Sf8c8k7lmlL7S5MzC/M
	fhveWuUDhJf1UflDclgajrCjte86o5uQHD1ADnn/u6g==
X-Received: by 2002:a05:620a:226:: with SMTP id
	u6mr3561032qkm.393.1573068337476; 
	Wed, 06 Nov 2019 11:25:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVUeLBA9o5ynyS/oZRBUg3gqW1DOYZfoi4p5JLJ/1OKZhj6MjBGfohoGDCJio3vEXQLJQBsQ==
X-Received: by 2002:a05:620a:226:: with SMTP id
	u6mr3560981qkm.393.1573068337135; 
	Wed, 06 Nov 2019 11:25:37 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
	by smtp.gmail.com with ESMTPSA id
	f39sm13094663qtb.26.2019.11.06.11.25.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 11:25:35 -0800 (PST)
Date: Wed, 6 Nov 2019 14:25:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V8 0/6] mdev based hardware virtio offloading support
Message-ID: <20191106142449-mutt-send-email-mst@kernel.org>
References: <20191105093240.5135-1-jasowang@redhat.com>
	<20191105105834.469675f0@x1.home>
	<393f2dc9-8c67-d3c9-6553-640b80c15aaf@redhat.com>
	<20191106120312.77a6a318@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106120312.77a6a318@x1.home>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, intel-gfx@lists.freedesktop.org,
	zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
	gor@linux.ibm.com, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTI6MDM6MTJQTSAtMDcwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFdlZCwgNiBOb3YgMjAxOSAxMTo1Njo0NiArMDgwMAo+IEphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+IAo+ID4gT24gMjAxOS8xMS82IOS4iuWNiDE6
NTgsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+ID4gT24gVHVlLCAgNSBOb3YgMjAxOSAxNzoz
MjozNCArMDgwMAo+ID4gPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gIAo+ID4gPj4gSGkgYWxsOgo+ID4gPj4KPiA+ID4+IFRoZXJlIGFyZSBoYXJkd2FyZXMg
dGhhdCBjYW4gZG8gdmlydGlvIGRhdGFwYXRoIG9mZmxvYWRpbmcgd2hpbGUKPiA+ID4+IGhhdmlu
ZyBpdHMgb3duIGNvbnRyb2wgcGF0aC4gVGhpcyBwYXRoIHRyaWVzIHRvIGltcGxlbWVudCBhIG1k
ZXYgYmFzZWQKPiA+ID4+IHVuaWZpZWQgQVBJIHRvIHN1cHBvcnQgdXNpbmcga2VybmVsIHZpcnRp
byBkcml2ZXIgdG8gZHJpdmUgdGhvc2UKPiA+ID4+IGRldmljZXMuIFRoaXMgaXMgZG9uZSBieSBp
bnRyb2R1Y2luZyBhIG5ldyBtZGV2IHRyYW5zcG9ydCBmb3IgdmlydGlvCj4gPiA+PiAodmlydGlv
X21kZXYpIGFuZCByZWdpc3RlciBpdHNlbGYgYXMgYSBuZXcga2luZCBvZiBtZGV2IGRyaXZlci4g
VGhlbgo+ID4gPj4gaXQgcHJvdmlkZXMgYSB1bmlmaWVkIHdheSBmb3Iga2VybmVsIHZpcnRpbyBk
cml2ZXIgdG8gdGFsayB3aXRoIG1kZXYKPiA+ID4+IGRldmljZSBpbXBsZW1lbnRhdGlvbi4KPiA+
ID4+Cj4gPiA+PiBUaG91Z2ggdGhlIHNlcmllcyBvbmx5IGNvbnRhaW5zIGtlcm5lbCBkcml2ZXIg
c3VwcG9ydCwgdGhlIGdvYWwgaXMgdG8KPiA+ID4+IG1ha2UgdGhlIHRyYW5zcG9ydCBnZW5lcmlj
IGVub3VnaCB0byBzdXBwb3J0IHVzZXJzcGFjZSBkcml2ZXJzLiBUaGlzCj4gPiA+PiBtZWFucyB2
aG9zdC1tZGV2WzFdIGNvdWxkIGJlIGJ1aWx0IG9uIHRvcCBhcyB3ZWxsIGJ5IHJlc3VpbmcgdGhl
Cj4gPiA+PiB0cmFuc3BvcnQuCj4gPiA+Pgo+ID4gPj4gQSBzYW1wbGUgZHJpdmVyIGlzIGFsc28g
aW1wbGVtZW50ZWQgd2hpY2ggc2ltdWxhdGUgYSB2aXJpdG8tbmV0Cj4gPiA+PiBsb29wYmFjayBl
dGhlcm5ldCBkZXZpY2Ugb24gdG9wIG9mIHZyaW5naCArIHdvcmtxdWV1ZS4gVGhpcyBjb3VsZCBi
ZQo+ID4gPj4gdXNlZCBhcyBhIHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBmb3IgcmVhbCBoYXJk
d2FyZSBkcml2ZXIuCj4gPiA+Pgo+ID4gPj4gQWxzbyBhIHJlYWwgSUNGIFZGIGRyaXZlciB3YXMg
YWxzbyBwb3N0ZWQgaGVyZVsyXSB3aGljaCBpcyBhIGdvb2QKPiA+ID4+IHJlZmVyZW5jZSBmb3Ig
dmVuZG9ycyB3aG8gaXMgaW50ZXJlc3RlZCBpbiB0aGVpciBvd24gdmlydGlvIGRhdGFwYXRoCj4g
PiA+PiBvZmZsb2FkaW5nIHByb2R1Y3QuCj4gPiA+Pgo+ID4gPj4gQ29uc2lkZXIgbWRldiBmcmFt
ZXdvcmsgb25seSBzdXBwb3J0IFZGSU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAo+ID4g
Pj4gdGhpcyBzZXJpZXMgYWxzbyBleHRlbmQgaXQgdG8gc3VwcG9ydCBvdGhlciB0eXBlcy4gVGhp
cyBpcyBkb25lCj4gPiA+PiB0aHJvdWdoIGludHJvZHVjaW5nIGNsYXNzIGlkIHRvIHRoZSBkZXZp
Y2UgYW5kIHBhaXJpbmcgaXQgd2l0aAo+ID4gPj4gaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJp
dmVyLiBPbiB0b3AsIHRoaXMgc2VyaXMgYWxzbyBkZWNvdXBsZQo+ID4gPj4gZGV2aWNlIHNwZWNp
ZmljIHBhcmVudHMgb3BzIG91dCBvZiB0aGUgY29tbW9uIG9uZXMuCj4gPiA+Pgo+ID4gPj4gUGt0
Z2VuIHRlc3Qgd2FzIGRvbmUgd2l0aCB2aXJpdG8tbmV0ICsgbXZuZXQgbG9vcCBiYWNrIGRldmlj
ZS4KPiA+ID4+Cj4gPiA+PiBQbGVhc2UgcmV2aWV3Lgo+ID4gPj4KPiA+ID4+IFsxXSBodHRwczov
L2xrbWwub3JnL2xrbWwvMjAxOS8xMC8zMS80NDAKPiA+ID4+IFsyXSBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxOS8xMC8xNS8xMjI2Cj4gPiA+Pgo+ID4gPj4gQ2hhbmdlcyBmcm9tIFY3Ogo+ID4g
Pj4gLSBkcm9wIHtzZXR8Z2V0fV9tZGV2X2ZlYXR1cmVzIGZvciB2aXJ0aW8KPiA+ID4+IC0gdHlw
byBhbmQgY29tbWVudCBzdHlsZSBmaXhlcyAgCj4gPiA+Cj4gPiA+IFNlZW1zIHdlJ3JlIG5lYXJs
eSB0aGVyZSwgYWxsIHRoZSByZW1haW5pbmcgY29tbWVudHMgYXJlIHJlbGF0aXZlbHkKPiA+ID4g
c3VwZXJmaWNpYWwsIHRob3VnaCBJIHdvdWxkIGFwcHJlY2lhdGUgYSB2OSBhZGRyZXNzaW5nIHRo
ZW0gYXMgd2VsbCBhcwo+ID4gPiB0aGUgY2hlY2twYXRjaCB3YXJuaW5nczoKPiA+ID4KPiA+ID4g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82ODk3Ny8gIAo+ID4gCj4g
PiAKPiA+IFdpbGwgZG8uCj4gPiAKPiA+IEJ0dywgZG8geW91IHBsYW4gdG8gbWVyZ2Ugdmhvc3Qt
bWRldiBwYXRjaCBvbiB0b3A/IE9yIHlvdSBwcmVmZXIgaXQgdG8gCj4gPiBnbyB0aHJvdWdoIE1p
Y2hhZWwncyB2aG9zdCB0cmVlPwo+IAo+IEkgY2FuIGluY2x1ZGUgaXQgaWYgeW91IHdpc2guICBU
aGUgbWRldiBjaGFuZ2VzIGFyZSBpc29sYXRlZCBlbm91Z2ggaW4KPiB0aGF0IHBhdGNoIHRoYXQg
SSB3b3VsZG4ndCBwcmVzdW1lIGl0LCBidXQgY2xlYXJseSBpdCB3b3VsZCByZXF1aXJlCj4gbGVz
cyBtZXJnZSBjb29yZGluYXRpb24gdG8gZHJvcCBpdCBpbiBteSB0cmVlLiAgTGV0IG1lIGtub3cu
ICBUaGFua3MsCj4gCj4gQWxleAoKSSdtIGZpbmUgd2l0aCBtZXJnaW5nIHRocm91Z2ggeW91ciB0
cmVlLiBJZiB5b3UgZG8sIGZlZWwgZnJlZSB0bwppbmNsdWRlCgpBY2tlZC1ieTogTWljaGFlbCBT
LiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KCgotLSAKTVNUCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
