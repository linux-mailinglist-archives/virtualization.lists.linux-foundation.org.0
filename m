Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBBF2D5A
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 12:21:49 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 680CC146A;
	Thu,  7 Nov 2019 11:21:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52F2B144A
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 11:21:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B8E3C710
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 11:21:40 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
	[209.85.219.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E44D84E842
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 11:21:39 +0000 (UTC)
Received: by mail-qv1-f70.google.com with SMTP id g33so179964qvd.7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 07 Nov 2019 03:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=wnfHxd+h5ByIy6pNIpYUPsi2zmTYpBRj65XvOkNtL/w=;
	b=r6NtAZj2uoqZhXThJQKzRXCF6IC4FleFQdKabhKQ147W1aJtD3fSWgZEX9irH/YYd8
	srlOIvwwBcExj13Fkz6ikCcYZqoEUS+uqx/SuD1hXx2ivUUymVT6FrQIKI7uhSSP5NNc
	B+GVVZsYkjhXR6mSMRpKA2MmUqtRFz5CrvlzYlHnzSxGgkGdKAqNEaNgbbMtzn8jPQlq
	uqTN1F8OK3YIVfwsLvK2eBzCp962fT+NwOswhZ3ktUXUcaieG2QownW9RtE0HjGLUENm
	hs1HhNlO9RgpViCroxiZQ9zQ384AUq25KDQPhJFyemuRs47GB8J9LVRjoz3ZxxH7NQJW
	D3Aw==
X-Gm-Message-State: APjAAAV2KQPojwfAsemN2LV0+Edx4PlDZqfkqj1wwzlq/NaJ6lZoMpfV
	8z6Ey4vQjOyVikuahKrcg+XAoXGm30tAQKTu0NuEMtz8mtJQjRYrRaAYUH+CJbuPaL5T6/Y9sIQ
	4n8jnIAwZyOouuFAC/GI25Hu0q9NbjOz3jCWkC9S8uQ==
X-Received: by 2002:ac8:289d:: with SMTP id i29mr3319304qti.24.1573125698895; 
	Thu, 07 Nov 2019 03:21:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLKHqje2IEEYthZFjXYN+ipb1SMK7JO7Dpv9RPMHrWqUxiMCMx6JeRQige0AiW+TwcjzGM5w==
X-Received: by 2002:ac8:289d:: with SMTP id i29mr3319270qti.24.1573125698659; 
	Thu, 07 Nov 2019 03:21:38 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
	by smtp.gmail.com with ESMTPSA id u27sm1182961qtj.5.2019.11.07.03.21.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:21:37 -0800 (PST)
Date: Thu, 7 Nov 2019 06:21:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
Message-ID: <20191107061942-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
	<20191106133531.693-7-jasowang@redhat.com>
	<20191107040700-mutt-send-email-mst@kernel.org>
	<bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
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
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
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

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzExLzcg5LiL5Y2INTowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZpY2UgdGhh
dCBzaW11bGF0ZSB2aXJ0aW8gbmV0IGRldmljZQo+ID4gPiBvdmVyIHZpcnRpbyBtZGV2IHRyYW5z
cG9ydC4gVGhlIGRldmljZSBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+ID4gPiBhbmQg
d29ya3F1ZXVlLiBBIGRldmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEg
aXMgdXNlZAo+ID4gPiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmlj
aWVudCBmb3Iga2VybmVsIHZpcnRpbwo+ID4gPiBkcml2ZXIgdG8gd29yay4KPiA+ID4gCj4gPiA+
IE9ubHkgJ3ZpcnRpbycgdHlwZSBpcyBzdXBwb3J0ZWQgcmlnaHQgbm93LiBJIHBsYW4gdG8gYWRk
ICd2aG9zdCcgdHlwZQo+ID4gPiBvbiB0b3Agd2hpY2ggcmVxdWlyZXMgc29tZSB2aXJ0dWFsIElP
TU1VIGltcGxlbWVudGVkIGluIHRoaXMgc2FtcGxlCj4gPiA+IGRyaXZlci4KPiA+ID4gCj4gPiA+
IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNrPGNvaHVja0ByZWRoYXQuY29tPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiBJJ2QgcHJlZmVyIGl0
IHRoYXQgd2UgY2FsbCB0aGlzIHNvbWV0aGluZyBlbHNlLCBlLmcuCj4gPiBtdm5ldC1sb29wYmFj
ay4gSnVzdCBzbyBwZW9wbGUgZG9uJ3QgZXhwZWN0IGEgZnVsbHkKPiA+IGZ1bmN0aW9uYWwgZGV2
aWNlIHNvbWVob3cuIENhbiBiZSByZW5hbWVkIHdoZW4gYXBwbHlpbmc/Cj4gCj4gCj4gQWN0dWFs
bHksIEkgcGxhbiB0byBleHRlbmQgaXQgYXMgYW5vdGhlciBzdGFuZGFyZCBuZXR3b3JrIGludGVy
ZmFjZSBmb3IKPiBrZXJuZWwuIEl0IGNvdWxkIGJlIGVpdGhlciBhIHN0YW5kYWxvbmUgcHNldWRv
IGRldmljZSBvciBhIHN0YWNrIGRldmljZS4KPiBEb2VzIHRoaXMgc291bmRzIGdvb2QgdG8geW91
Pwo+IAo+IFRoYW5rcwoKVGhhdCdzIGEgYmlnIGNoYW5nZSBpbiBhbiBpbnRlcmZhY2Ugc28gaXQn
cyBhIGdvb2QgcmVhc29uCnRvIHJlbmFtZSB0aGUgZHJpdmVyIGF0IHRoYXQgcG9pbnQgcmlnaHQ/
Ck9oZXJ3aXNlIHVzZXJzIG9mIGFuIG9sZCBrZXJuZWwgd291bGQgZXhwZWN0IGEgc3RhY2tlZCBk
cml2ZXIKYW5kIGdldCBhIGxvb3BiYWNrIGluc3RlYWQuCgpPciBkaWQgSSBtaXNzIHNvbWV0aGlu
Zz8KCj4gCj4gPiAKPiA+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
